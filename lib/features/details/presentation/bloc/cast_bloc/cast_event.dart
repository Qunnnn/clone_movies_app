import 'package:equatable/equatable.dart';

abstract class CastEvent extends Equatable {
  const CastEvent();
  @override
  List<Object> get props => [];
}

class LoadCastEvent extends CastEvent {
  int id;
  LoadCastEvent({required this.id});

    @override
  List<Object> get props => [id];
}
