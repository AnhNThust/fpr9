import 'package:fpr9/models/item_model.dart';
import 'package:fpr9/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc{
  final _repository = Repository();

  //Tạo sink, cần import rxdart
  final _moviesFetcher = PublishSubject();
  //Tạo Stream
  Stream<ItemModel> get allMovies => _moviesFetcher.stream;
  fetchAllMovies() async {
    ItemModel itemModel = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(itemModel);
  }

  dispose(){
    _moviesFetcher.close();
  }
}