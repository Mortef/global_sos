// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snackbar_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

/// A Riverpod provider for the SnackbarService.
/// This makes the service available throughout the app in an idiomatic way.
@ProviderFor(snackbarService)
const snackbarServiceProvider = SnackbarServiceProvider._();

/// A Riverpod provider for the SnackbarService.
/// This makes the service available throughout the app in an idiomatic way.
final class SnackbarServiceProvider
    extends
        $FunctionalProvider<SnackbarService, SnackbarService, SnackbarService>
    with $Provider<SnackbarService> {
  /// A Riverpod provider for the SnackbarService.
  /// This makes the service available throughout the app in an idiomatic way.
  const SnackbarServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'snackbarServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$snackbarServiceHash();

  @$internal
  @override
  $ProviderElement<SnackbarService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SnackbarService create(Ref ref) {
    return snackbarService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SnackbarService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SnackbarService>(value),
    );
  }
}

String _$snackbarServiceHash() => r'de99a6247f1453545e3dca8757b82dcd6775d5b1';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
