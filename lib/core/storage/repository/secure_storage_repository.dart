import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:global_sos/core/storage/provider/secure_storage_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'secure_storage_repository.g.dart';

@riverpod
SecureStorageRepository secureStorageRepository(Ref ref) {
  return SecureStorageRepository(ref.watch(secureStorageProvider));
}

/// Handles the persistence and retrieval of application data.
class SecureStorageRepository {
  const SecureStorageRepository(this._storage);

  final FlutterSecureStorage _storage;

  static const _warningAcknowledgedKey = 'warning_acknowledged';

  /// Fetches the user's acknowledgment status of the warning screen.
  Future<bool> fetchWarningAcknowledged() async {
    final isAcknowledged = await _storage.read(key: _warningAcknowledgedKey);
    return isAcknowledged == 'true';
  }

  /// Persists the user's acknowledgment of the warning screen.
  Future<void> saveWarningAcknowledged(bool acknowledged) async {
    await _storage.write(
      key: _warningAcknowledgedKey,
      value: acknowledged.toString(),
    );
  }
}
