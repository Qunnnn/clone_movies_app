part of 'intro_bloc.dart';

abstract class Event extends Equatable {
  const Event();
  @override
  List<Object> get props => [];
}
class IntroEvent extends Event{}
