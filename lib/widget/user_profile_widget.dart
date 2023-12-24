import 'package:flutter/material.dart';
import 'package:moviest_app/screens/user_full_screen.dart';

class UserProfileWidget extends StatefulWidget {
  const UserProfileWidget({super.key, required this.showUserSummaryfn});

  final void Function() showUserSummaryfn;

  @override
  State<UserProfileWidget> createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
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
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Samuel jonas ',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'What movies or TV shows are you currently loving? Share your recommendations with me! Let\'s create a must-watch list together. 🍿🎬',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectableText(
                '@samjon',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Icon(
                Icons.calendar_month,
                color: Colors.white,
                size: 17,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Joined May 2010',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const UserFullDetailScreen(),
                ),
              );
              widget.showUserSummaryfn();
            },
            child: const Text(
              'View profile',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
