
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant/color.dart';

class BookDetail extends StatefulWidget {


  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light
        )
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Image.network('https://upload.wikimedia.org/wikipedia/en/1/1d/Muna_Madan_-_book_cover.jpg',width: 400,height: 300,fit: BoxFit.cover,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),

              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Muna Madan',style: TextStyle(
                        fontSize: 21, fontWeight: FontWeight.w500
                      ),),
                      Column(
                        children: [
                          Text('⭐⭐⭐⭐⭐'),
                          SizedBox(height: 5,),
                          Text('Romantic',style: TextStyle(
                            fontSize: 16, color: textColor
                          ),)
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text('Muna Madan follows the life of Madan,'
                      ' a Chhetri man from Kathmandu who leaves Muna,'
                      ' his wife, to go to Lhasa to earn a fortune.'
                      ' He is cautioned against leaving by both Muna and '
                      'his elderly mother, but he decides to leave anyway. '
                      'While he initially intends to spend just a few weeks in '
                      'Lhasa, he spends a longer time there, becoming entranced by '
                      'the city\'s beauty. He finally sets off for Kathmandu but falls '
                      'sick with cholera on the way. His travelling companion, Ram, '
                      'returns to Kathmandu and tells Muna that her husband has died.',style: TextStyle(
                    color: Colors.grey, fontSize: 18
                  ),),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: darkGreen
                        ),
                        child: Text('Read Book',style: TextStyle(fontSize: 18,color: Colors.white),),
                      ),

                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey, width: 2)
                        ),
                        child: Text('More info',style: TextStyle(fontSize: 18, color: Colors.grey),),
                      )
                    ],
                  )
                ],
              ),
            )

          ],
        ),
      ),

    );
  }
}
