
import '../../../../shared/core/error/errors.dart';
import '../entities/backdrop_entity.dart';
import 'package:dartz/dartz.dart';
abstract class UpComingRepository{
    Future<Either<Failure,List<BackDropEntity>>> getBackdrop();
}