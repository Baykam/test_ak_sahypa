import 'package:ak_sahypa_test/src/domain/i_news.dart';
import 'package:ak_sahypa_test/src/infrasturcture/models/index.dart';
import 'package:ak_sahypa_test/src/infrasturcture/repositories/news/news_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final INews _news;

  NewsBloc() : _news = NewsFunctions(),super(NewsInitial()) {
    on<Started>(_onStart);
  }

  void _onStart(Started event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    final result = await _news.getNews();
    result.fold(
      (error) => emit(NewsError(error)),
      (news) => emit(NewsSuccess(news)),
    );
  }
}
