import 'package:clone_movies_app/shared/core/error/errors.dart';
import 'package:clone_movies_app/features/search/domain/entities/enitity.dart';
import 'package:dartz/dartz.dart';

abstract class MovieSearchRepo {
  Future<Either<Failure, List<MovieSearchEntity>>> getMovieSearch(String query);
}
