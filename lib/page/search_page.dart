import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {


  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          spacer,
          SizedBox(height: 16,),
          buildAppbar(),
        ],
      ),
    );
  }


final spacer = SizedBox(height: 16.0,);

  Widget buildAppbar(){
   return Row(     
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search food",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: EdgeInsets.all(8),
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ],
    );
}
}



