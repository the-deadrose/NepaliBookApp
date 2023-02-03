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

}