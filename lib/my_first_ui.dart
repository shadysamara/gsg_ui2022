import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyFirstUi extends StatelessWidget {
  String imageUrl =
      'https://images.unsplash.com/photo-1653242192626-0141ac08d339?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
Column(children: [
  Image.network(imageUrl,width: 100,),
  Text('Image1',style: TextStyle(fontSize: 15),)
  ],),

Column(
                children: [
                  Image.network(imageUrl,
                    width: 100,
                  ),
                  Text(
                    'Image1',
                    style: TextStyle(fontSize: 15),
                  )
                ],
              )
        ],),
     
        Text('My Name Is Shady',style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22),)
      ],),
    );
  }
}
