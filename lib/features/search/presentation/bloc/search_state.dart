part of 'search_bloc.dart';
abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class LoadingState extends SearchState {}

class LoadedState extends SearchState {
  List<MovieSearchEntity> results;
  LoadedState({required this.results});
  @override
  List<Object> get props => [];
}
