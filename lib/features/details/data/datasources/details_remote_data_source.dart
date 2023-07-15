import '../../../../shared/constants/api_path.dart';
import '../models/details_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../shared/core/error/exceptions.dart';

abstract class DetailsRemoteDataSource {
  Future<DetailsModel> getDetails();
}

class DetailsRemoteDataSourceIml implements DetailsRemoteDataSource {
  final int id;
  DetailsRemoteDataSourceIml({required this.id});
  @override
  Future<DetailsModel> getDetails() async {
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
