import 'package:equatable/equatable.dart';

abstract class TrailerEvent extends Equatable {
  const TrailerEvent();
  @override
  List<Object> get props => [];
}

class LoadTrailerEvent extends TrailerEvent {
  final int id;
  const LoadTrailerEvent({required this.id});
    @override
  List<Object> get props => [id];
}
