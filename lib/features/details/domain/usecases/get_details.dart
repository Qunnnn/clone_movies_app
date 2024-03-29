import '../entities/details_entity.dart';
import '../repositories/details_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../shared/core/error/errors.dart';

class GetDetails {
  final DetailsRepo detailsRepo;
  GetDetails({required this.detailsRepo});

  Future<Either<Failure, DetailsEntity>> execute({required int id}) async =>
      await detailsRepo.getDetails(id: id);
}
