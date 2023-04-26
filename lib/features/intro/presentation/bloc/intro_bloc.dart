import 'package:bloc/bloc.dart';
import '../../domain/entities/backdrop_entity.dart';
import 'package:equatable/equatable.dart';
import '../../data/datasources/remote_data_source.dart';
import '../../data/repositories/intro_repository_iml.dart';
import '../../domain/usecases/get_backdrop_intro.dart';
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
