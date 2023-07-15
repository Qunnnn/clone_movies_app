import 'package:clone_movies_app/features/search/domain/repositories/movie_search_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../shared/core/error/errors.dart';
import '../entities/enitity.dart';

class GetMovieSearch {
  final MovieSearchRepo movieSearchRepo;
  GetMovieSearch({required this.movieSearchRepo});
  Future<Either<Failure, List<MovieSearchEntity>>> excute(String query) async => 
 await movieSearchRepo.getMovieSearch(query);
  
  
}
