import '../../../../shared/core/error/exceptions.dart';
import '../../../../shared/core/error/errors.dart';
import '../../domain/domain.dart';
import 'package:dartz/dartz.dart';
import '../datasources/datasources.dart';


class IntroRepositoryIml implements BackdropRepository{
  RemoteDataSource remoteDataSource;
  IntroRepositoryIml({required this.remoteDataSource});
  @override
  Future<Either<Failure, List<BackDropEntity>>> getBackdrop() async {
    try {
      final listPosters = await remoteDataSource.getPosters();
      return Right(listPosters);
    } on ServerException {
      return Left(SeverFailure());
    }
  }
}
