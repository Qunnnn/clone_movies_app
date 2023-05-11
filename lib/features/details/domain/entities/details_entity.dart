import 'package:equatable/equatable.dart';

class DetailsEntity extends Equatable {
  final String title;
  final String poster_path;
  final String overview;
  final String status;
  final List<Genres> genres;

  const DetailsEntity({
    required this.title,
    required this.poster_path,
    required this.overview,
    required this.status,
    required this.genres,
  });

  factory DetailsEntity.empty() {
    return const DetailsEntity(
      title: "",
      overview: "",
      status: "",
      poster_path: "",
      genres: [],
    );
  }

  @override
  List<Object?> get props => [
        title,
        poster_path,
        overview,
        status,
        genres,
      ];
}
class Genres {
  final String? name;

  Genres({required this.name});

  factory Genres.fromJson(Map<String, dynamic> json) {
    return Genres(name: json["name"]);
  }
}