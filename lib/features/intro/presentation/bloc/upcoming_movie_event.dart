part of 'upcoming_movie_bloc.dart';

abstract class Event extends Equatable {
  const Event();
  @override
  List<Object> get props => [];
}
class FetchMovieEvent extends Event{}
