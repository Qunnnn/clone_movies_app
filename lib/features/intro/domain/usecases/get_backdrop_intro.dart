import '../../../../core/error/errors.dart';
import 'package:dartz/dartz.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';
class GetBackdropIntro {
  final BackdropRepository repository;
  GetBackdropIntro({required this.repository});
  Future<Either<Failure, List<BackDropEntity>>> excute() async =>
      await repository.getBackdrop();
}
