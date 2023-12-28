import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviest_app/get_provider/movie_controller.dart';
import 'package:moviest_app/model/movies_model.dart';

class MovieSummaryWidget extends StatefulWidget {
  const MovieSummaryWidget(
      {super.key, this.selectedMovie, required this.showUserSummaryfn});

  final void Function() showUserSummaryfn;
  final Movies? selectedMovie;

  @override
  State<MovieSummaryWidget> createState() => _MovieSummaryWidgetState();
}

class _MovieSummaryWidgetState extends State<MovieSummaryWidget> {
  AllMovieController selectedMovie = Get.put(AllMovieController());
  AllMovieController allMovies = Get.put(AllMovieController());

  var isLiked = false;
  var disLiked = false;

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    void onSetMovieToLikeFunction() {
      setState(() {
        isLiked = true;
        disLiked = false;
      });
    }

    void onSetDisLikedFunction() {
      setState(() {
        disLiked = true;
        isLiked = false;
      });
    }

    return Center(
      child: Obx(
        () => Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  width: screen.width < 550 ? 200.0 : 230,
                  height: screen.width < 550 ? 370.0 : 420,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    image: DecorationImage(
                      image: AssetImage(selectedMovie.getSelectedMovies.img),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Spacer(),

                // watch trailer btn
                if (screen.width < 500)
                  ElevatedButton.icon(
                    onPressed: () {
                      // Add functionality for watching the trailer
                    },
                    icon: const Icon(
                      Icons.youtube_searched_for_outlined,
                    ),
                    label: const Text(
                      'Watch Trailer',
                    ),
                  )
              ],
            ),
            SizedBox(
              width: screen.width > 550 ? 20 : 10,
            ),
            SizedBox(
              width: 180,
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      selectedMovie.getSelectedMovies.name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'September 2023',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: screen.width < 550 ? 180 : 220,
                      child: Text(
                        selectedMovie.getSelectedMovies.about,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.justify,
                        maxLines: screen.width < 530 ? 6 : 8,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Spacer(),
                    if (screen.width < 530)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: onSetMovieToLikeFunction,
                            child: Icon(
                              isLiked
                                  ? Icons.thumb_up_alt
                                  : Icons.thumb_up_alt_outlined,
                              size: 35,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: onSetDisLikedFunction,
                            child: Icon(
                              disLiked
                                  ? Icons.thumb_down_alt
                                  : Icons.thumb_down_alt_outlined,
                              size: 35,
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(
                      height: 6,
                    ),
                    // the download movie btn (this remains dissipate the media query)
                    ElevatedButton.icon(
                      onPressed: () {
                        // Add functionality for downloading
                      },
                      icon: const Icon(
                        Icons.download,
                      ),
                      label: const Text(
                        'Download',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // other recommended movies
            SizedBox(
              height: screen.width < 400 ? 7 : 20,
            ),
            if (screen.width > 550)
              SizedBox(
                width: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // watch trailer btn
                    ElevatedButton.icon(
                      onPressed: () {
                        // Add functionality for watching the trailer
                      },
                      icon: const Icon(
                        Icons.youtube_searched_for_outlined,
                      ),
                      label: const Text(
                        'Watch Trailer',
                      ),
                    ),
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: onSetMovieToLikeFunction,
                          child: Icon(
                            isLiked
                                ? Icons.thumb_up_alt
                                : Icons.thumb_up_alt_outlined,
                            size: 35,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: onSetDisLikedFunction,
                          child: Icon(
                            disLiked
                                ? Icons.thumb_down_alt
                                : Icons.thumb_down_alt_outlined,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            if (screen.width > 800)
              const SizedBox(
                width: 10,
              ),
            if (screen.width > 800)
              Expanded(
                child: Column(
                  children: [
                    const Text(
                      'Other Recommended Movies',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                        itemCount: allMovies.movies.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: (screen.width) / 2,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                // Add functionality for when a recommended movie is tapped
                              },
                              child: Image.asset(
                                allMovies.movies[index].img,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
