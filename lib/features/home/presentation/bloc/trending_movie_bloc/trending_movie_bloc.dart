import 'package:bloc/bloc.dart';
import '../../../data/datasources/trending_movie_remote_datasource.dart';
import '../../../domain/usecases/get_trending_movie.dart';
import 'trending_movie_event.dart';
import 'trending_movie_state.dart';
import '../../../data/repositories/trending_movie_repository_iml.dart';


class TrendingMovieBloc extends Bloc<TrendingMovieEvent, TrendingMovieState> {
  TrendingMovieBloc() : super(Initial()) {
    on<LoadTrendingMovie>((event, emit) async {
      emit(LoadingState());
      try {
        final useCase = GetTrendingMovie(
            trendingMovieRepository: TrendingMovieRepositoryIml(
                trendingMovieRemoteDataSoure:
                    TrendingMovieRemoteDataSoureIml(timeWindow: event.timeWindow )));
        final results = await useCase.excute();
        emit(LoadedState(movies: results.fold((l) => [], (r) => r)));
      } catch (e) {
        emit(ErrorState(message: e.toString()));
      }
    });
  }
}
