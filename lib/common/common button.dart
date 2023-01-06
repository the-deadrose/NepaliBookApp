import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildWidge extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
        maximumSize: Size(100.w, 50.h)
      ),
        onPressed: (){},
        child: Text('Common button')
    );
  }
}
