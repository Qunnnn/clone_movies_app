import '../../../../shared/core/error/errors.dart';
import 'package:dartz/dartz.dart';
import '../domain.dart';


class GetTrendingMovie {
  final TrendingMovieRepository trendingMovieRepository;
  GetTrendingMovie({required this.trendingMovieRepository});
  Future<Either<Failure, List<Entity>>> excute() async =>
      await trendingMovieRepository.getTrendingMovie();
}
