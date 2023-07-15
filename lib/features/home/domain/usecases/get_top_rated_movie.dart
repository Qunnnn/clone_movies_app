import '../../../../shared/core/error/errors.dart';
import 'package:dartz/dartz.dart';
import '../domain.dart';

class GetTopRatedMovie {
  final TopRatedMovieRepository topRatedMovieRepository;
  GetTopRatedMovie({required this.topRatedMovieRepository});
  Future<Either<Failure, List<Entity>>> excute() async =>
      await topRatedMovieRepository.getTopRatedMovie();
}
