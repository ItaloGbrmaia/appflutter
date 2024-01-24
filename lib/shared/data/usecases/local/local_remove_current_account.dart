import 'package:app/shared/data/contracts/cache/cache_storage.dart';
import 'package:app/shared/data/contracts/local/remove_client_current_account.dart';

class LocalRemoveCurrentAccount implements RemoveClientCurrentAccount {
  const LocalRemoveCurrentAccount({required this.cacheStorage});

  final CacheStorage cacheStorage;

  @override
  Future<void> remove() async {
    try {
      await cacheStorage.clean();
    } catch (error) {
      rethrow;
    }
  }
}
