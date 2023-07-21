import 'package:clone_movies_app/features/details/details.dart';

class TrailerModel extends TrailerEntity {
  @override
  final String key;
  const TrailerModel({required this.key}) : super(key: key);

  factory TrailerModel.fromJson(Map<String,dynamic> json){
    return TrailerModel(key: json['key']);
  }
}
