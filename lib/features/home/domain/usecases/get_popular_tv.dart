import '../../../../core/error/errors.dart';
import '../entities/entity.dart';
import '../repositories/popular_tv_repo.dart';
import 'package:dartz/dartz.dart';

class GetPopularTv {
  final PopularTvRepo popularTvRepo;
  GetPopularTv({required this.popularTvRepo});
  Future<Either<Failure, List<Entity>>> excute() async =>
      await popularTvRepo.getPopularTv();
}
