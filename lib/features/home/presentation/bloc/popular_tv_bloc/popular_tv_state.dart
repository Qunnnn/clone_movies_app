import 'package:equatable/equatable.dart';
import '../../../domain/entities/entity.dart';

abstract class PopularTvState extends Equatable {
  const PopularTvState();
  @override
  List<Object> get props => [];
}

class InitialPopularTv extends PopularTvState {}

class LoadingPopularTvState extends PopularTvState {}

class LoadedPopularTvState extends PopularTvState {
  final List<Entity> movies;
  const LoadedPopularTvState({required this.movies});
  @override
  List<Object> get props => [movies];
}

class ErrorPopularTvState extends PopularTvState {
  final String message;
  const ErrorPopularTvState({required this.message});
  @override
  List<Object> get props => [message!];
}
