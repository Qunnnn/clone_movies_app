part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {

  @override
  List<Object> get props => [];
}

class MovieSearchEvent extends SearchEvent {
  final String query;
  MovieSearchEvent({required this.query});
    @override
  List<Object> get props => [query];
}