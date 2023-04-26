import '../../domain/entities/entity.dart';


class TopRatedMovieModel extends Entity {
  final int id;
  final String posterPath;
  final String title;
  final String realeaseDate;

  const TopRatedMovieModel({
    required this.realeaseDate,
    required this.id,
    required this.posterPath,
    required this.title,
  }) : super(
            id: id,
            posterPath: posterPath,
            title: title,
            releaseDate: realeaseDate);
  factory TopRatedMovieModel.fromJson(Map<String, dynamic> json) {
    return TopRatedMovieModel(
        id: json["id"],
        posterPath: json["poster_path"],
        title: json["title"],
        realeaseDate: json["release_date"]);
  }
}
