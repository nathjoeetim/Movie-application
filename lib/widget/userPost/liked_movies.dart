import 'package:flutter/material.dart';

class LikedMoviesWidget extends StatelessWidget {
  const LikedMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              'assets/10.jpeg',
              fit: BoxFit.contain,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              'assets/1.jpeg',
              fit: BoxFit.contain,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              'assets/2.jpeg',
              fit: BoxFit.contain,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              'assets/3.jpeg',
              fit: BoxFit.contain,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              'assets/4.jpeg',
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
