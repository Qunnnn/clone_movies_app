import 'dart:convert';
import 'package:clone_movies_app/features/details/details.dart';
import 'package:http/http.dart' as http;
import '../../../../features/home/data/data.dart';
import '../../../../features/intro/data/models/poster_model.dart';
import '../../../constants/constants.dart';
import '../../error/exceptions.dart';

abstract class NetworkManager {
  Future<List<PosterModel>> fetchIntroPoster();
  Future<List<PopularTvModel>> fetchPopularTvData();
  Future<List<TopRatedMovieModel>> fetchTopRatedMovieData();
  Future<List<TrendingMovieModel>> fetchTrendingMovieData({required String timeWindow});
  Future<DetailsModel> fetchDetailsModel({required int id});
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

  @override
  Future<List<PopularTvModel>> fetchPopularTvData() async {
    List<PopularTvModel> results = [];
    var url = Uri.parse("$baseUrl/tv/popular?api_key=$apiKey");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var movies = jsonDecode(response.body)["results"];
      for (var movie in movies) {
        results.add(PopularTvModel.fromJson(movie));
      }
    } else {
      throw ServerException();
    }
    return results;
  }

  @override
  Future<List<TopRatedMovieModel>> fetchTopRatedMovieData() async {
    List<TopRatedMovieModel> results = [];
    var url = Uri.parse("$baseUrl/movie/top_rated?api_key=$apiKey");
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

  @override
  Future<List<TrendingMovieModel>> fetchTrendingMovieData(
      {required String timeWindow}) async {
    List<TrendingMovieModel> results = [];
    var url = Uri.parse("$baseUrl/trending/movie/$timeWindow?api_key=$apiKey");
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
  
  @override
  Future<DetailsModel> fetchDetailsModel({required int id}) async {
    var url = Uri.parse("$baseUrl/movie/$id?api_key=$apiKey");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var detail = jsonDecode(response.body);
      return DetailsModel.fromJson(detail);
    } else {
      throw ServerException();
    }
  }
}
