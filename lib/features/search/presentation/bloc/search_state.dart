part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class LoadingState extends SearchState {}

class ErrorState extends SearchState {
  final String error;
  const ErrorState({required this.error});
  @override
  List<Object> get props => [error];
}

class LoadedState extends SearchState {
  final List<MovieSearchEntity> results;
  const LoadedState({required this.results});
  @override
  List<Object> get props => [];
}
