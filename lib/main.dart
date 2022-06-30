import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gsk_ui/instegram/instegram_feed.dart';
import 'package:gsk_ui/my_first_ui.dart';

void main() {
  runApp(MaterialApp(
    home: ResponsiveScreen(),
  ));
}

class ResponsiveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    log(MediaQuery.of(context).size.height.toString());
    // TODO: implement build
    return Scaffold(
      drawer: Drawer(child: Column(children: const [
        UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(child: Text('O'),),
          accountName: Text('Omar'), 
          accountEmail: Text('omar@gmail.com')),
          ListTile(
            leading: Icon(Icons.home),
            trailing: Icon(Icons.arrow_forward_ios),
            subtitle: Text('Go to home'),
            title: Text('Home'),
          ),
        ListTile(
                leading: Icon(Icons.favorite),
                trailing: Icon(Icons.arrow_forward_ios),
                subtitle: Text('Wishlist prodcuts'),
                title: Text('Favourite'),
              ),
              ListTile(
                leading: Icon(Icons.perm_identity),
                trailing: Icon(Icons.arrow_forward_ios),
                subtitle: Text('Explore Profile'),
                title:  Text('Profile'),
              ),
        
         
      ],),),
        appBar: AppBar(),
        body: Container(
          height: MediaQuery.of(context).size.height/9,
          width: 300,
          color: Colors.red,
        ));
  }
}
