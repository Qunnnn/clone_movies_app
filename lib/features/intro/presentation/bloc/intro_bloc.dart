import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/data.dart';
import '../../domain/domain.dart';
part 'intro_event.dart';
part 'intro_state.dart';

class IntroBloc extends Bloc<Event, PosterState> {
  IntroBloc() : super(IntroInitial()) {
    on<IntroEvent>((event, emit) async {
      // TODO: implement event handler
      emit(LoadingPosterState());
      try {
        final getBackdrop = GetBackdropIntro(
            repository:
                IntroRepositoryIml(remoteDataSource: RemoteDataSourceIml()));
        final movies = await getBackdrop.excute();
        emit(LoadedIntroState(results: movies.fold((l) => [], (r) => r)));
      } catch (e) {
        print(e.toString());
      }
    });
  }
}
