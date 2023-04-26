
import '../../domain/entities/details_entity.dart';

class DetailsModel extends DetailsEntity {
  final String title;
  final String poster_path;
  final String overview;
  final String status;
  final List<Genres> genres;
  
 const  DetailsModel({
    required this.title,
    required this.poster_path,
    required this.overview,
    required this.status,
    required this.genres,
  }) : super(
          title: title,
          poster_path: poster_path,
          overview: overview,
          status: status,
          genres: genres,
        );

  factory DetailsModel.fromJson(Map<String, dynamic> json) {
    var list = json["genres"] as List;
    List<Genres> genresList = list.map((i) => Genres.fromJson(i)).toList();
    return DetailsModel(
      title: json["original_title"],
      poster_path: json["poster_path"],
      overview: json["overview"],
      status: json["status"],
      genres: genresList,
    );
  }
}