import 'package:ak_sahypa_test/src/domain/i_news.dart';
import 'package:ak_sahypa_test/src/infrasturcture/models/index.dart';
import 'package:ak_sahypa_test/src/infrasturcture/repositories/news/news_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'news_gallery_event.dart';
part 'news_gallery_state.dart';

class NewsGalleryBloc extends Bloc<NewsGalleryEvent, NewsGalleryState> {
  final INews _news;
  
  NewsGalleryBloc() :_news = NewsFunctions() ,super(NewsGalleryInitial()) {
    on<LoadNewsGallary>(_onLoadNewsGallary);
  }

  void _onLoadNewsGallary(LoadNewsGallary event, Emitter<NewsGalleryState> emit) async {
    emit(NewsGalleryLoading());
    final result = await _news.getNewsGallery(event.ObjectID);
    result.fold(
      (error) => emit(NewsGalleryError(error)),
      (newsGallery) => emit(NewsGallerySuccess(newsGallery)),
    );
  }
}
