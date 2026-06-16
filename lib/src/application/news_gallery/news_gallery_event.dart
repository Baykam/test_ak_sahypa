part of 'news_gallery_bloc.dart';

@immutable
sealed class NewsGalleryEvent extends Equatable {
  const NewsGalleryEvent();

  @override
  List<Object?> get props => [];
}

class LoadNewsGallary extends NewsGalleryEvent {
  final String ObjectID;
  const LoadNewsGallary(this.ObjectID);

  @override
  List<Object?> get props => [ObjectID];
}
