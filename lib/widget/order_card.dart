import 'package:app_01/model/order.dart';
import 'package:app_01/provider/order_notify.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

// ignore: must_be_immutable
class OrderCard extends StatefulWidget {

  Order order;
  OrderCard(this.order);

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    final po = Provider.of<OrderNotify>(context);
    /*return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          widget.order.product.image,
          width: 180,
          height: 180,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 10.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.order.product.name,
                style: TextStyle(fontSize: 20),
              ),
              //Text(order.product.desc),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    // ignore: deprecated_member_use
                    child: OutlineButton.icon(
                      onPressed: () {
                        po.decrementQty(widget.order);
                      },
                      icon: Icon(Icons.remove),
                      label: Text(''),
                    ),
                  ),
                  Container(
                    width: 40,
                    child: Text(
                      widget.order.qty.toString(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    child: Icon(Icons.plus_one),
                    onPressed: () {
                      po.incrementQty(widget.order);
                    },
                  ),
                  Expanded(
                    child: Text(
                      '\$ ' + (widget.order.qty * widget.order.price).toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                      textAlign: TextAlign.right,
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );*/
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Image.asset(
          widget.order.product.image,
          width: 180,
          height: 180,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 10.0,),
        Expanded(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10,),
              Text(
                widget.order.product.name,
                style: TextStyle(fontSize:17),
              ),
              SizedBox(height: 30.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 16,),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                    onTap: (){
                      po.decrementQty(widget.order);
                    },
                  ),
                  Container(
                    width: 40,
                    child: Text(
                      widget.order.qty.toString(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                    onTap: (){
                       po.incrementQty(widget.order);
                    },
                  ),
                ],
              ),
              SizedBox(height: 55.0,),
              
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children:<Widget>[
                  SizedBox(width: 13,),
                  Text(
                    '\$'+(widget.order.qty*widget.order.price).toString(),
                  ),
                ],
              ),
            ],
          ), 
        ),
      ],
    );
  }
}