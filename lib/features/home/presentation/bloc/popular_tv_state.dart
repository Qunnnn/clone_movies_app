import '../../domain/entities/entity.dart';
import 'package:equatable/equatable.dart';

abstract class PopularTvState extends Equatable {
  const PopularTvState();
  @override
  List<Object> get props => [];
}

class InitialPopularTv extends PopularTvState {}

class LoadingPopularTvState extends PopularTvState {}

class LoadedPopularTvState extends PopularTvState {
  List<Entity> movies;

  LoadedPopularTvState({required this.movies});
  @override
  List<Object> get props => [movies];
}

class ErrorPopularTvState extends PopularTvState {
  String? message;
  ErrorPopularTvState({required this.message});
  @override
  List<Object> get props => [message!];
}
