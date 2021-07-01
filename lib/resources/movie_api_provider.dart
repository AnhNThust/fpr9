import 'dart:convert';
import 'package:fpr9/models/item_model.dart';
import 'package:http/http.dart' show Client, Response;

class MovieApiProvider {
  //cần import 'package:http/http.dart' show Client
  Client client = Client();
  final _apiKey = 'd53bcfb7f2a98e3f4aa1ff34b933c7a6';
  final _baseUrl = "http://api.themoviedb.org/3/movie";

  Future fetchMovieList() async {
    // cần add : import 'package:http/http.dart' show Response;
    Response response;

    response = await client.get("$_baseUrl/popular?api_key=$_apiKey");

    if (response.statusCode == 200) {
      // cần khai báo thư viện : import 'dart:convert';
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Lỗi khi load Json");
    }
  }
}
