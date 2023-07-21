part of 'details_bloc.dart';

abstract class DetailsEvent extends Equatable {
  const DetailsEvent();
  @override
  List<Object> get props => [];
}

class LoadDetailsEvent extends DetailsEvent {
  final int id;
  const LoadDetailsEvent({required this.id});
  @override
  List<Object> get props => [id];
}
