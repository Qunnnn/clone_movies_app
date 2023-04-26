import '../../../../constants/api_path.dart';
import '../models/top_rated_movie_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../core/error/exceptions.dart';


abstract class TopRatedMovieRemoteDataSoure {
  Future<List<TopRatedMovieModel>> getTopRatedMovie();
}

class TopRatedMovieRemoteDataSoureIml implements TopRatedMovieRemoteDataSoure {

 TopRatedMovieRemoteDataSoureIml();
  @override
  Future<List<TopRatedMovieModel>> getTopRatedMovie() async {
    List<TopRatedMovieModel> results = [];
    var url =
        Uri.parse("$baseUrl/movie/top_rated?api_key=$apiKey");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var movies = jsonDecode(response.body)["results"];
      for (var movie in movies) {
        results.add(TopRatedMovieModel.fromJson(movie));
      }
    } else {
      throw ServerException();
    }
    return results;
  }
}
