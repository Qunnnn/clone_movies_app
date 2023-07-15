import 'package:dartz/dartz.dart';
import '../../../../shared/core/error/errors.dart';
import '../domain.dart';

class GetCasts {
  final CastRepo castRepo;
  GetCasts({required this.castRepo});

  Future<Either<Failure, List<CastEntity>>> execute({required int id}) async =>
      await castRepo.getCast(id: id);
}
