import '../datasources/details_remote_data_source.dart';
import '../models/details_model.dart';
import '../../domain/repositories/details_repo.dart';
import '../../../../shared/core/error/errors.dart';
import '../../../../shared/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';

class DetailsRepoIml implements DetailsRepo {
  DetailsRemoteDataSource detailsRemoteDataSource;
  DetailsRepoIml({required this.detailsRemoteDataSource});

  @override
  Future<Either<Failure, DetailsModel>> getDetails({required int id}) async {
    try {
      final details = await detailsRemoteDataSource.getDetails(id: id);
      return Right(details);
    } on ServerException {
      return left(SeverFailure());
    }
  }
}
