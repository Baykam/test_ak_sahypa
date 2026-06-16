part of 'news_gallery_bloc.dart';

@immutable
sealed class NewsGalleryState extends Equatable {
  const NewsGalleryState();

  @override
  List<Object?> get props => [];
}

final class NewsGalleryInitial extends NewsGalleryState {}

final class NewsGalleryLoading extends NewsGalleryState {}

final class NewsGallerySuccess extends NewsGalleryState {
  final List<NewsGalleryModel> newsGallery;

  const NewsGallerySuccess(this.newsGallery);

  @override
  List<Object?> get props => [newsGallery];
}

final class NewsGalleryError extends NewsGalleryState {
  final ErrorModel error;

  const NewsGalleryError(this.error);

  @override
  List<Object?> get props => [error];
}
