part of 'save_news_bloc.dart';

sealed class SaveNewsEvent extends Equatable {
  const SaveNewsEvent();

  @override
  List<Object?> get props => [];
}

// Ekleme/Güncelleme tetikleyicisi
class SaveNewsSubmitted extends SaveNewsEvent {
  final NewsModel news;

  const SaveNewsSubmitted({required this.news});

  @override
  List<Object?> get props => [news];
}

// Silme tetikleyicisi
class DeleteNewsSubmitted extends SaveNewsEvent {
  final NewsModel news;

  const DeleteNewsSubmitted({required this.news});

  @override
  List<Object?> get props => [news];
}



// Tum listeyi alan tetikleyici
class GetAllListEvent extends SaveNewsEvent {}


// State sıfırlayıcı
class ResetSaveNews extends SaveNewsEvent {}