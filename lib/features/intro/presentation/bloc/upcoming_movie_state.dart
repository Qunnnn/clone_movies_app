part of 'upcoming_movie_bloc.dart';

abstract class UpComingMovieState extends Equatable {
  const UpComingMovieState();
  @override
  List<Object> get props => [];
}

class Initial extends UpComingMovieState {}
class Loading extends UpComingMovieState{}
class LoadedMoviesState extends UpComingMovieState {
 final List<UpComingMovieEntity> results;
 const LoadedMoviesState({required this.results});
  @override
  List<Object> get props => [results];
}
