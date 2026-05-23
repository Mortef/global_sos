// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_permission_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A controller that manages the state of location permissions and provides methods to request permissions.

@ProviderFor(LocationPermissionController)
final locationPermissionControllerProvider =
    LocationPermissionControllerProvider._();

/// A controller that manages the state of location permissions and provides methods to request permissions.
final class LocationPermissionControllerProvider
    extends
        $AsyncNotifierProvider<LocationPermissionController, LocationStatus> {
  /// A controller that manages the state of location permissions and provides methods to request permissions.
  LocationPermissionControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'locationPermissionControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$locationPermissionControllerHash();

  @$internal
  @override
  LocationPermissionController create() => LocationPermissionController();
}

String _$locationPermissionControllerHash() =>
    r'720a8cc1314cd05e9de5fa73c39d3efded552b52';

/// A controller that manages the state of location permissions and provides methods to request permissions.

abstract class _$LocationPermissionController
    extends $AsyncNotifier<LocationStatus> {
  FutureOr<LocationStatus> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<LocationStatus>, LocationStatus>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<LocationStatus>, LocationStatus>,
              AsyncValue<LocationStatus>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
