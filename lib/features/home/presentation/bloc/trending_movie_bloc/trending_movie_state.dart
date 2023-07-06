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
  List<Entity> movies;

  LoadedState({required this.movies});
  @override
  List<Object> get props => [movies];
}
class ErrorState extends TrendingMovieState {
  String? message;

  ErrorState({required this.message});
  @override
  List<Object> get props => [message!];
}