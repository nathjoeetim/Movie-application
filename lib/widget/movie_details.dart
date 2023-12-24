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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(
        () => Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              children: [
                Container(
                  width: 200.0,
                  height: 370.0,
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
            const SizedBox(
              width: 10,
            ),
            Expanded(
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
                    width: 180,
                    child: Text(
                      selectedMovie.getSelectedMovies.about,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.justify,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 30,
                        width: 80,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.thumb_up_alt,
                              color: Colors.grey,
                            ),
                            Text(
                              '10',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 80,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.thumb_down_alt,
                              color: Colors.blue,
                            ),
                            Text(
                              '120',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
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
          ],
        ),
      ),
    );
  }
}
