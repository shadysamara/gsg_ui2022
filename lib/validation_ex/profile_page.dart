import 'package:flutter/material.dart';
import 'package:gsk_ui/todo_app/data/db_helper.dart';
import 'package:gsk_ui/validation_ex/sp_helper.dart';
import 'package:gsk_ui/validation_ex/user_model.dart';

class ProfilePage extends StatelessWidget {
  UserModel userModel;
  ProfilePage(this.userModel);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
              
              },
              child: Text('Sign Out'))
        ],
      ),
    );
  }
}
