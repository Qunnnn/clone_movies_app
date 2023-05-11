import '../../../../core/error/errors.dart';
import '../../../../core/error/exceptions.dart';
import 'package:dartz/dartz.dart';
import '../../domain/domain.dart';
import '../data.dart';

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
