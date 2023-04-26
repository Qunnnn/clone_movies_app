import '../../domain/entities/backdrop_entity.dart';
class PosterModel extends BackDropEntity {
  final String backDropPath;
  const PosterModel({required this.backDropPath})
      : super(backdropPath: backDropPath );
  factory PosterModel.fromJson(Map<String, dynamic> json) {
    return PosterModel(backDropPath: json["backdrop_path"]);
  }
}
