import 'package:global_sos/core/storage/provider/secure_storage_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'warning_controller.g.dart';

/// A controller that manages the state of the warning screen, specifically whether the user has acknowledged the warning or not.
@riverpod
class WarningController extends _$WarningController {
  static const _warningAcknowledgedKey = 'warning_acknowledged';

  @override
  Future<bool> build() async {
    final storage = ref.read(secureStorageProvider);
    final isWarningAcknowledged = await storage.read(
      key: _warningAcknowledgedKey,
    );
    return isWarningAcknowledged == 'true';
  }

  Future<void> acknowledgeWarning() async {
    final storage = ref.read(secureStorageProvider);
    await storage.write(key: _warningAcknowledgedKey, value: 'true');
    if (state.hasValue) {
      state = const AsyncData(true);
    }
  }
}
