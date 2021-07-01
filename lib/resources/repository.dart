import 'package:fpr9/models/item_model.dart';
import 'package:fpr9/resources/movie_api_provider.dart';

class Repository{
  final movieApiProvider = MovieApiProvider();
  Future<ItemModel> fetchAllMovies() => movieApiProvider.fetchMovieList();
}