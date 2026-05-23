import 'package:global_sos/feature/location_permission/service/location_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_permission_controller.g.dart';

/// A controller that manages the state of location permissions and provides methods to request permissions.
@Riverpod(keepAlive: true)
class LocationPermissionController extends _$LocationPermissionController {
  @override
  Future<LocationStatus> build() async {
    return ref.read(locationServiceProvider).checkStatus();
  }

  Future<void> requestPermission() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return ref.read(locationServiceProvider).requestPermission();
    });
  }
}
