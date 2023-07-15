import '../../../../shared/core/error/errors.dart';
import '../entities/details_entity.dart';
import 'package:dartz/dartz.dart';
abstract class DetailsRepo {
  Future<Either<Failure, DetailsEntity>> getDetails({required int id});
}
