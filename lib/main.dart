import 'package:app_01/page/homepage.dart';
import 'package:app_01/provider/order_notify.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';



void main(){
  runApp(ChangeNotifierProvider(
    create: (_)=> OrderNotify(),
    child: MyApp(),
    ));
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoadingScreen(),
    );
  }
}

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds:5,
      backgroundColor: Colors.white,
      image:Image.asset('assets/images/chef.png'),
      photoSize: 180,
      navigateAfterSeconds:HomePage(),
      loaderColor: Colors.white,
    );
  }
}