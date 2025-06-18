import 'package:get/get.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/severices/movie%20_repo.dart';

class HomeController extends GetxController {
  MovieDataModel? _movieDataModel;

  MovieDataModel? get getMovieDataModel => _movieDataModel;

  set setMovieDataModel(MovieDataModel? value) {
    _movieDataModel = value;
    update();
  }

  Future<void> movieDataList() async {
    setMovieDataModel = await MovieRepo.getMovie();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    movieDataList();
  }
}
