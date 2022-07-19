
import 'package:app_01/provider/order_notify.dart';
import 'package:app_01/widget/order_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'homepage.dart';

// ignore: must_be_immutable
class CartPage extends StatefulWidget {
  
 

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    
    // ignore: unused_local_variable
    final order = Provider.of<OrderNotify>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
          },
        ),
        title: Text('SHOPPING BAG'),
       // actions: [Text(order.items.length.toString())],
      ),
      
      body: Stack(
        children: [
          buildListView(),
          SizedBox(height: 200,),
          buildButton(),
         
        ],
      ),

      /*bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "USD 199",
            ),
            RaisedButton(
              child: Text(
                "BUY",
               style: Theme.of(context).textTheme.button.copyWith(
                  color: Colors.white,
                ),
              ),  
              onPressed: (){},
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)
              ),
            ),
          ],
        ),
      ),*/
      

      /*body: ListView(
        children: order.items.map(
              (e) => Dismissible(
                direction: DismissDirection.endToStart,
                onDismissed: (dir) {
                  order.removeOrder(e);
                },
                background: Container(
                  color: Colors.red,
                  padding: EdgeInsets.only(right: 8),
                  child: Align(
                    child: Icon(
                      Icons.delete,
                      color: Colors.black,
                    ),
                    alignment: Alignment.centerRight,
                  ),
                ),
                key: Key(UniqueKey().toString()),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: OrderCard(e),                        
                ),
              ),
        ).toList(),
      ), */
           
    );
  }

  Widget buildListView(){
    final order = Provider.of<OrderNotify>(context);
    return ListView(
      children: order.items.map(
              (e) => Dismissible(
                direction: DismissDirection.endToStart,
                onDismissed: (dir) {
                  order.removeOrder(e);
                },
                background: Container(
                  color: Colors.red,
                  padding: EdgeInsets.only(right: 8),
                  child: Align(
                    child: Icon(
                      Icons.delete,
                      color: Colors.black,
                    ),
                    alignment: Alignment.centerRight,
                  ),
                ),
                key: Key(UniqueKey().toString()),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: OrderCard(e),                        
                ),
              ),
        ).toList(),
    );
  }
  
  Widget buildButton(){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        elevation: 3,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                'TOTAL: ${context.select((OrderNotify c) => c.total)}',
                  
              ),
              SizedBox(width: 50),
              Expanded(
                child: RaisedButton(
                  onPressed: () {},
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "BUY",
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

}
