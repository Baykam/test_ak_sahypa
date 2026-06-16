import 'package:ak_sahypa_test/src/domain/i_db.dart';
import 'package:ak_sahypa_test/src/infrasturcture/models/index.dart';
import 'package:ak_sahypa_test/src/infrasturcture/repositories/db/db.dart';
import 'package:ak_sahypa_test/src/infrasturcture/services/db/hive.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'save_news_event.dart';
part 'save_news_state.dart';

class SaveNewsBloc extends Bloc<SaveNewsEvent, SaveNewsState> {
  final IDB<NewsModel> _dbRepository;

  SaveNewsBloc()
      : _dbRepository = HiveRepository(cacheManager: CacheManagerHive(boxPath: "saved_news_box")),
        super(SaveNewsInitial()) {

    on<SaveNewsSubmitted>((event, emit) async {
      emit(SaveNewsLoading());
      try {
        await _dbRepository.set(
          key: event.news.objectId,
          data: event.news,
        );

        emit(SaveNewsSuccess(savedNews: event.news));
      } catch (e) {
        emit(SaveNewsFailure(errorMessage: 'Haber kaydedilemedi: ${e.toString()}'));
      }
    });

    on<DeleteNewsSubmitted>((event, emit) async {
      emit(SaveNewsLoading());
      try {
        await _dbRepository.delete(key: event.news.objectId);

        emit(SaveNewsInitial());
      } catch (e) {
        emit(SaveNewsFailure(errorMessage: 'Haber silinemedi: ${e.toString()}'));
      }
    });

    on<ResetSaveNews>((event, emit) {
      emit(SaveNewsInitial());
    });

    on<GetAllListEvent>((event, emit) {
      try{
        final res = _dbRepository.getAll();
        emit(GetAllState(listSave: res));
      }catch(e){
        emit(SaveNewsFailure(errorMessage: 'data alamidim: ${e.toString()}'));
      }
    });
  }
}