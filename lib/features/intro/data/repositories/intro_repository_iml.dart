import '../../../../core/error/exceptions.dart';
import '../../../../core/error/errors.dart';
import '../../domain/entities/backdrop_entity.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/intro_repository.dart';
import '../datasources/remote_data_source.dart';

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
