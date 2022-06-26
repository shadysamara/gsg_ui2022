import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InstegramFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Row(children:  [
                          Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/flower.jpg'))),
              ),
              CircleAvatar(
                radius: 30,
                
                backgroundImage: AssetImage('assets/images/flower.jpg'),
              ),
              SizedBox(width: 10,),
              Text('User',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold),)
            ]),
          )
        ],
      ),);
  }
}
