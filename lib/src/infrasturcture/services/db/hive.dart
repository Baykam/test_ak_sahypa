// src/infrasturcture/services/db/hive.dart

import 'package:hive_flutter/adapters.dart';

final class CacheManagerHive {
  final String boxPath;

  CacheManagerHive({required this.boxPath});

  // Kutuyu güvenli bir şekilde getiren yardımcı metot
  Box<T> _getBox<T>() {
    if (!Hive.isBoxOpen(boxPath)) {
      throw HiveError('Kutu ($boxPath) henüz açılmamış! DbManager kontrol edin.');
    }
    return Hive.box<T>(boxPath);
  }

  T? get<T>({required dynamic key}) {
    return _getBox<T>().get(key);
  }

  Future<void> addList<T>({required T cache, required dynamic key}) async {
    await _getBox<T>().put(key, cache);
  }

  List<T> getList<T>() {
    return _getBox<T>().values.toList().cast<T>();
  }

  Future<void> delete<T>({required dynamic key}) async {
    await _getBox<T>().delete(key);
  }

  Future<void> clear<T>() async {
    await _getBox<T>().clear();
  }

  Future<void> putAt<T>({required T updatedCache, required int key}) async {
    await _getBox<T>().putAt(key, updatedCache);
  }

  bool isContainsData<T>(T data) {
    try {
      final w = getList<T>();
      return w.contains(data);
    } catch (e) {
      return false;
    }
  }
}