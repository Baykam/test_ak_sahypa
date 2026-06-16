abstract class IDB<T> {
  /// Verilen [key] değerine ait veriyi getirir
  Future<T?> get({required dynamic key});

  /// Verilen [key] altına [data] nesnesini kaydeder veya günceller
  Future<void> set({required dynamic key, required T data});

  /// Verilen [key] değerine ait veriyi siler
  Future<void> delete({required dynamic key});

  /// Box içerisindeki tüm verileri liste olarak döner
  List<T> getAll();

  /// Box içerisindeki tüm verileri temizler
  Future<void> clearAll();
}