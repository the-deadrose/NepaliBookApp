import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/providers/auth_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../common/firebase_instances.dart';
import '../common/snackShow.dart';
import '../providers/crud_provider.dart';
import '../services/crud_service.dart';
import 'create_page.dart';



class HomePage extends ConsumerWidget {
  late String userName;
  final auth = FirebaseInstances.firebaseAuth.currentUser?.uid;

  @override
  Widget build(BuildContext context, ref) {
    FlutterNativeSplash.remove();
    final users = ref.watch(usersStream);
    final postData = ref.watch(postStream);
    final user = ref.watch(userStream(auth!));
    return Scaffold(
        appBar: AppBar(
          title: Text('Sample Social'),
        ),
        drawer: Drawer(
            child: user.when(
                data: (data){
                  userName = data.firstName!;
                  return  ListView(
                    children: [
                      DrawerHeader(
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(data.imageUrl!),
                              ),
                              SizedBox(width: 15,),
                              Text(data.firstName!),
                            ],
                          )
                      ),

                      ListTile(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        leading: Icon(Icons.email),
                        title: Text(data.metadata!['email']),
                      ),

                      ListTile(
                        onTap: (){
                          Navigator.of(context).pop();
                          Get.to(() => CreatePage(), transition: Transition.leftToRight);
                        },
                        leading: Icon(Icons.add),
                        title: Text('Create Post'),
                      ),

                      ListTile(
                        onTap: (){
                          ref.read(authProvider.notifier).userLogOut();
                        },
                        leading: Icon(Icons.exit_to_app),
                        title: Text('Log Out'),
                      )
                    ],
                  );
                },
                error: (err, stack) => Text('$err'),
                loading: () => Center(child: CircularProgressIndicator())
            )
        ),
        body: Column(
          children: [
            Container(
              height: 150.h,
              child: users.when(
                  data: (data){
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: data.length,
                        itemBuilder: (context, index){
                          return Container(
                            width: 100.w,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage: CachedNetworkImageProvider(data[index].imageUrl!),
                                  ),
                                  SizedBox(height: 5,),
                                  Text(data[index].firstName!, style: TextStyle(fontSize: 17.sp),)
                                ],
                              ),
                            ),
                          );
                        }
                    );
                  },
                  error: (err, stack) => Center(child: Text('$err')),
                  loading: () => Container()
              ),
            ),

            Expanded(
                child: postData.when(
                    data: (data){
                      return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index){
                            final post = data[index];
                            return  Card(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(post.title),
                                        if(auth == post.userId)  IconButton(onPressed: (){
                                          Get.defaultDialog(
                                              title: 'Customize Post',
                                              content: Text('Edit or remove post'),
                                              actions: [
                                                IconButton(
                                                    onPressed: (){
                                                      Navigator.of(context).pop();
                                                      Get.to(() => UpdatePage(post));
                                                    }, icon: Icon(Icons.edit)),
                                                IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                                              ]
                                          );
                                        }, icon: Icon(Icons.more_horiz))
                                      ],
                                    ),
                                  ),
                                  Image.network(post.imageUrl),
                                  if(auth != post.userId)    Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                            onPressed: (){
                                              if(post.like.usernames.contains(userName)){
                                                SnackShow.showFailure(context, 'You have already like this post');
                                              }else{
                                                post.like.usernames.add(userName);
                                                ref.read(crudProvider.notifier).addLike(
                                                    username: post.like.usernames,
                                                    like: post.like.likes,
                                                    postId: post.id
                                                );
                                              }
                                            }, icon: Icon(Icons.thumb_up)),
                                        if(post.like.likes != 0)    Text('${post.like.likes}')

                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          }
                      );
                    },
                    error: (err, stack) => Text('$err'),
                    loading: () => Center(child: CircularProgressIndicator())
                )
            )

          ],
        )
    );
  }
}