import 'package:clone_movies_app/features/main/presentation/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainState> {
  MainPageBloc() : super(MainPageState(mainPage: 0)) {
    on<MainPageEvent>(
        (event, emit) => emit(MainPageState(mainPage: event.index)));
  }
}
