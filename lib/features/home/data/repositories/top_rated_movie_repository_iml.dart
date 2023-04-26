import '../../../../core/error/errors.dart';
import '../../../../core/error/exceptions.dart';
import '../datasources/top_rated_movie_remote_datasource.dart';
import '../models/top_rated_movie_model.dart';
import '../../domain/repositories/top_rated_movie_repository.dart';
import 'package:dartz/dartz.dart';

class TopRatedRepositoryIml implements TopRatedMovieRepository {
  TopRatedMovieRemoteDataSoure topRatedMovieRemoteDataSoure;
  TopRatedRepositoryIml({required this.topRatedMovieRemoteDataSoure});

  @override
  Future<Either<Failure, List<TopRatedMovieModel>>> getTopRatedMovie() async {
    try {
      final listMovies = await topRatedMovieRemoteDataSoure.getTopRatedMovie();
      return Right(listMovies);
    } on ServerException {
      return Left(SeverFailure());
    }
  }
}
