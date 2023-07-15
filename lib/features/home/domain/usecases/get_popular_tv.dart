import '../../../../shared/core/error/errors.dart';
import 'package:dartz/dartz.dart';
import '../domain.dart';

class GetPopularTv {
  final PopularTvRepo popularTvRepo;
  GetPopularTv({required this.popularTvRepo});
  Future<Either<Failure, List<Entity>>> excute() async =>
      await popularTvRepo.getPopularTv();
}
