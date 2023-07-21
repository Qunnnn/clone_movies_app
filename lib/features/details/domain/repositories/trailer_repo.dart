import 'package:clone_movies_app/features/details/details.dart';
import 'package:clone_movies_app/shared/core/error/errors.dart';
import 'package:dartz/dartz.dart';

abstract class TrailerRepo {
  Future<Either<Failure, TrailerEntity>> fetchTrailer({required int id});
}
