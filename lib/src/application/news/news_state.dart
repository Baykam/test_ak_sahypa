part of 'news_bloc.dart';

@immutable
sealed class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object?> get props => [];
}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class NewsSuccess extends NewsState {
  final List<NewsModel> news;

  const NewsSuccess(this.news);

  @override
  List<Object?> get props => [news];
}

final class NewsError extends NewsState {
  final ErrorModel error;

  const NewsError(this.error);

  @override
  List<Object?> get props => [error];
}
