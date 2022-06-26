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
            child: Row(children: const [
              //             Container(
              //   height: 80,
              //   width: 80,
              //   decoration: BoxDecoration(
              //       shape: BoxShape.circle,
              //       image: DecorationImage(
              //           fit: BoxFit.cover,
              //           image: AssetImage('assets/images/flower.jpg'))),
              // ),
              CircleAvatar(
                radius: 30,
                
                backgroundImage: AssetImage('assets/images/flower.jpg'),
              ),
              SizedBox(width: 10,),
              Text('User',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold),),
               Spacer(),
               Icon(Icons.more_horiz_rounded)
            ]),
          )
        ,Container(
          color: Colors.red,
          height: 300,
        width: 10000,
        child: Image.asset('assets/images/flower.jpg',
        fit: BoxFit.cover,
        
        ),)
       , Container(child: 
       Container(
         margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
         child: Row(children: [
           Image.asset('assets/icons/like.png'),
           const SizedBox(width: 5,),
           Image.asset('assets/icons/comment.png'),
            const SizedBox(
                  width: 5,
                ),
           Image.asset('assets/icons/share.png'),
           const Spacer(),
           Image.asset('assets/icons/save.png'),
         ],),
       ))
        ],
      ),);
  }
}
