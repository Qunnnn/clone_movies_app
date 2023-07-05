import 'package:equatable/equatable.dart';

abstract class MainState extends Equatable {
  @override
  List<Object> get props => [];
}
class MainPageState extends MainState {
  final int mainPage ;
  MainPageState({required this.mainPage});
    @override
  List<Object> get props => [mainPage];
}
