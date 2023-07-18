import '../../../../shared/core/error/errors.dart';
import 'package:dartz/dartz.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';
class GetUpComingMovie {
  final UpComingRepository repository;
  GetUpComingMovie({required this.repository});
  Future<Either<Failure, List<UpComingMovieEntity>>> excute() async =>
      await repository.getBackdrop();
}
