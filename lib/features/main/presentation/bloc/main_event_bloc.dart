import 'package:equatable/equatable.dart';

abstract class Event extends Equatable {
  const Event();
  @override
  List<Object> get props => [];
}


class MainPageEvent extends Event {
  int index;
  MainPageEvent({required this.index});
}
