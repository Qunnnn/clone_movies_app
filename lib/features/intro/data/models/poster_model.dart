import '../../domain/entities/entities.dart';

class PosterModel extends UpComingMovieEntity {
  final String backdropPath;
  final String posterPath;
  final String title;
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
