import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../common/snackShow.dart';
import '../constant/color.dart';
import '../providers/auth_provider.dart';
import '../providers/toggle_provider.dart';



class CreatePage extends  ConsumerWidget {

  final titleController = TextEditingController();
  final detailController = TextEditingController();

  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, ref) {

    ref.listen(authProvider, (previous, next) {
      if(next.errorMessage.isNotEmpty){
        SnackShow.showFailure(context, next.errorMessage);
      }else if(next.isSuccess){
        SnackShow.showSuccess(context, 'succesfully login');

      }
    });

    final image = ref.watch(imageProvider);
    final auth = ref.watch(authProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: blackColor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Icon(Icons.chat,color: Color(0xFFFFFCB2B),),
            SizedBox(width: 10.w,),
            Text('FireChat',style: TextStyle(fontSize: 25.sp, color: Color(0xFFFFFCB2B) ),),
          ],
        ),
      ),

      body:  Padding(
        padding: const EdgeInsets.only(top: 110),
        child: Form(
          key: _form,
          child: Column(
            children: [
              Text('Creat Page', style: TextStyle(fontSize: 25.sp,
                  color: Color(0xFFFFFCB2B),
                  fontWeight: FontWeight.bold),),
              SizedBox(
                height: 10.h,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all()
                  ),
                  // color: Colors.red,
                  width: 250.w,
                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, left: 10, right: 10, bottom: 8),
                        child: TextFormField(
                            controller: titleController,
                            validator: (value) {
                              if(value!.isEmpty){
                                return 'title is required';
                              }
                              return null;
                            },
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                enabledBorder: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),

                                // fillColor: Colors.black,
                                filled: true,
                                hintText: 'Title',
                                hintStyle: TextStyle(color: Colors.grey)
                            )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, left: 10, right: 10, bottom: 8),
                        child: TextFormField(
                            validator: (value) {
                              if(value!.isEmpty){
                                return 'detail is required';
                              }else if(value.length > 500){
                                return 'minimum character exceed';
                              }
                              return null;
                            },
                            controller: detailController,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                enabledBorder: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                // fillColor: Colors.black,
                                filled: true,
                                hintText: 'Detail',
                                hintStyle: TextStyle(color: Colors.grey)
                            )
                        ),
                      ),

                      InkWell(
                        onTap: (){
                          ref.read(imageProvider.notifier).pickAnImage();
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 15),
                          height: 150.h,
                          width: 250.w,
                          color: Colors.white,
                          child: image == null ? Center(child: Text('select an image', style: TextStyle(color: Colors.black),)) : Image.file(File(image.path)),
                        ),
                      ),

                      TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.amber.shade500,
                              foregroundColor: Colors.black
                          ),
                          onPressed: () {
                            _form.currentState!.save();
                            FocusScope.of(context).unfocus();
                            if(_form.currentState!.validate()){


                                if(image == null){
                                  SnackShow.showFailure(context, 'please select an image');
                                }else{

                                }

                            }


                          },
                          child:auth.isLoad ? Center(child: CircularProgressIndicator(
                            color: Colors.white,
                          )): Text('Submit', style: TextStyle(fontSize: 20.sp),))
                    ],
                  ),
                ),
              ),


            ],

          ),
        ),
      ),
    );

  }
}
