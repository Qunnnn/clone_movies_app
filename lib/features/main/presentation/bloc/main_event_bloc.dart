import 'package:equatable/equatable.dart';

abstract class Event extends Equatable {
  const Event();
  @override
  List<Object> get props => [];
}


class MainPageEvent extends Event {
 final int index;
 const MainPageEvent({required this.index});
}
