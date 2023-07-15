import 'package:bloc/bloc.dart';
import '../../../data/datasources/popular_tv_remote_datasource.dart';
import '../../../data/repositories/popular_tv_repo_iml.dart';
import '../../../domain/usecases/get_popular_tv.dart';
import 'popular_tv_event.dart';
import 'popular_tv_state.dart';

class PopularTvBloc extends Bloc<PopularTvEvent, PopularTvState> {
  PopularTvBloc() : super(InitialPopularTv()) {
    on<LoadPopularTvEvent>((event, emit) async {
      emit(LoadingPopularTvState());
      try {
        final useCase = GetPopularTv(
            popularTvRepo: PopularTvRepoIml(
                popularTvRemoteDataSoure: PopularTvRemoteDataSoureIml()));
        final results = await useCase.excute();
        emit(LoadedPopularTvState(movies: results.fold((l) => [], (r) => r)));
      } catch (e) {
        emit(ErrorPopularTvState(message: e.toString()));
      }
    });
  }
}
