import 'dart:io';
import 'package:ak_sahypa_test/src/infrasturcture/models/index.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

class DbManager{
  static final DbManager _singleton = DbManager._internal();
  DbManager._internal();
  factory DbManager() {
    return _singleton;
  }
  static DbManager get i => _singleton;

  Future<void> init()async{
    /// directory path in devices where hive database cache memory
    Directory dir = await getApplicationCacheDirectory();

    await Hive.initFlutter(dir.path);

    Hive.registerAdapter(NewsModelAdapter());
    Hive.registerAdapter(ParseDateAdapter());

    await Hive.openBox<NewsModel>('saved_news_box');
  }
}