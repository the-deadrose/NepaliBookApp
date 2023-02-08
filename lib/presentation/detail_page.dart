import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product.dart';
import '../providers/cart_provider.dart';


class DetailPage extends StatelessWidget {
  final Product product;
  DetailPage(this.product);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.network(
                              product.image,
                              height: 300,
                              width: 200,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  product.product_name,
                                  style: TextStyle(fontSize: 17),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text('Rs. ${product.price}',
                                    style: TextStyle(fontSize: 16)),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(product.product_detail),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Consumer(builder: (context, ref, child) {
                        return ElevatedButton(
                            onPressed: () {
                              ref.read(cartProvider.notifier).addToCart(product, context);
                            }, child: Text('Add To Cart'));
                      }),
                    ),
                  )
                ],
              ),
            )));
  }
}