import '../datasources/cast_remote_data_source.dart';
import '../../domain/entities/cast_entity.dart';
import '../../domain/repositories/cast_repo.dart';
import '../../../../shared/core/error/errors.dart';
import '../../../../shared/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';

class CastRepoIml implements CastRepo {
  CastRemoteDataSource castRemoteDataSource;
  CastRepoIml({required this.castRemoteDataSource});

  @override
  Future<Either<Failure, List<CastEntity>>> getCast({required int id}) async {
    try {
      final casts = await castRemoteDataSource.getCast(id: id);
      return Right(casts);
    } on ServerException {
      return left(SeverFailure());
    }
  }
}
