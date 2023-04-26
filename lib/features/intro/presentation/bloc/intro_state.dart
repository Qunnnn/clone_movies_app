part of 'intro_bloc.dart';

abstract class PosterState extends Equatable {
  const PosterState();
  @override
  List<Object> get props => [];
}

class IntroInitial extends PosterState {}
class LoadingPosterState extends PosterState{}
class LoadedIntroState extends PosterState {
  List<BackDropEntity> results;
  LoadedIntroState({required this.results});
  @override
  List<Object> get props => [results];
}
