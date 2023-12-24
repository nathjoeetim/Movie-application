import 'package:flutter/material.dart';

class UserPostWidget extends StatefulWidget {
  const UserPostWidget({super.key, required this.toogleUserMenu});

  final void Function() toogleUserMenu;

  @override
  State<UserPostWidget> createState() => _UserPostWidgetState();
}

class _UserPostWidgetState extends State<UserPostWidget> {
  //final _formKeys = List.generate(7, (index) => GlobalKey<FormState>());
  late String comment;

  void onShowUserMenuFunction() {}

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < 7; i++)
          Stack(
            children: [
              Container(
                width: screen.width,
                padding: const EdgeInsets.only(
                  top: 5,
                  bottom: 3,
                  // left: 2,
                ),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40.0,
                            height: 40.0,
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
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Samuel Jonas',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                '23rd September 2023',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 9,
                                ),
                              )
                            ],
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              var value = i;
                              if (i == value) {
                                setState(() {
                                  //postMenu = !postMenu;
                                });
                              } else {
                                return;
                              }
                            },
                            child: const Icon(
                              Icons.align_vertical_top_sharp,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        width: 350,
                        height: 70,
                        child: Text(
                          'What movies or TV shows are you currently loving? Share your recommendations with me! Let\'s create a must-watch list together. 🍿🎬',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.normal,
                            fontSize: 13,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(Icons.thumb_up_alt_outlined,
                                      color: Colors.black54),
                                  Text(
                                    '${i * 3}0K',
                                    style: const TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                onTap: widget.toogleUserMenu,
                                child: Column(
                                  children: [
                                    const Icon(Icons.comment,
                                        color: Colors.black54),
                                    Text(
                                      '${i * 12}3',
                                      style: const TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Icon(
                                Icons.mobile_screen_share,
                                color: Colors.black54,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: screen.width > 330 ? screen.width - 66 : 330,
                            height: 190,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Image.asset(
                              'assets/${i + 1}.jpeg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                      //   the comment section
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: false,
                child: Positioned(
                  top: 44,
                  right: 2,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 10),
                    height: 150,
                    width: 130,
                    child: Card(
                      color: Colors.white70.withOpacity(0.6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 30,
                            margin: const EdgeInsets.only(bottom: 5),
                            child: const Column(children: [
                              Text(
                                'Edit post',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13,
                                    overflow: TextOverflow.fade),
                              ),
                            ]),
                          ),
                          Container(
                            height: 30,
                            margin: const EdgeInsets.only(bottom: 5),
                            child: const Column(
                              children: [
                                Text(
                                  'Delete post',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                      overflow: TextOverflow.fade),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            margin: const EdgeInsets.only(bottom: 5),
                            child: const Column(
                              children: [
                                Text(
                                  'Report post',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                      overflow: TextOverflow.fade),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            margin: const EdgeInsets.only(bottom: 5),
                            child: const Column(
                              children: [
                                Text(
                                  'Report Account',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                      overflow: TextOverflow.fade),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
