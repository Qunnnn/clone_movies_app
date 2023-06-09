import '../../domain/entities/entity.dart';

class TrendingMovieModel extends Entity {
  @override
  final int id;
  @override
  final String posterPath;
  @override
  final String title;
  final String realeaseDate;

  const TrendingMovieModel({
    required this.realeaseDate,
    required this.id,
    required this.posterPath,
    required this.title,
  }) : super(
            id: id,
            posterPath: posterPath,
            title: title,
            releaseDate: realeaseDate);
  factory TrendingMovieModel.fromJson(Map<String, dynamic> json) {
    return TrendingMovieModel(
        id: json["id"],
        posterPath: json["poster_path"],
        title: json["title"],
        realeaseDate: json["release_date"]);
  }
}
