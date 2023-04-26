import 'package:equatable/equatable.dart';

import '../../domain/entities/entity.dart';

abstract class TopRatedMovieState extends Equatable {
  const TopRatedMovieState();
  @override
  List<Object> get props => [];
}

class InitialTopRated extends TopRatedMovieState {}

class LoadingTopRatedState extends TopRatedMovieState {}

class LoadedTopRatedState extends TopRatedMovieState {
  List<Entity> movies;

  LoadedTopRatedState({required this.movies});
  @override
  List<Object> get props => [movies];
}

class ErrorTopRatedState extends TopRatedMovieState {
  String? message;
  ErrorTopRatedState({required this.message});
  @override
  List<Object> get props => [message!];
}
