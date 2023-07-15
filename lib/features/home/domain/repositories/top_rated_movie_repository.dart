import '../../../../shared/core/error/errors.dart';
import '../entities/entity.dart';
import 'package:dartz/dartz.dart';

abstract class TopRatedMovieRepository{
   Future<Either<Failure,List<Entity>>> getTopRatedMovie();
}