import '../../../../shared/core/error/exceptions.dart';
import '../../../../shared/core/error/errors.dart';
import '../../domain/domain.dart';
import 'package:dartz/dartz.dart';
import '../datasources/datasources.dart';


class UpComingMovieRepositoryIml implements UpComingRepository{
  RemoteDataSource remoteDataSource;
  UpComingMovieRepositoryIml({required this.remoteDataSource});
  @override
  Future<Either<Failure, List<UpComingMovieEntity>>> getBackdrop() async {
    try {
      final listPosters = await remoteDataSource.getUpcomingMovie();
      return Right(listPosters);
    } on ServerException {
      return Left(SeverFailure());
    }
  }
}
