import 'package:ak_sahypa_test/src/domain/i_news.dart';
import 'package:ak_sahypa_test/src/infrasturcture/models/error/model.dart';
import 'package:ak_sahypa_test/src/infrasturcture/models/news/model.dart';
import 'package:ak_sahypa_test/src/infrasturcture/models/newsGallery/model.dart';
import 'package:ak_sahypa_test/src/infrasturcture/services/network/manager.dart';
import 'package:dartz/dartz.dart';

class NewsFunctions implements INews{
  @override
  Future<Either<ErrorModel, List<NewsModel>>> getNews()async {
    String path = 'News';
    final response = await NetworkManager.i.get(url: path);
    final decode = NetworkManager.i.decode(response.bodyBytes);
    if (response.statusCode == 200){
      final list = decode['results'] as List;
      final news = list.map((e) => NewsModel.fromJson(e)).toList();
      return Right(news);
    } else{
      final error = ErrorModel.fromJson(decode);
      return Left(error);
    }
  }

  @override
  Future<Either<ErrorModel, List<NewsGalleryModel>>> getNewsGallery(String id) {
    // String path = 'NewsGallery/$id';
    String path = 'NewsGallery?where=%7B%22news%22%3A%7B%22__type%22'
        '%3A%22Pointer%22%2C%22className%22%3A%22News%22%2C%22objectId%22'
        '%3A%22$id%22%7D%7D&include=news';
    return NetworkManager.i.get(url: path).then((response) {
      final decode = NetworkManager.i.decode(response.bodyBytes);
      if (response.statusCode == 200){
        final list = decode['results'] as List;
        final newsGallery = list.map((e) => NewsGalleryModel.fromJson(e)).toList();
        print("return right");
        return Right(newsGallery);
      } else{
        print("catch error");
        final error = ErrorModel.fromJson(decode);
        print("return left");
        return Left(error);
      }
    });
  }
}