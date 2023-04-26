import '../../domain/entities/entity.dart';


class PopularTvModel extends Entity {
  final int id;
  final String posterPath;
  final String title;
  final String realeaseDate;

  const PopularTvModel({
    required this.realeaseDate,
    required this.id,
    required this.posterPath,
    required this.title,
  }) : super(
            id: id,
            posterPath: posterPath,
            title: title,
            releaseDate: realeaseDate);
  factory PopularTvModel.fromJson(Map<String, dynamic> json) {
    return PopularTvModel(
        id: json["id"],
        posterPath: json["poster_path"],
        title: json["original_name"],
        realeaseDate: json["first_air_date"]);
  }
}
