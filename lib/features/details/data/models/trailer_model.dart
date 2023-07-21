import 'package:clone_movies_app/features/details/details.dart';

class TrailerModel extends TrailerEntity {
  final String id;
  const TrailerModel({required this.id}) : super(id: id);

  factory TrailerModel.fromJson(Map<String,dynamic> json){
    return TrailerModel(id: json['id']);
  }
}
