import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/models/book.dart';

import '../constant/color.dart';

class BookDetail extends StatelessWidget {
  final Book book;
  const BookDetail(this.book, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Image.network(
          book.imageUrl,
          height: 350.h,
          width: 200.w,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    book.title,
                    style: const TextStyle(
                        fontSize: 21, fontWeight: FontWeight.w500),
                  ),
                  Column(
                    children: [
                      Text(book.rating),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        book.genres,
                        style: const TextStyle(fontSize: 16, color: textColor),
                      )
                    ],
                  )
                ],
              ),
              Text(
                book.detail,
                textAlign: TextAlign.justify,
                style: const TextStyle(color: Colors.grey, fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: darkGreen,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            //maximumSize: Size(width, height)
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15)),
                        onPressed: () {},
                        child: const Text(
                          'Read Book',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'More info',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ))
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}

class MoreBookDetail extends StatelessWidget {
  final Book morebook;
  const MoreBookDetail(this.morebook, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Image.network(
          morebook.imageUrl,
          height: 350.h,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    morebook.title,
                    style: const TextStyle(
                        fontSize: 21, fontWeight: FontWeight.w500),
                  ),
                  Column(
                    children: [
                      Text(morebook.rating),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        morebook.genres,
                        style: const TextStyle(fontSize: 16, color: textColor),
                      )
                    ],
                  )
                ],
              ),
              Text(
                morebook.detail,
                style: const TextStyle(color: Colors.grey, fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: darkGreen,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            //maximumSize: Size(width, height)
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15)),
                        onPressed: () {},
                        child: const Text(
                          'Read Book',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'More info',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ))
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
