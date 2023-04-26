import '../datasources/cast_remote_data_sourche.dart';
import '../../domain/entities/cast_entity.dart';
import '../../domain/repositories/cast_repo.dart';
import '../../../../core/error/errors.dart';
import '../../../../core/error/exceptions.dart';
import 'package:dartz/dartz.dart';

class CastRepoIml implements CastRepo {
  CastRemoteDataSourceIml castRemoteDataSourceIml;
  CastRepoIml({required this.castRemoteDataSourceIml});

  @override
  Future<Either<Failure, List<CastEntity>>> getCast() async {
    try {
      final casts = await castRemoteDataSourceIml.getCast();
      return Right(casts);
    } on ServerException {
      return left(SeverFailure());
    }
  }
}
