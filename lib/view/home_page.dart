

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
            margin: EdgeInsets.only(right: 15, left: 15),
            height: 48,
            //color: Colors.blue,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Row(
                  children: [
                    Container(
                       width: 41,
                      child: TextButton(
                        onPressed: () {},
                        child: Text('All',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20
                        ),),
                      ),
                    ),
                    Container(
                      child: TextButton(
                        onPressed: () {},
                        child: Text('Recommended',style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17
                        ),),
                      ),
                    ),
                    Container(
                      child: TextButton(
                        onPressed: () {},
                        child: Text('Popular book',style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17
                        ),),
                      ),
                    ),
                    Container(
                      child: TextButton(
                        onPressed: () {},
                        child: Text('My books',style: TextStyle(
                            color: Colors.grey,
                          fontSize: 17
                        ),),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: books.length,
                itemBuilder: (context, index){
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  alignment: Alignment.bottomLeft,
                  child: Stack(
                    children: [
                      Container(
                        height: 165,
                        alignment: Alignment.bottomLeft,

                        child: Container(
                          height: 140,

                          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white
                          ),
                          child: Row(
                            children: [Container(
                              width: 105,
                              
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
                        margin: EdgeInsets.only(left: 8,
                        top: 6,),
                        child: Image.network(books[index].imageUrl, height: 150, width: 100, fit: BoxFit.cover,),
                      )
                    ],
                  ),

                );
                }
            ),
          ),
          SizedBox(height: 5,),
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 12),
            alignment: Alignment.centerLeft,
            child: Text('You may also like',style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500
            ),),
          ),
          SizedBox(height: 5,),
          Container(
            height: 220,
            margin: EdgeInsets.only(left: 15, right: 15),
            child: ListView.builder(
              itemCount: morebooks.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                return  Container(
                  width: 110,
                  margin: EdgeInsets.only(right: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.network(morebooks[index].imageUrl,height: 160, width: 100, fit: BoxFit.cover,),
                      SizedBox(height: 10,),
                      Text(morebooks[index].title,style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Colors.black87),),
                      Text(morebooks[index].genres,style: TextStyle(fontSize: 13,color: textColor),)
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