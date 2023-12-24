import 'package:get/get.dart';
import 'package:moviest_app/data/data.dart';
import 'package:moviest_app/model/movies_model.dart';

class AllMovieController extends GetxController {
  List movies = <Movies>[].obs;

  var selectedMovie = const Movies(
    id: 1,
    name: "John wick",
    about:
        "the about is the same for all movies but will be edited later in the course of this program",
    img: 'assets/1.jpeg',
      liked:true
  ).obs;

  @override
  void onInit() async {
    super.onInit();
    onGetAllMoviesFunction();
  }

  get getAllMovies => movies;

  Movies get getSelectedMovies => selectedMovie.value;

//  function to get all movies from the dummy data
  void onGetAllMoviesFunction() {
    movies = allMovies;
  }

  void selectedMovieFunction(Movies selected) {
    selectedMovie.value = selected;
  }
}
