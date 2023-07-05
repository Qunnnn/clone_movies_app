import 'package:clone_movies_app/features/search/domain/entities/enitity.dart';

class MovieSearchModel extends MovieSearchEntity {
  final int id;
  final String title;
  final String poster_path;
  final String releaseDate;
 const MovieSearchModel(
      {required this.id,
      required this.poster_path,
      required this.releaseDate,
      required this.title})
      : super(
            id: id,
            poster_path: poster_path,
            title: title,
            releaseDate: releaseDate);

  factory MovieSearchModel.fromJson(Map<String, dynamic> json) {
    return MovieSearchModel(
        id: json["id"],
        poster_path: json["poster_path"],
        title: json["title"],
        releaseDate: json["release_date"]);
  }
}
