import '../../../../shared/constants/api_path.dart';
import '../models/cast_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../shared/core/error/exceptions.dart';

abstract class CastRemoteDataSource {
  Future<List<CastModel>> getCast();
}

class CastRemoteDataSourceIml implements CastRemoteDataSource {
  final int id;
  CastRemoteDataSourceIml({required this.id});
  @override
  Future<List<CastModel>> getCast() async {
    var url = Uri.parse("$baseUrl/movie/$id/credits?api_key=$apiKey");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var casts = jsonDecode(response.body)['cast'] as List;
      List<CastModel> castList =
          casts.map((e) => CastModel.fromJson(e)).toList();
      return castList;
    } else {
      throw ServerException();
    }
  }
}
