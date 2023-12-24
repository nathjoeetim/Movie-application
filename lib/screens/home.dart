import 'package:flutter/material.dart';
import 'package:moviest_app/widget/drawer_widget.dart';
import 'package:moviest_app/widget/home_screen_movies.dart';
import 'package:moviest_app/widget/movie_details.dart';
import 'package:moviest_app/widget/user_profile_widget.dart';

class HomeWidgetScreen extends StatefulWidget {
  const HomeWidgetScreen({super.key});

  @override
  State<HomeWidgetScreen> createState() => _HomeWidgetScreenState();
}

class _HomeWidgetScreenState extends State<HomeWidgetScreen>
    with TickerProviderStateMixin {
  late AnimationController _userProfileAnimationController;
  late AnimationController _movieDetailsAnimationController;
  late Animation<Offset> _userProfileOffsetAnimation;
  late Animation<Offset> _movieDetailsOffsetAnimation;
  bool viewProfile = false;
  bool viewMovieDetails = false;

  @override
  void initState() {
    super.initState();
    _userProfileAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _movieDetailsAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _userProfileOffsetAnimation = _userProfileAnimationController.drive(
      Tween<Offset>(
        begin: const Offset(0, 1),
        end: const Offset(0, 0),
      ),
    );

    _movieDetailsOffsetAnimation = _movieDetailsAnimationController.drive(
      Tween<Offset>(
        begin: const Offset(0, 1),
        end: const Offset(0, 0),
      ),
    );
  }

  void onViewUserProfileMenu() {
    setState(() {
      viewMovieDetails = false;
      viewProfile = !viewProfile;
      if (viewProfile) {
        _userProfileAnimationController.forward();
      } else {
        _userProfileAnimationController.reverse();
      }
    });
  }

  void onToggleMovieDetails() {
    setState(() {
      viewProfile = false;
      viewMovieDetails = !viewMovieDetails;
      if (viewMovieDetails) {
        _movieDetailsAnimationController.forward();
      } else {
        _movieDetailsAnimationController.reverse();
      }
    });
  }

  void onHideMovieDetailsPage() {
    setState(() {
      viewMovieDetails = false;
      _movieDetailsAnimationController.reverse();
    });
  }

  void onShowMovieSummary() {
    setState(() {
      viewProfile = false;
      viewMovieDetails = true;
      _movieDetailsAnimationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
              onTap: onViewUserProfileMenu,
              child: Container(
                width: 50.0,
                height: 50.0,
                margin: const EdgeInsets.only(right: 10, bottom: 5, top: 5),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/img1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
          backgroundColor: Colors.grey.shade200,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Movex',
                style: TextStyle(
                  foreground: Paint()
                    ..shader = const LinearGradient(
                      colors: [Color(0xFF3366FF), Color(0xFF00CCFF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(
                      const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
                    ),
                ),
              ),
            ],
          ),
        ),
        drawer: const Drawer(
          child: DrawerWidget(),
        ),
        body: Stack(
          children: [
            HomeScreenMoviesWidget(showMovieSummaryfn: onShowMovieSummary),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Visibility(
                visible: viewProfile,
                child: SlideTransition(
                  position: _userProfileOffsetAnimation,
                  child: Container(
                    height: 400,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Stack(
                      children: [
                        UserProfileWidget(
                          showUserSummaryfn: onViewUserProfileMenu,
                        ),
                        Positioned(
                          right: 2,
                          top: 2,
                          child: InkWell(
                            onTap: onViewUserProfileMenu,
                            child: const Icon(
                              Icons.close_sharp,
                              color: Colors.white70,
                              size: 25,
                            ),
                          ),
                        ),
                        Positioned(
                          // top: 100,
                          bottom: 55,
                          right: 0,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.downloading,
                                color: Colors.red),
                            label: const Text('Downloads'),
                          ),
                        ),
                        Positioned(
                          // top: 100,
                          bottom: 55,
                          left: 0,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.save_outlined,
                                color: Colors.red),
                            label: const Text('Saved movies'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Visibility(
                visible: viewMovieDetails,
                child: SlideTransition(
                  position: _movieDetailsOffsetAnimation,
                  child: Container(
                    height: 450,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Stack(
                      children: [
                        // movie details
                        MovieSummaryWidget(
                          showUserSummaryfn: onToggleMovieDetails,
                        ),
                        // close menu
                        Positioned(
                          right: 2,
                          top: 2,
                          child: InkWell(
                            onTap: onHideMovieDetailsPage,
                            child: const Icon(
                              Icons.close_sharp,
                              color: Colors.white70,
                              size: 25,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
