import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/constant/color.dart';
import 'package:flutter_ui/provider/counter_provider.dart';
import 'package:flutter_ui/view/home_page.dart';
import 'package:get/get.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: appColor,
      )
  );
  runApp(ProviderScope(child: Home()));
}
  class Home extends StatelessWidget {
    // const ({Key? key}) : super(key: key);


    @override
    Widget build(BuildContext context) {
    return ScreenUtilInit(
    designSize: const Size(411, 866),
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

    
    class Count extends StatelessWidget {

      @override
      Widget build(BuildContext context) {
        return Scaffold(
            body: SafeArea(
              child: Consumer(
                builder: (context, ref, child) {
                  final number = ref.watch(counterProvider).number;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${number}', style: TextStyle(fontSize: 50),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                 ref.read(counterProvider).addNumber();

                              },
                              child: Text('Increase')
                          ),
                          SizedBox(width: 20,),
                          ElevatedButton(
                              onPressed: () {
                                ref.read(counterProvider).subNumber();
                              },
                              child: Text('Decrease')
                          ),
                        ],
                      )

                    ],
                  );
                }
              ),
            ),
            );
      }
}
    

