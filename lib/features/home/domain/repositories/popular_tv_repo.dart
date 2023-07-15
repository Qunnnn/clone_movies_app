import 'package:dartz/dartz.dart';
import '../../../../shared/core/error/errors.dart';
import '../entities/entity.dart';

abstract class PopularTvRepo{
   Future<Either<Failure,List<Entity>>> getPopularTv();
}