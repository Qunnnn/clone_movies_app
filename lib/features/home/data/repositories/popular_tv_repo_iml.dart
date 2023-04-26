import '../../../../core/error/errors.dart';
import '../../../../core/error/exceptions.dart';
import '../datasources/popular_tv_remote_datasource.dart';
import '../models/popular_tv_model.dart';
import '../../domain/repositories/popular_tv_repo.dart';
import 'package:dartz/dartz.dart';

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
