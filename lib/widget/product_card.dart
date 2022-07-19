import 'package:app_01/model/product.dart';
import 'package:app_01/page/detailpage.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {

  final ProductModel  product;
  const ProductCard({Key key, this.product }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailPage(product:product)));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        margin: EdgeInsets.only(right:12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildProductImage(),
            buildProductInfo(),
          ],
        ),
      ),
    );
  }
  Widget buildProductImage(){
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Image.asset(
            product.image,
            height: 200,
            width:double.infinity,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }

  Widget buildProductInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.name,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 4),
        Text(
          "\$${product.price}",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ],
    );
  }

}
