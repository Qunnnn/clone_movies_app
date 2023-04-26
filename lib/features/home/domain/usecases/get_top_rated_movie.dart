import '../../../../core/error/errors.dart';
import '../entities/entity.dart';
import '../repositories/top_rated_movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetTopRatedMovie {
  final TopRatedMovieRepository topRatedMovieRepository;
  GetTopRatedMovie({required this.topRatedMovieRepository});
  Future<Either<Failure, List<Entity>>> excute() async =>
      await topRatedMovieRepository.getTopRatedMovie();
}
