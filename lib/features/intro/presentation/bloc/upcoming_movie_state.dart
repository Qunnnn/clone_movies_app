part of 'upcoming_movie_bloc.dart';

abstract class UpComingMovieState extends Equatable {
  const UpComingMovieState();
  @override
  List<Object> get props => [];
}

class Initial extends UpComingMovieState {}
class LoadingState extends UpComingMovieState{}
class LoadedMoviesState extends UpComingMovieState {
  List<BackDropEntity> results;
  LoadedMoviesState({required this.results});
  @override
  List<Object> get props => [results];
}
