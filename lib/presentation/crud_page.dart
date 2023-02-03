import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../services/crud_service.dart';
import 'edit_page.dart';


class CrudPage extends ConsumerWidget {

  @override
  Widget build(BuildContext context, ref) {
    final productData = ref.watch(products);
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
                            IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
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