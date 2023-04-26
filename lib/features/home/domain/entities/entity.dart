import 'package:equatable/equatable.dart';

class Entity extends Equatable {
  final int id;
  final String posterPath;
  final String releaseDate;
  final String title;
  const Entity({
    required this.id,
    required this.posterPath,
    required this.title,
    required this.releaseDate,
  });
  @override
  List<Object?> get props => [
        id,
        posterPath,
        title,
      ];
}
