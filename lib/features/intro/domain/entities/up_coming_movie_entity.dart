import 'package:equatable/equatable.dart';

class UpComingMovieEntity extends Equatable {
  final String backdropPath;
  final String posterPath;
  final String title;
  final int id;
  const UpComingMovieEntity(
      {required this.backdropPath,
      required this.posterPath,
      required this.title,
      required this.id});
  @override
  List<Object?> get props => [backdropPath, posterPath, title,id];
}
