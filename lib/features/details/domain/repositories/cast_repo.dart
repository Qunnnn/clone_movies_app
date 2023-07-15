import '../../../../shared/core/error/errors.dart';
import '../entities/cast_entity.dart';
import 'package:dartz/dartz.dart';
abstract class CastRepo {
  Future<Either<Failure, List< CastEntity>>> getCast();
}
