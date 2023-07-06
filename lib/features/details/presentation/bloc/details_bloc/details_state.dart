part of 'details_bloc.dart';

abstract class DetailsState extends Equatable {
  const DetailsState();
  @override
  List<Object> get props => [];
}

class DetailsInitial extends DetailsState {}

class LoadingDetailsState extends DetailsState {}

class LoadedDetailsState extends DetailsState {
  DetailsEntity details;
  LoadedDetailsState({required this.details});
  @override
  List<Object> get props => [details];
}

class ErrorDetailsState extends DetailsState {
  String message;
  ErrorDetailsState({required this.message});
    @override
  List<Object> get props => [message];
}
