import '../entities/cast_entity.dart';
import '../repositories/cast_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/errors.dart';

class GetCasts {
  final CastRepo castRepo;
  GetCasts({required this.castRepo});

  Future<Either<Failure, List<CastEntity>>> execute() async =>
      await castRepo.getCast();
}
