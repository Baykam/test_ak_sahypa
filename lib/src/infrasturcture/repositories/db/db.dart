import 'package:ak_sahypa_test/src/domain/i_db.dart';
import 'package:ak_sahypa_test/src/infrasturcture/services/db/hive.dart';

class HiveRepository<T> implements IDB<T> {
  final CacheManagerHive _cacheManager;

  /// Hangi box üzerinde işlem yapılacağını ve cache manager'ı constructor'dan alıyoruz
  HiveRepository({required CacheManagerHive cacheManager})
      : _cacheManager = cacheManager;

  @override
  Future<T?> get({required dynamic key}) async {
    try {
      // Hatayı düzelttik: Artık direkt _cacheManager üzerinden güvenli bir şekilde çekiyoruz
      return _cacheManager.get<T>(key: key);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> set({required dynamic key, required T data}) async {
    // Verilen key ve datayı manager aracılığıyla kutuya yazıyoruz
    await _cacheManager.addList<T>(cache: data, key: key);
  }

  @override
  Future<void> delete({required dynamic key}) async {
    await _cacheManager.delete<T>(key: key);
  }

  @override
  List<T> getAll() {
    return _cacheManager.getList<T>();
  }

  @override
  Future<void> clearAll() async {
    await _cacheManager.clear<T>();
  }
}