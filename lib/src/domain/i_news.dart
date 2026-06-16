import 'package:ak_sahypa_test/src/infrasturcture/models/index.dart';
import 'package:dartz/dartz.dart';

abstract class  INews{
  Future<Either<ErrorModel, List<NewsModel>>> getNews();
  Future<Either<ErrorModel, List<NewsGalleryModel>>> getNewsGallery(String id);
}