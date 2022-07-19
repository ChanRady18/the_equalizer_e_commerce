import 'package:app_01/model/product.dart';
import 'package:app_01/page/cart_page.dart';
import 'package:app_01/page/search_page.dart';
import 'package:app_01/provider/order_notify.dart';
import 'package:app_01/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gscarousel/gscarousel.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';



class HomePage extends StatefulWidget {
  const HomePage({ key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedIndex = 0;
  final widgetOptions = [
    Text('Beer List'),
    Text('Add new beer'),
    Text('Favourites'),
  ];


  @override
  Widget build(BuildContext context) {

    //final po = Provider.of<OrderNotify>(context);

    return Scaffold(
      appBar:AppBar(
        elevation: 3,
        backgroundColor:Colors.white,
       // leading: Icon(Icons.notifications, color: Colors.black,),
        title: Text("THE EQUALIZER", style:GoogleFonts.montserrat( fontWeight:FontWeight.bold, color: Colors.black,fontSize: 24),),
        centerTitle: true,
        actions:<Widget>[
         // Icon(Icons.shopping_cart, color: Colors.black,),
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
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical:16,horizontal:12),
          children: [
            buildBanner(),
            SizedBox(height: 13),
            buildHeader(),
            buildProductList(),
            SizedBox(height:16),
            buildFindoutMore(),
            SizedBox(height:16),
            buildlink(),
          ],
        ),
      ),

    );
    
  }

}



Widget buildBanner(){
  return Container(
    child: SizedBox(
      height: 140,
      child: GSCarousel(
        images: [
          new AssetImage(
                'assets/images/banner.png'),
            new AssetImage(
                'assets/images/banner.png'),
            new AssetImage(
                'assets/images/banner.png'),
            new AssetImage(
                'assets/images/banner.png'),
        ],
        indicatorSize: const Size.square(8.0),
        indicatorActiveSize: const Size(18.0, 8.0),
        indicatorColor: Colors.white,
        indicatorActiveColor: Colors.redAccent,
        animationCurve: Curves.easeIn,
        contentMode: BoxFit.cover,
      ),
    ),
  );
}

Widget buildHeader(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text("Lates news", 
        style: GoogleFonts.montserrat(
          color:Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w500,
          ),
      ),
    ],
  );
}

Widget buildProductList() {
    return Container(
      height: 250,
      width: 50,
      margin: EdgeInsets.only(top: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productList.length,
        itemBuilder: (context, index) {
          ProductModel product = productList[index];
          return ProductCard(product: product);
        },
      ),
    );
  }

Widget buildFindoutMore(){
  return  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("THE NEW\nOF SEASON 2\nPRE-ORDER NOW!", 
        style: GoogleFonts.montserrat(
          color:Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w900,
          ),
      ),
      SizedBox(height:15),
      // ignore: deprecated_member_use
      RaisedButton(
                  textColor: Colors.white,
                  color: Colors.black,
                  child: Text("FIND OUT MORE"),
                  onPressed: () {},
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
    ],
  );
}

Widget buildlink(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text("FOLLOW US", 
        style: GoogleFonts.montserrat(
          color:Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          ),
      ),
      
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20,
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Image.asset("assets/images/fb.png"),
              onPressed: _launchFB,
             
            ),
          ),
          SizedBox(height:5.0),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20,
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Image.asset("assets/images/ig.png"),
              onPressed: _launchIG,
            ),
          ),
        ],
      ),
    ],
  );
}



 _launchFB() async {
  const url = 'https://www.facebook.com/TheEqualizer15/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


 _launchIG() async {
  const url2 = 'https://www.facebook.com/TheEqualizer15/';
  if (await canLaunch(url2)) {
    await launch(url2);
  } else {
    throw 'Could not launch $url2';
  }
}
