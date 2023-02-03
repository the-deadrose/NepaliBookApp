


class Product{
 final String product_name;
 final String product_detail;
 final String public_id;
 final String image;
 final int price;
 final String productId;

 Product({
   required this.price,
   required this.image,
   required this.product_detail,
   required this.product_name,
   required this.productId,
   required this.public_id
});

 factory Product.fromJson(Map<String, dynamic> json){
   return Product(
       price: json['price'],
       image: json['image'],
       product_detail: json['product_detail'],
       product_name: json['product_name'],
       productId: json['_id'],
       public_id: json['public_id']
   );
 }


}