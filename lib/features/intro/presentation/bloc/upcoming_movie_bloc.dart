import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/domain.dart';
part 'upcoming_movie_event.dart';
part 'upcoming_movie_state.dart';

class UpComingMovieBloc extends Bloc<Event, UpComingMovieState> {
  GetUpComingMovie getUpComingMovie;
  UpComingMovieBloc({required this.getUpComingMovie}) : super(Initial()) {
    on<FetchMovieEvent>((event, emit) async {
      emit(Loading());
      try {
        final movies = await getUpComingMovie.excute();
        emit(LoadedMoviesState(results: movies.fold((l) => [], (r) => r)));
      } catch (e) {
        print(e.toString());
      }
    });
  }
}
