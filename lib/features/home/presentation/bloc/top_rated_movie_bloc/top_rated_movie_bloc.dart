import 'package:bloc/bloc.dart';
import '../../../domain/usecases/get_top_rated_movie.dart';
import 'top_rated_movie_event.dart';
import 'top_rated_movie_state.dart';

class TopRatedMovieBloc extends Bloc<TopRatedMovieEvent, TopRatedMovieState> {
  GetTopRatedMovie getTopRatedMovie;
  TopRatedMovieBloc({required this.getTopRatedMovie}) : super(InitialTopRated()) {
    on<LoadTopRatedMovie>((event, emit) async {
      emit(LoadingTopRatedState());
      try {
        final results = await getTopRatedMovie.excute();
        emit(LoadedTopRatedState(movies: results.fold((l) => [], (r) => r)));
      } catch (e) {
        emit(ErrorTopRatedState(message: e.toString()));
      }
    });
  }
}
