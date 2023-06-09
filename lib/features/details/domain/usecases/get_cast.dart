import 'package:dartz/dartz.dart';
import '../../../../core/error/errors.dart';
import '../domain.dart';

class GetCasts {
  final CastRepo castRepo;
  GetCasts({required this.castRepo});

  Future<Either<Failure, List<CastEntity>>> execute() async =>
      await castRepo.getCast();
}
