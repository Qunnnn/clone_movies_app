import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../shared/constants/api_path.dart';
import '../../../../shared/core/error/exceptions.dart';
import '../models/trending_movie_model.dart';

abstract class TrendingMovieRemoteDataSoure {
  Future<List<TrendingMovieModel>> getTrendingMovie();
}

class TrendingMovieRemoteDataSoureIml implements TrendingMovieRemoteDataSoure {
  final String timeWindow;
  TrendingMovieRemoteDataSoureIml({required this.timeWindow});
  @override
  Future<List<TrendingMovieModel>> getTrendingMovie() async {
    List<TrendingMovieModel> results = [];
    var url =
        Uri.parse("$baseUrl/trending/movie/$timeWindow?api_key=$apiKey");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var movies = jsonDecode(response.body)["results"];
      for (var movie in movies) {
        results.add(TrendingMovieModel.fromJson(movie));
      }
    } else {
      throw ServerException();
    }
    return results;
  }
}
