// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dialer_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DialerController)
const dialerControllerProvider = DialerControllerProvider._();

final class DialerControllerProvider
    extends $NotifierProvider<DialerController, void> {
  const DialerControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dialerControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dialerControllerHash();

  @$internal
  @override
  DialerController create() => DialerController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$dialerControllerHash() => r'054b12be3ed8f44a2bcced9aa3189d7c60be5447';

abstract class _$DialerController extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
