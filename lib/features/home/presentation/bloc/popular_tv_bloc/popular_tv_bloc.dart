import 'package:bloc/bloc.dart';
import '../../../domain/usecases/get_popular_tv.dart';
import 'popular_tv_event.dart';
import 'popular_tv_state.dart';

class PopularTvBloc extends Bloc<PopularTvEvent, PopularTvState> {
  GetPopularTv getPopularTv;
  PopularTvBloc({required this.getPopularTv}) : super(InitialPopularTv()) {
    on<LoadPopularTvEvent>((event, emit) async {
      emit(LoadingPopularTvState());
      try {
        final results = await getPopularTv.excute();
        emit(LoadedPopularTvState(movies: results.fold((l) => [], (r) => r)));
      } catch (e) {
        emit(ErrorPopularTvState(message: e.toString()));
      }
    });
  }
}
