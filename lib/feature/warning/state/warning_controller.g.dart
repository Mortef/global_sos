// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warning_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A controller that manages the state of the warning screen, specifically whether the user has acknowledged the warning or not.

@ProviderFor(WarningController)
final warningControllerProvider = WarningControllerProvider._();

/// A controller that manages the state of the warning screen, specifically whether the user has acknowledged the warning or not.
final class WarningControllerProvider
    extends $AsyncNotifierProvider<WarningController, bool> {
  /// A controller that manages the state of the warning screen, specifically whether the user has acknowledged the warning or not.
  WarningControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'warningControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$warningControllerHash();

  @$internal
  @override
  WarningController create() => WarningController();
}

String _$warningControllerHash() => r'd7c938f80800893b917f5346096b460c9b7c5889';

/// A controller that manages the state of the warning screen, specifically whether the user has acknowledged the warning or not.

abstract class _$WarningController extends $AsyncNotifier<bool> {
  FutureOr<bool> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
