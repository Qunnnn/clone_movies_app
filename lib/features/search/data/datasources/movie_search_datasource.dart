import 'package:clone_movies_app/features/search/data/models/movie_search_model.dart';
import '../../../../constants/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../core/error/exceptions.dart';
abstract class MovieSearchDatasource {
  Future<List<MovieSearchModel>> getMovieSearch(String query);
}

class MovieSearchDataSourceIml implements MovieSearchDatasource {
  @override
  Future<List<MovieSearchModel>> getMovieSearch(String query)async {
    List<MovieSearchModel> results = [];
    var url =
        Uri.parse("$baseUrl/search/movie?api_key=$apiKey&query=$query");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var movies = jsonDecode(response.body)["results"];
      for (var movie in movies) {
        results.add(MovieSearchModel.fromJson(movie));
      }
    } else {
      throw ServerException();
    }
    return results;
  }
}
