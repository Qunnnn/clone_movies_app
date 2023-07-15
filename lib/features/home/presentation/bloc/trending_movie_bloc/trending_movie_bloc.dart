import 'package:bloc/bloc.dart';
import '../../../domain/usecases/get_trending_movie.dart';
import 'trending_movie_event.dart';
import 'trending_movie_state.dart';


class TrendingMovieBloc extends Bloc<TrendingMovieEvent, TrendingMovieState> {
  GetTrendingMovie getTrendingMovie;
  TrendingMovieBloc({required this.getTrendingMovie}) : super(Initial()) {
    on<LoadTrendingMovie>((event, emit) async {
      emit(LoadingState());
      try {
        final results = await getTrendingMovie.excute(timeWindow: event.timeWindow);
        emit(LoadedState(movies: results.fold((l) => [], (r) => r)));
      } catch (e) {
        emit(ErrorState(message: e.toString()));
      }
    });
  }
}
