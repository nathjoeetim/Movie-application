import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:moviest_app/get_provider/movie_controller.dart';

class HomeScreenMoviesWidget extends StatefulWidget {
  const HomeScreenMoviesWidget({super.key, required this.showMovieSummaryfn});

  final void Function() showMovieSummaryfn;

  @override
  State<HomeScreenMoviesWidget> createState() => _HomeScreenMoviesWidgetState();
}

class _HomeScreenMoviesWidgetState extends State<HomeScreenMoviesWidget> {
  AllMovieController allMovies = Get.put(AllMovieController());

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    var movies = allMovies.getAllMovies;

    return SizedBox(
      height: screen.height,
      width: screen.width,
      child: StaggeredGridView.builder(
        gridDelegate: SliverStaggeredGridDelegateWithFixedCrossAxisCount(
          staggeredTileBuilder: (index) {
            return const StaggeredTile.fit(1);
          },
          crossAxisCount: screen.width >= 600
              ? 4
              : screen.width >= 400
                  ? 2
                  : screen.width >= 350
                      ? 1
                      : 1,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        itemCount: movies?.length ?? 0,
        itemBuilder: (context, index) {
          if (movies != null && index < movies.length) {
            var movie = movies[index];
            if (movie != null && movie.img != null) {
              return Container(
                width: (screen.width) / 2,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    allMovies.selectedMovieFunction(movie);
                    widget.showMovieSummaryfn();
                  },
                  child: Image.asset(
                    movie.img,
                    fit: BoxFit.contain,
                  ),
                ),
              );
            }
          }
          return const SizedBox
              .shrink(); // Return an empty widget if movies are null or index is out of bounds
        },
      ),
    );
  }
}
