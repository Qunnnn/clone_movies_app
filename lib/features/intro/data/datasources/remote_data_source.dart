import 'dart:convert';
import '../../../../constants/api_path.dart';
import '../../../../core/error/exceptions.dart';
import 'package:http/http.dart' as http;
import '../models/models.dart';


abstract class RemoteDataSource {
  Future<List<PosterModel>> getPosters();
}
class RemoteDataSourceIml implements RemoteDataSource {
  @override
  Future<List<PosterModel>> getPosters() async {
    List<PosterModel> results = [];
    var url = Uri.parse("$baseUrl/movie/upcoming?api_key=$apiKey");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var posters = jsonDecode(response.body)["results"];
      for (var poster in posters) {
        results.add(PosterModel.fromJson(poster));
      }
    } else {
      throw ServerException();
    }
    return results;
  }
}
