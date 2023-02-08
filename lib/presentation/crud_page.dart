import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui/providers/auth_provider.dart';
import 'package:flutter_ui/providers/crud_provider.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../services/crud_service.dart';
import 'edit_page.dart';


class CrudPage extends ConsumerWidget {


  @override
  Widget build(BuildContext context, ref) {
    final productData = ref.watch(products);
    final auth = ref.watch(authProvider);
    return Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: productData.when(
              data: (data){
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index){
                    return  ListTile(
                      leading: Image.network(data[index].image, fit: BoxFit.cover,),
                      title: Text(data[index].product_name),
                      trailing: Container(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(onPressed: (){
                              Get.to(() => EditPage(data[index]));
                            }, icon: Icon(Icons.edit)),
                            IconButton(onPressed: (){
                              FocusScope.of(context).unfocus();
                              ref.read(crudProvider.notifier).removeProduct(postId: data[index].productId, imageId: data[index].public_id, token: auth.user!.token);
                              Get.back();
                            }, icon: Icon(Icons.delete)),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              error: (err, stack) => Center(child: Text('$err')),
              loading: () => Center(child: CircularProgressIndicator())
          ),
        )
    );
  }
}