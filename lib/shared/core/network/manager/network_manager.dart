import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../features/intro/data/models/poster_model.dart';
import '../../../constants/constants.dart';
import '../../error/exceptions.dart';

abstract class NetworkManager {
  Future<List<PosterModel>> fetchIntroPoster ();

}

class NetWorkManagerIml implements NetworkManager {
  @override
  Future<List<PosterModel>> fetchIntroPoster() async {
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