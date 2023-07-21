import 'package:clone_movies_app/features/details/details.dart';
import 'package:dartz/dartz.dart';
import '../../../../shared/core/error/errors.dart';

class GetTrailer {
  final TrailerRepo trailerRepo;
  GetTrailer({required this.trailerRepo});

  Future<Either<Failure,TrailerEntity>> execute({required int id}) async =>
      await trailerRepo.fetchTrailer(id: id);
}
