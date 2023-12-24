import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade500,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            padding: const EdgeInsets.only(
              right: 10,
              left: 10,
              top: 20,
              bottom: 10,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFF00CCFF),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(0),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Stack(
              children: [
                Row(
                  children: [
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/img1.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Samuel jonas',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                          overflow: TextOverflow.fade,
                          maxLines: 2,
                        ),
                        Text(
                          'Premium account',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                          ),
                          overflow: TextOverflow.fade,
                          maxLines: 2,
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
                const Positioned(
                  top: 2,
                  right: 1,
                  child: Icon(Icons.settings),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.only(top: 10, bottom: 4, right: 1),
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 10,
                  color: Colors.lightBlue,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Icon(Icons.home, color: Colors.white, size: 30),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.only(top: 10, bottom: 4, right: 1),
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 10,
                  color: Colors.lightBlue,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Icon(Icons.verified_user, color: Colors.white, size: 30),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'View Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.only(top: 10, bottom: 4, right: 1),
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 10,
                  color: Colors.lightBlue,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Icon(Icons.download, color: Colors.white, size: 30),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Downloaded Movie',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Version 0.10',
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                Icon(
                  Icons.logout,
                  color: Colors.white,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
