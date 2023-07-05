import 'package:bloc/bloc.dart';
import 'package:clone_movies_app/features/search/data/datasources/datasources.dart';
import 'package:clone_movies_app/features/search/data/repositories/movie_search_repo_iml.dart';
import 'package:clone_movies_app/features/search/domain/usecases/movie_search_usecase.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/enitity.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<MovieSearchEvent>((event, emit) async {
      emit(LoadingState());
      try  {
        final getMovieSearch = GetMovieSearch(movieSearchRepo: MovieSearchRepoIml(movieSearchDatasource: MovieSearchDataSourceIml()));
        final movies = await getMovieSearch.excute(event.query);
        emit(LoadedState(results: movies.fold((l) => [], (r) => r)));
      } catch (e) {
        print(e.toString());
      }
    });
  }
}
