part of 'save_news_bloc.dart';

sealed class SaveNewsState extends Equatable {
  const SaveNewsState();

  @override
  List<Object?> get props => [];
}

// 1. Initial State: Sayfa ilk açıldığında veya işlem henüz başlamadığında
final class SaveNewsInitial extends SaveNewsState {}

// 2. Loading State: Veritabanına kaydetme isteği gönderildiğinde (Butonda Progress Indicator göstermek için)
final class SaveNewsLoading extends SaveNewsState {}

// 3. Success State: Haber başarıyla kaydedildiğinde (UI'da yeşil checkmark göstermek veya geri dönmek için)
final class SaveNewsSuccess extends SaveNewsState {
  final NewsModel savedNews; // İstersen kaydedilen son güncel modeli dönebilirsin

  const SaveNewsSuccess({required this.savedNews});

  @override
  List<Object?> get props => [savedNews];
}

// 4. Failure State: Veritabanı işlemi sırasında bir hata oluştuğunda (Snackbar ile hata basmak için)
final class SaveNewsFailure extends SaveNewsState {
  final String errorMessage;

  const SaveNewsFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

final class GetAllState extends SaveNewsState {
  final List<NewsModel> listSave;

  const GetAllState({required this.listSave});

  @override
  List<Object?> get props => [listSave];
}

