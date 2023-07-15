import 'package:bloc/bloc.dart';
import 'package:clone_movies_app/features/details/details.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  GetCasts getCasts;
  CastBloc({required this.getCasts}) : super(CastInitial()) {
    on<LoadCastEvent>((event, emit) async {
      emit(LoadingCastState());
      try {
        final result = await getCasts.execute(id: event.id);
        emit(LoadedCastState(casts: result.foldRight([], (r, previous) => r)));
      } catch (e) {
        emit(ErrorCastState(message: e.toString()));
      }
    });
  }
}
