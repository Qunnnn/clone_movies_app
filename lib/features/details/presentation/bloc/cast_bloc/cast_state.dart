import '../../../domain/entities/cast_entity.dart';
import 'package:equatable/equatable.dart';

abstract class CastState extends Equatable {
  const CastState();
  @override
  List<Object> get props => [];
}

class CastInitial extends CastState {}

class LoadingCastState extends CastState {}

class LoadedCastState extends CastState {
  final List<CastEntity> casts;
  const LoadedCastState({required this.casts});
  @override
  List<Object> get props => [casts];
}

class ErrorCastState extends CastState {
  final String message;
  const ErrorCastState({required this.message});
  @override
  List<Object> get props => [message];
}
