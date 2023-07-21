import 'package:clone_movies_app/features/details/details.dart';
import 'package:equatable/equatable.dart';

abstract class TrailerState extends Equatable {
  const TrailerState();
  @override
  List<Object?> get props => [];
}

class TrailerInitial extends TrailerState {}

class TrailerLoading extends TrailerState {}

class TrailerLoaded extends TrailerState {
  final TrailerEntity trailer;
  const TrailerLoaded({required this.trailer});
    @override
  List<Object?> get props => [trailer];
}
