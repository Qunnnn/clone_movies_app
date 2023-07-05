import 'package:equatable/equatable.dart';

class MovieSearchEntity extends Equatable {
  final int id;
  final String title;
  final String poster_path;
  final String releaseDate;

    const MovieSearchEntity({
    required this.id,
    required this.poster_path,
    required this.title,
    required this.releaseDate,
  });
  @override
  List<Object?> get props => [
        id,
        poster_path,
        title,
        releaseDate,
      ];
}
