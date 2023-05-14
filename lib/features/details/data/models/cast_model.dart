import '../../domain/entities/cast_entity.dart';


class CastModel extends CastEntity {
  final String name;
  final String profilePath;
  final String character;
  const CastModel({
    required this.name,
    required this.profilePath,
    required this.character,
  }) : super(
          name: name,
          profilePath: profilePath,
          character: character,
        );

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      name: json['name'],
      profilePath: json['profile_path'],
      character: json['character'],
    );
  }
}
