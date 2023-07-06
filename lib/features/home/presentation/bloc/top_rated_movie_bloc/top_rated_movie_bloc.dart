import 'package:bloc/bloc.dart';
import '../../../data/datasources/top_rated_movie_remote_datasource.dart';
import '../../../data/repositories/top_rated_movie_repository_iml.dart';
import '../../../domain/usecases/get_top_rated_movie.dart';
import 'top_rated_movie_event.dart';
import 'top_rated_movie_state.dart';

class TopRatedMovieBloc extends Bloc<TopRatedMovieEvent, TopRatedMovieState> {
  TopRatedMovieBloc() : super(InitialTopRated()) {
    on<LoadTopRatedMovie>((event, emit) async {
      emit(LoadingTopRatedState());
      try {
        final useCase = GetTopRatedMovie(
            topRatedMovieRepository: TopRatedRepositoryIml(
                topRatedMovieRemoteDataSoure:
                    TopRatedMovieRemoteDataSoureIml()));
        final results = await useCase.excute();
        emit(LoadedTopRatedState(movies: results.fold((l) => [], (r) => r)));
      } catch (e) {
        emit(ErrorTopRatedState(message: e.toString()));
      }
    });
  }
}
