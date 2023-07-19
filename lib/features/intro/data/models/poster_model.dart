import '../../domain/entities/entities.dart';

class PosterModel extends UpComingMovieEntity {
  @override
  final String backdropPath;
  @override
  final String posterPath;
  @override
  final String title;
  @override
  final int id;
  const PosterModel(
      {required this.backdropPath,
      required this.posterPath,
      required this.title,
      required this.id})
      : super(
          backdropPath: backdropPath,
          posterPath: posterPath,
          title: title,
          id: id,
        );
  factory PosterModel.fromJson(Map<String, dynamic> json) {
    return PosterModel(
      backdropPath: json["backdrop_path"],
      posterPath: json["poster_path"],
      title: json["title"],
      id: json['id'],
    );
  }
}
