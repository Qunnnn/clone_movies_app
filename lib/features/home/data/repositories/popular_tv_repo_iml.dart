import '../../../../core/error/errors.dart';
import '../../../../core/error/exceptions.dart';
import 'package:dartz/dartz.dart';
import '../../domain/domain.dart';
import '../data.dart';

class PopularTvRepoIml implements PopularTvRepo {
  PopularTvRemoteDataSoure popularTvRemoteDataSoure;
  PopularTvRepoIml({required this.popularTvRemoteDataSoure});

  @override
  Future<Either<Failure, List<PopularTvModel>>> getPopularTv() async {
    try {
      final listMovies = await popularTvRemoteDataSoure.getPopularTv();
      return Right(listMovies);
    } on ServerException {
      return Left(SeverFailure());
    }
  }


}
