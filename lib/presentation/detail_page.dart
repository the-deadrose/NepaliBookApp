// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:fluttersample/common/snackShow.dart';
// import 'package:fluttersample/providers/crud_provider.dart';
// import 'package:fluttersample/services/crud_service.dart';
// import '../models/post.dart';
// import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
//
//
// class DetailPage extends ConsumerWidget {
//   final Post post;
//   final types.User user;
//   DetailPage(this.post, this.user);
//
//   final commentController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context, ref) {
//     final postData = ref.watch(postStream);
//     return Scaffold(
//         body: ListView(
//           children: [
//             Image.network(post.imageUrl),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextFormField(
//                 controller: commentController,
//                 onFieldSubmitted: (val){
//                   if(val.isEmpty){
//                     SnackShow.showFailure(context, 'filed can\'t be empty');
//                   }else{
//                     ref.read(crudProvider.notifier).addComment(
//                         comments: [...post.comments, Comment(
//                             imageUrl: user.imageUrl!,
//                             username: user.firstName!,
//                             comment: val
//                         )],
//                         postId: post.id
//                     );
//                     commentController.clear();
//                   }
//                 },
//
//                 decoration: InputDecoration(
//                   hintText: 'add some comment'
//                 ),
//               ),
//             ),
//             postData.when(
//                 data: (data){
//                   final userPost = data.firstWhere((element) => element.id == post.id);
//                   return  Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       children: userPost.comments.map((e) {
//                         return Card(
//                           child: ListTile(
//                             leading: Image.network(e.imageUrl),
//                             title: Text(e.username),
//                             subtitle: Text(e.comment),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   );
//                 },
//                 error: (err, stack) => Text('$err'),
//                 loading: () => CircularProgressIndicator()
//             )
//           ],
//         )
//     );
//   }
// }
