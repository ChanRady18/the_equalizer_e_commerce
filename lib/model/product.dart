
import 'package:app_01/constant/constant.dart';

class ProductModel {
  String name;
  double price;
  String description;
  double rating;
  String image;

  ProductModel({this.description, this.image, this.name, this.price, this.rating});
}

final List<ProductModel> productList = [
  ProductModel(
    name: "APSARA BLACK TEE",
    price: 29.99,
    image: "assets/images/black.png",
    description: LOREM_IPSUM,
  ),
  ProductModel(
    name: "APSARA WHITE TEE",
    price: 12.99,
    image: "assets/images/white.png",
    description: LOREM_IPSUM,
  ),
  ProductModel(
    name: "APSARA BLACK TEE",
    price: 29.99,
    image: "assets/images/black.png",
    description: LOREM_IPSUM,
  ),
  ProductModel(
    name: "APSARA BLACK TEE",
    price: 29.99,
    image: "assets/images/black.png",
    description: LOREM_IPSUM,
  ),
];