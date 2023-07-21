import 'package:clone_movies_app/features/details/details.dart';
import 'package:clone_movies_app/features/details/presentation/bloc/trailer_bloc/trailer_event.dart';
import 'package:clone_movies_app/features/details/presentation/bloc/trailer_bloc/trailer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrailerBloc extends Bloc<TrailerEvent, TrailerState> {
  final GetTrailer getTrailer;
  TrailerBloc({required this.getTrailer}) : super(TrailerInitial()) {
    on<LoadTrailerEvent>((event, emit) async {
      emit(TrailerLoading());
      try {
        final result = await getTrailer.execute(id: event.id);
        emit(TrailerLoaded(
            trailer:
                result.foldRight(TrailerEntity.empty(), ((r, previous) => r))));
      } catch (e) {
        print(e);
      }
    });
  }
}
