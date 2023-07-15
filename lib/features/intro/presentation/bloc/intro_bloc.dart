import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/domain.dart';
part 'intro_event.dart';
part 'intro_state.dart';

class IntroBloc extends Bloc<Event, PosterState> {
  GetBackdropIntro getBackdropIntro;
  IntroBloc({required this.getBackdropIntro}) : super(IntroInitial()) {
    on<IntroEvent>((event, emit) async {
      // TODO: implement event handler
      emit(LoadingPosterState());
      try {
        final movies = await getBackdropIntro.excute();
        emit(LoadedIntroState(results: movies.fold((l) => [], (r) => r)));
      } catch (e) {
        print(e.toString());
      }
    });
  }
}
