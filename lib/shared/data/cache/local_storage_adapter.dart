import 'package:app/shared/data/contracts/cache/cache_storage.dart';
import 'package:localstorage/localstorage.dart';

class LocalStorageAdapter implements CacheStorage {
  const LocalStorageAdapter(this.localStorage);

  final LocalStorage localStorage;

  @override
  Future<void> save({required String key, required dynamic value}) async {
    await localStorage.setItem(key, value);
  }

  @override
  Future<dynamic> fetch(String key) async => localStorage.getItem(key);

  @override
  Future<void> delete(String key) async => localStorage.deleteItem(key);

  @override
  Future<void> clean() async => localStorage.clear();
}
