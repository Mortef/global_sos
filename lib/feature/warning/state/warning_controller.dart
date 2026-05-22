import 'package:global_sos/core/storage/repository/secure_storage_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'warning_controller.g.dart';

/// A controller that manages the state of the warning screen, specifically whether the user has acknowledged the warning or not.
@riverpod
class WarningController extends _$WarningController {
  @override
  Future<bool> build() async {
    return ref.read(secureStorageRepositoryProvider).fetchWarningAcknowledged();
  }

  Future<void> acknowledgeWarning() async {
    state = const AsyncLoading();
    await ref
        .read(secureStorageRepositoryProvider)
        .saveWarningAcknowledged(true);
    state = const AsyncData(true);
  }
}
