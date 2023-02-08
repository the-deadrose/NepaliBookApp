import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';
import '../providers/order_provider.dart';




class OrderHistory extends ConsumerWidget{

  @override
  Widget build(BuildContext context, ref) {
    final auth = ref.watch(authProvider);
    final history = ref.watch(orderHistory(auth.user!.id));
    return Scaffold(
        body: SafeArea(
            child: history.when(
                data: (data){
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index){
                        return ExpansionTile(
                          title: Text(data[index].dateTime),
                          children: data[index].products.map((e){

                            return  Row(
                              children: [
                                Image.network(e.productImage, height: 200,width: 200,fit: BoxFit.cover,),
                                Spacer(),
                                Container(
                                  height: 200,
                                  child: Stack(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 70),
                                        child: Column(
                                          children: [
                                            Text(e.productName),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 20),
                                              child: Text('Rs. ${e.price}'),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            );
                          }).toList(),
                        );
                      }
                  );
                },
                error: (err, stack) => Text('$err'),
                loading: () => Center(child: CircularProgressIndicator())
            )
        )
    );
  }
}