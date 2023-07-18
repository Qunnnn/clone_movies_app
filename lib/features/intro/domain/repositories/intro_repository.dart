
import '../../../../shared/core/error/errors.dart';
import '../entities/up_coming_movie_entity.dart';
import 'package:dartz/dartz.dart';
abstract class UpComingRepository{
    Future<Either<Failure,List<UpComingMovieEntity>>> getBackdrop();
}