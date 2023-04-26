import '../../../../core/error/errors.dart';
import '../entities/entity.dart';
import '../repositories/trending_movie_repository.dart';
import 'package:dartz/dartz.dart';


class GetTrendingMovie {
  final TrendingMovieRepository trendingMovieRepository;
  GetTrendingMovie({required this.trendingMovieRepository});
  Future<Either<Failure, List<Entity>>> excute() async =>
      await trendingMovieRepository.getTrendingMovie();
}
