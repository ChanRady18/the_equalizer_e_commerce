import 'package:app_01/model/product.dart';

class Order{
  ProductModel product;
  int qty = 1;
  double price;

  Order({ this.product,this.qty,this.price});
}