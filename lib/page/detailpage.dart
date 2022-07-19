import 'package:app_01/model/order.dart';
import 'package:app_01/model/product.dart';
import 'package:app_01/page/cart_page.dart';
import 'package:app_01/provider/order_notify.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {


  final ProductModel product;

  final Order order;

  const DetailPage({ key, this.product, this.order }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>  {

  ProductModel get product => widget.product;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Stack(
        children: [
          buildDetailImage(),
          buildFoodInfo(),
          buildAppBar(),
          buildOrderButton(),
        ],
      ),
    );
  }
  
  Widget buildFoodInfo(){
    return SingleChildScrollView(
      
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height / 2 - 16,
      ),
      child: Container(
        
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)
          ),
        ),
        
       
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$${product.price}",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 12),
            SizedBox(height: 8),
            
            buildDescription(),
          ],
        ),
      ),
    );
  }

   Widget buildDescription() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Description",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Text(product.description),
        ],
      ),
    );
  }

  Widget buildDetailImage() {
    return Container(
      color: Colors.white70,
      height: MediaQuery.of(context).size.height / 2,
      child: Image.asset(
        product.image,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildOrderButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        elevation: 3,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              //SizedBox(width: 13),
              Expanded(        
                // ignore: deprecated_member_use
                child: RaisedButton(
                  onPressed: (){
                    showDialog(context: context, builder: (BuildContext context) => _buildAboutDialog(context),);
                    var o = Order( product:product, qty: 1, price: product.price);
                    context.read<OrderNotify>().addOrder(o);
                  },
                  color: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Add to Cart",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget buildAppBar() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              //backgroundColor: Colors.white,
              onPressed: () => Navigator.of(context).pop(),
            ),
            Stack(
              children: [
              IconButton(
                icon: Icon(Icons.shopping_bag_outlined,color: Colors.black,size: 36,),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage(),),
                  );
                },
              ),
              Positioned(
                top:21,
                right:18,
                child: Container(
                  decoration: BoxDecoration(
                    //color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(context.watch<OrderNotify>().items.length.toString(),style: TextStyle(color: Colors.black),),
                ),
              ),
            ],
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildAboutDialog(BuildContext context){
    return new AlertDialog(
      title: const Text('Added to bag'),
      content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:<Widget>[
        _buildAboutProduct(),
        
      ],
    ),
    actions:<Widget>[
      // ignore: deprecated_member_use
      new FlatButton(
        onPressed: (){
          Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage(),),
                  );
        }, 
        child: const Text('Go to Cart'),
      ),
      // ignore: deprecated_member_use
      new FlatButton(
        onPressed: ()=> Navigator.of(context).pop(), 
        child: const Text("Back"), 
      ),
    ],
    );
  }

  Widget _buildAboutProduct() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          widget.product.image,
          width: 90,
          height: 90,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 10.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.product.name,
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(height: 20,),
              Text( "US"+'\$'+(widget.product.price).toString(),),
            ],
          ),
        )
      ],
    );
  }
}

