import '../../../../core/error/errors.dart';
import '../entities/backdrop_entity.dart';
import 'package:dartz/dartz.dart';
import '../repositories/intro_repository.dart';

class GetBackdropIntro {
  final BackdropRepository repository;
  GetBackdropIntro({required this.repository});
  Future<Either<Failure, List<BackDropEntity>>> excute() async =>
      await repository.getBackdrop();
}
