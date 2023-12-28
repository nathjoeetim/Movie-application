import 'package:flutter/material.dart';

class EachUserCommentWidget extends StatefulWidget {
  const EachUserCommentWidget(
      {super.key,
      required this.viewUserComment,
      required this.onHideCommentSection});

  final bool viewUserComment;
  final void Function() onHideCommentSection;

  @override
  State<EachUserCommentWidget> createState() => _EachUserCommentWidgetState();
}

class _EachUserCommentWidgetState extends State<EachUserCommentWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: widget.viewUserComment ? 520 : 0,
      child: GestureDetector(
        onVerticalDragDown: (details) => widget.onHideCommentSection,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: widget.viewUserComment ? 520 : 0,
              width: screen.width,
              padding: const EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: widget.onHideCommentSection,
                      child: Container(
                        height: 40,
                        width: 80,
                        margin: const EdgeInsets.only(left: 10),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                            color: Colors.grey),
                        child: const Center(
                          child: Text(
                            'Close',
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 380,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            for (int i = 0; i < 9; i++)
                              Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                height: 80,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  border: Border(
                                    bottom: BorderSide(color: Colors.white70),
                                  ),
                                  color: Colors.white38,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        margin: const EdgeInsets.only(
                                            right: 10, top: 5),
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
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Sancho luno',
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            maxLines: 6,
                                            textDirection: TextDirection.rtl,
                                            textAlign: TextAlign.justify,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(
                                            width: 280,
                                            child: Text(
                                              'Jonas lucas was an extra ordinary man in the movie, i like him cant wait for season 2 Jonas lucas was an extra ordinary man in the movie, i like him .... cant wait for season 2 ',
                                              style: TextStyle(
                                                overflow: TextOverflow.fade,
                                                fontSize: 9,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              maxLines: 3,
                                            ),
                                          )
                                        ],
                                      ),
                                      const Spacer(),
                                      const Icon(Icons.thumb_up_alt_outlined)
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: const Icon(Icons.attach_file),
                        ),
                        Container(
                          height: 50,
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          width: 300,
                          decoration: const BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Form(
                            key: _formKey,
                            // Use unique key for each Form
                            child: TextFormField(
                              decoration: const InputDecoration(
                                label: Text(
                                  'Comment',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              keyboardType: TextInputType.name,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black54,
                              ),
                              autocorrect: false,
                              textAlign: TextAlign.start,
                              autofillHints: const Iterable.empty(),
                            ),
                          ),
                        ),
                        InkWell(
                            onTap: () {},
                            child: const Icon(Icons.send_and_archive_outlined))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
