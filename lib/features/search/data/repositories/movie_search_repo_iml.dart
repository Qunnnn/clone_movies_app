import 'package:clone_movies_app/core/error/errors.dart';
import 'package:clone_movies_app/features/search/data/datasources/datasources.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/domain.dart';

class MovieSearchRepoIml implements MovieSearchRepo {
  MovieSearchDatasource movieSearchDatasource;
  MovieSearchRepoIml({required this.movieSearchDatasource});
  @override
  Future<Either<Failure, List<MovieSearchEntity>>> getMovieSearch(String query) async {
    try {
      final listMovies = await movieSearchDatasource.getMovieSearch(query);
      return Right(listMovies);
    } on ServerException {
      return Left(SeverFailure());
    }
  }
}
