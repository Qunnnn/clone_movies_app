import '../../../../core/error/errors.dart';
import '../../../../core/error/exceptions.dart';
import '../datasources/trending_movie_remote_datasource.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/trending_movie_repository.dart';
import '../models/trending_movie_model.dart';

class  TrendingMovieRepositoryIml implements TrendingMovieRepository {
  TrendingMovieRemoteDataSoure trendingMovieRemoteDataSoure;
  TrendingMovieRepositoryIml({required this.trendingMovieRemoteDataSoure});

  @override
  Future<Either<Failure, List<TrendingMovieModel>>> getTrendingMovie() async {
    try {
      final listMovies = await trendingMovieRemoteDataSoure.getTrendingMovie();
      return Right(listMovies);
    } on ServerException {
      return Left(SeverFailure());
    }
  }
}
