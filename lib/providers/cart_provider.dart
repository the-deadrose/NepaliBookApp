





import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../common/snackShow.dart';
import '../main.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

final cartProvider = StateNotifierProvider<CartProvider, List<CartItem>>(
        (ref) => CartProvider(ref.watch(box1)));

class CartProvider extends StateNotifier<List<CartItem>> {
  CartProvider(super.state);

  final box = Hive.box<CartItem>('carts');
  void addToCart(Product product, BuildContext context) {
    if (state.isEmpty) {
      final newCart = CartItem(
          price: product.price,
          productImage: product.image,
          productName: product.product_name,
          quantity: 1,
          productId: product.productId);
      box.add(newCart);
      state = [newCart];

      SnackShow.showCartSuccess(context, 'successfully added to cart');

    } else {
      final cart = state.firstWhere(
              (element) => element.productId == product.productId,
          orElse: () => CartItem(
              price: 0,
              productImage: '',
              productName: 'no',
              quantity: 0,
              productId: ''));

      if (cart.productName == 'no') {
        final newCart = CartItem(
            price: product.price,
            productImage: product.image,
            productName: product.product_name,
            quantity: 1,
            productId: product.productId);
        box.add(newCart);
        state = [...state, newCart];
        SnackShow.showCartSuccess(context, 'successfully added to cart');
      } else {
        SnackShow.showCartFailure(context, 'already added to cart');
      }
    }
  }

  void singleAdd(CartItem cartItem) {
    cartItem.quantity = cartItem.quantity + 1;
    cartItem.save();
    state = [
      for (final cart in state)
        if (cart.productId == cartItem.productId) cartItem else cart
    ];
  }

  void singleRemove(CartItem cartItem) {
    if (cartItem.quantity > 1) {
      cartItem.quantity = cartItem.quantity - 1;
      cartItem.save();
      state = [
        for (final cart in state)
          if (cart.productId == cartItem.productId) cartItem else cart
      ];
    }
  }

  void removeFromCart(CartItem cartItem) {
    cartItem.delete();
    state.remove(cartItem);
    state = [...state];
  }

  void cartClear() {
    box.clear();
    state = [];
  }

  int get total {
    int total = 0;
    for (final cart in state) {
      total += cart.quantity * cart.price;
    }
    return total;
  }
}