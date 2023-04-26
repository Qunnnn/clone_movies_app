import '../datasources/details_remote_data_source.dart';
import '../models/details_model.dart';
import '../../domain/repositories/details_repo.dart';
import '../../../../core/error/errors.dart';
import '../../../../core/error/exceptions.dart';
import 'package:dartz/dartz.dart';

class DetailsRepoIml implements DetailsRepo {
  DetailsRemoteDataSourceIml detailsRemoteDataSourceIml;
  DetailsRepoIml({required this.detailsRemoteDataSourceIml});

  @override
  Future<Either<Failure, DetailsModel>> getDetails() async {
    try {
      final details = await detailsRemoteDataSourceIml.getDetails();
      return Right(details);
    } on ServerException {
      return left(SeverFailure());
    }
  }
}
