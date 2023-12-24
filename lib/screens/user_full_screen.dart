import 'package:flutter/material.dart';
import 'package:moviest_app/widget/userPost/comment_widget.dart';
import 'package:moviest_app/widget/userPost/liked_movies.dart';
import 'package:moviest_app/widget/userPost/user_post.dart';

class UserFullDetailScreen extends StatefulWidget {
  const UserFullDetailScreen({Key? key}) : super(key: key);

  @override
  State<UserFullDetailScreen> createState() => _UserFullDetailScreenState();
}

class _UserFullDetailScreenState extends State<UserFullDetailScreen> {
  var showUserMenu = false;
  var showPostComment = false;
  var following = false;

  void onToggleShowMenu() {
    setState(() {
      showUserMenu = !showUserMenu;
    });
  }

  void onToggleUserMenu() {
    setState(() {
      showPostComment = !showPostComment;
    });
  }

  void onHideCommentSectionFunction() {
    setState(() {
      showPostComment = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Samuel Jonas',
            style: TextStyle(
              fontSize: 18,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                color: Colors.grey,
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: screen.width,
                          height: 170,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                          ),
                          child: Image(
                            image: const AssetImage(
                              'assets/sjblackwidow-2.png',
                            ),
                            fit: BoxFit.cover,
                            width: screen.width,
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            margin: const EdgeInsets.only(right: 10, top: 5),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/img1.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 5,
                        right: 10,
                        bottom: 20,
                      ),
                      width: screen.width,
                      color: Colors.grey,
                      child: Column(
                        crossAxisAlignment: screen.width > 350
                            ? CrossAxisAlignment.start
                            : CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Samuel Jonas',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.calendar_month_rounded,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Joined may 2003',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              // toggle user menu btn
                              if (following)
                                InkWell(
                                  onTap: onToggleShowMenu,
                                  child: Icon(
                                    showUserMenu ? Icons.menu : Icons.menu_open,
                                    color: Colors.white,
                                  ),
                                )
                            ],
                          ),
                          SizedBox(
                            height: showUserMenu ? 10 : 0,
                          ),
                          // user menu section
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            height: showUserMenu && following ? 46 : 0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 90,
                                  height: 45,
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        if (showUserMenu && following)
                                          const Icon(
                                            Icons.call,
                                          ),
                                        const SizedBox(width: 10),
                                        const Text(
                                          "Call",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 113,
                                  height: 43,
                                  padding: const EdgeInsets.all(2),
                                  decoration: const BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        if (showUserMenu && following)
                                          const Icon(
                                            Icons.message_outlined,
                                          ),
                                        const Spacer(),
                                        const Text(
                                          "Message",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 95,
                                  height: 45,
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        if (showUserMenu && following)
                                          const Icon(
                                            Icons
                                                .do_not_disturb_on_total_silence_outlined,
                                          ),
                                        const Spacer(),
                                        const Text(
                                          "Block",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // follow user btn
                          InkWell(
                            onTap: () {
                              setState(() {
                                following = !following;
                              });
                            },
                            child: Container(
                              width: screen.width > 450
                                  ? screen.width / 2 - 20
                                  : screen.width,
                              height: 35,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    following ? 'Remove' : 'Add',
                                    style: const TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                  following
                                      ? const Text('')
                                      : const Icon(
                                          Icons.add,
                                          color: Colors.black54,
                                        )
                                ],
                              ),
                            ),
                          ),
                          // view liked movies
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Liked Movies',
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          Container(
                            height: 180,
                            width: screen.width,
                            padding: const EdgeInsets.all(7),
                            decoration: const BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child:
                                const LikedMoviesWidget(), // all liked movies component
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Post',
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          //   user post
                          UserPostWidget(
                            toogleUserMenu: onToggleUserMenu,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              width: screen.width,
              child: EachUserCommentWidget(
                viewUserComment: showPostComment,
                onHideCommentSection: onHideCommentSectionFunction,
              ),
            )
          ],
        ),
      ),
    );
  }
}
