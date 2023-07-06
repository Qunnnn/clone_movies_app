import 'package:bloc/bloc.dart';

import '../../../data/datasources/cast_remote_data_sourche.dart';
import '../../../data/repositories/cast_repo_iml.dart';
import '../../../domain/usecases/get_cast.dart';
import 'cast_event.dart';
import 'cast_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  CastBloc() : super(CastInitial()) {
    on<LoadCastEvent>((event, emit) async {
      emit(LoadingCastState());
      try {
        final useCase = GetCasts(
            castRepo: CastRepoIml(
                castRemoteDataSourceIml:
                    CastRemoteDataSourceIml(id:event.id)));

        final result = await useCase.execute();
        emit(LoadedCastState(casts: result.foldRight([], (r, previous) => r)));
      } catch (e) {
        emit(ErrorCastState(message: e.toString()));
      }
    });
  }
}
