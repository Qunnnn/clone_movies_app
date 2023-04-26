import '../../../../core/error/errors.dart';
import '../entities/entity.dart';
import 'package:dartz/dartz.dart';

abstract class TrendingMovieRepository{
   Future<Either<Failure,List<Entity>>> getTrendingMovie();
}