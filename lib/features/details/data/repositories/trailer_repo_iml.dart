import 'package:clone_movies_app/features/details/details.dart';
import 'package:clone_movies_app/shared/core/error/errors.dart';
import 'package:dartz/dartz.dart';
import '../../../../shared/core/error/exceptions.dart';

class TrailerRepoIml implements TrailerRepo {
  final TrailerRemoteDataSource trailerRemoteDataSource;
  const TrailerRepoIml({required this.trailerRemoteDataSource});
  @override
  Future<Either<Failure, TrailerModel>> fetchTrailer({required int id})async {
      try {
      final trailer = await trailerRemoteDataSource.fetchTrailer(id: id);
      return Right(trailer);
    } on ServerException {
      return left(SeverFailure());
    }
  }
}
