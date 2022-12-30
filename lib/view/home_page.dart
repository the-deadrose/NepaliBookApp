import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/constant/color.dart';
import 'package:flutter_ui/models/book.dart';



// #F2F5F9
class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final actualHeight = height - 50 - MediaQuery.of(context).padding.top;
    // final width = MediaQuery.of(context).size.width;
    // print(height);
    // print(width);
    return Scaffold(
      backgroundColor: appColor,
      appBar: AppBar(
        // backgroundColor: Colors.amber.shade100,
        // backgroundColor: Colors.pink.withOpacity(0.9),
        // backgroundColor: Color.fromRGBO(20, 90, 100, 0.5),
        backgroundColor: appColor,
        elevation: 0,
        toolbarHeight: 50,
        title: Text('Hi John ,', style: TextStyle(color: blackColor)),
        actions: [
          Icon(Icons.search, color: Colors.black, size: 30.h,),
          SizedBox(width: 10,),
          Icon(Icons.notifications_none, color: blackColor, size: 30.h,),
        ],
        // toolbarHeight: 500,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Image.asset('assets/banner.png'),
          ),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: books.length,
                itemBuilder: (context, index){
                return Container(
                  //color: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  margin: EdgeInsets.only(right: 4),
                  alignment: Alignment.bottomLeft,
                  child: Stack(
                    children: [
                      Container(
                        height: 180,
                        alignment: Alignment.bottomLeft,

                        child: Container(
                          height: 140,
                          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: Row(
                            children: [Container(
                              width: 110,
                              
                            ),
                              Container(
                                 width:200.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text( books[index].title, style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500
                                    ),),
                                    SizedBox(height: 8,),
                                    Text(books[index].detail,maxLines: 4, style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12
                                    ),),
                                    SizedBox(height: 8,),
                                    Row(
                                      children: [
                                        Text(books[index].rating),
                                        Spacer(),
                                        Text(books[index].genres,style: TextStyle(color: textColor),)
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        
                      ),
                      Container(
                        height: 150,
                        margin: EdgeInsets.only(left: 12,
                        top: 6,),
                        child: Image.network(books[index].imageUrl, height: 150, width: 100, fit: BoxFit.cover,),
                      )
                    ],
                  ),

                );
                }
            ),
          )
        ],
      ),

    );
  }
}