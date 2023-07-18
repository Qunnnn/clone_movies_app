import '../../domain/entities/entities.dart';

class PosterModel extends UpComingMovieEntity {
  final String backDropPath;
  final String posterPath;
  final String title;
  const PosterModel(
      {required this.backDropPath,
      required this.posterPath,
      required this.title})
      : super(
          backdropPath: backDropPath,
          posterPath: posterPath,
          title: title,
        );
  factory PosterModel.fromJson(Map<String, dynamic> json) {
    return PosterModel(
      backDropPath: json["backdrop_path"],
      posterPath: json["poster_path"],
      title: json["title"],
    );
  }
}
