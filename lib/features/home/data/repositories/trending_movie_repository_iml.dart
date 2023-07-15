import '../../../../shared/core/error/errors.dart';
import '../../../../shared/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';
import '../../domain/domain.dart';
import '../data.dart';




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
