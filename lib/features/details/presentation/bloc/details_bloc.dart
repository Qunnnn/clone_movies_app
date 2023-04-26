import 'package:bloc/bloc.dart';
import '../../data/datasources/details_remote_data_source.dart';
import '../../data/repositories/details_repo_iml.dart';
import '../../domain/usecases/get_details.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/details_entity.dart';
part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsInitial()) {
    on<LoadDetailsEvent>((event, emit) async {
      emit(LoadingDetailsState());
      try {
        final useCase = GetDetails(
            detailsRepo: DetailsRepoIml(
                detailsRemoteDataSourceIml:
                    DetailsRemoteDataSourceIml(id: event.id)));
        final result = await useCase.execute();
        emit(LoadedDetailsState(details: result.foldRight(DetailsEntity.empty(), (r, previous) => r)));
      } catch (e) {
        emit(ErrorDetailsState(message: e.toString()));
      }
    });
  }
}
