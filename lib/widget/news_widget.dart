import 'package:flutter/material.dart';

class NewsWidget extends StatefulWidget {
  const NewsWidget({super.key});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    void onAddToBookMarkFnuction() {
      //
    }

    return Column(
      children: [
        Container(
          width: screen.width >= 750 ? screen.width / 2 - 45 : 0,
          height: 410,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            border: Border.all(
              color: Colors.white,
            ),
          ),
          child: Column(children: [
            Text(
              'Movie news',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyMedium?.color,
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0; i < 7; i++)
                    Container(
                      padding: const EdgeInsets.only(bottom: 9),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 70.0,
                            height: 90.0,
                            margin: const EdgeInsets.only(right: 10, top: 5),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/${i + i + 1}.jpeg',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: screen.width / 2 - 228,
                            child: const Text(
                              "New characters will be in the movie by the 27th of october 2025 , and will only be available in cinema only till the end of the year",
                              maxLines: 4,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.normal),
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: onAddToBookMarkFnuction,
                            child: const Icon(
                              Icons.bookmark_add_outlined,
                              size: 35,
                            ),
                          )
                        ],
                      ),
                    )
                ],
              ),
            ))
          ]),
        )
      ],
    );
  }
}
