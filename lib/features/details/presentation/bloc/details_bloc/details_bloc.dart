import 'package:bloc/bloc.dart';
import '../../../domain/usecases/get_details.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/details_entity.dart';
part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  GetDetails getDetails;
  DetailsBloc({required this.getDetails}) : super(DetailsInitial()) {
    on<LoadDetailsEvent>((event, emit) async {
      emit(LoadingDetailsState());
      try {
        final result = await getDetails.execute(id: event.id);
        emit(LoadedDetailsState(
            details:
                result.foldRight(DetailsEntity.empty(), (r, previous) => r)));
      } catch (e) {
        emit(ErrorDetailsState(message: e.toString()));
      }
    });
  }
}
