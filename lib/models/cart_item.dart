import 'package:hive/hive.dart';
part 'cart_item.g.dart';


@HiveType(typeId: 0)
class CartItem extends HiveObject{

  @HiveField(0)
  String productName;

  @HiveField(1)
  int quantity;

  @HiveField(2)
  int price;

  @HiveField(3)
  String productImage;

  @HiveField(4)
  String productId;

  CartItem({
    required this.price,
    required this.productImage,
    required this.productName,
    required this.quantity,
    required this.productId
});

  factory CartItem.fromJson(Map<String, dynamic> json){
    return CartItem(
        price: json['price'],
        productImage: json['productImage'],
        productName: json['productName'],
        quantity: json['quantity'],
        productId: json['productId']
    );
  }

  Map<String,dynamic> toJson(){
    return {
      'price': this.price,
      'productImage': this.productImage,
      'productName': this.productName,
      'quantity': this.quantity,
      'productId': this.productId
    };
  }


}