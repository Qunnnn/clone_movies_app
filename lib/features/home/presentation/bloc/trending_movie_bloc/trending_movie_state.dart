import '../../../domain/entities/entity.dart';
import 'package:equatable/equatable.dart';

abstract class TrendingMovieState extends Equatable {
  const TrendingMovieState();

  @override
  List<Object> get props => [];
}

class Initial extends TrendingMovieState {}

class LoadingState extends TrendingMovieState {}

class LoadedState extends TrendingMovieState {
  final List<Entity> movies;
  const LoadedState({required this.movies});
  @override
  List<Object> get props => [movies];
}

class ErrorState extends TrendingMovieState {
  final String message;
  const ErrorState({required this.message});
  @override
  List<Object> get props => [message];
}
