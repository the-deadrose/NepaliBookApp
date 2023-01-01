import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/constant/color.dart';
import 'package:flutter_ui/view/home_page.dart';
import 'package:get/get.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: appColor,
      )
  );
  runApp(Home());
}
  class Home extends StatelessWidget {
    // const ({Key? key}) : super(key: key);


    @override
    Widget build(BuildContext context) {
    return ScreenUtilInit(
    designSize: const Size(392, 803),
    minTextAdapt: true,
    builder: (context , child) {
    return GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: child,
    );
    },
    child:  HomePage(),
    );
    }
    }


