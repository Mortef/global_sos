import 'package:geolocator/geolocator.dart';
import 'package:global_sos/core/storage/repository/secure_storage_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_service.g.dart';

enum LocationStatus { granted, denied, deniedForever, serviceDisabled }

/// Provider to expose the [LocationService] for dependency injection.
@riverpod
LocationService locationService(Ref ref) {
  final storageRepo = ref.watch(secureStorageRepositoryProvider);
  return LocationService(storageRepo);
}

/// A service that abstracts the Geolocator package and OS interactions.
///
/// Because of OS limitations, when we use [Geolocator.checkPermission], if the permission is denied forever
/// we get [LocationPermission.denied] instead of [LocationPermission.deniedForever], because of this,
/// we have to cache the permanently denied state to know in the future if it's permanently denied or not.
class LocationService {
  const LocationService(this._storageRepo);

  final SecureStorageRepository _storageRepo;

  // Passively checks status without triggering permission prompts.
  Future<LocationStatus> checkStatus() async {
    final isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) return LocationStatus.serviceDisabled;

    final permission = await Geolocator.checkPermission();

    // If granted, clear any outdated permanent denial cache.
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      await _storageRepo.saveDeniedForever(false);
      return LocationStatus.granted;
    }

    // Intercept the ambiguous 'denied' state.
    if (permission == LocationPermission.denied) {
      final isPermanentlyDenied = await _storageRepo.fetchDeniedForever();

      if (isPermanentlyDenied) return LocationStatus.deniedForever;
    }

    return _mapGeolocatorPermission(permission);
  }

  // Actively requests permission and updates the repository if a permanent denial occurs.
  Future<LocationStatus> requestPermission() async {
    final isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) return LocationStatus.serviceDisabled;

    final permission = await Geolocator.requestPermission();

    // Cache the permanent denial state so next app launch knows about it.
    if (permission == LocationPermission.deniedForever) {
      await _storageRepo.saveDeniedForever(true);
    } else {
      await _storageRepo.saveDeniedForever(false);
    }

    return _mapGeolocatorPermission(permission);
  }

  // Maps Geolocator's permission states to our app-specific LocationStatus.
  LocationStatus _mapGeolocatorPermission(LocationPermission permission) {
    return switch (permission) {
      LocationPermission.always ||
      LocationPermission.whileInUse => LocationStatus.granted,
      LocationPermission.deniedForever => LocationStatus.deniedForever,
      LocationPermission.denied ||
      LocationPermission.unableToDetermine => LocationStatus.denied,
    };
  }
}
