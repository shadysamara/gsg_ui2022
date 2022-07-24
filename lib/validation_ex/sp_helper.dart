import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:gsk_ui/navigation/router.dart';
import 'package:gsk_ui/validation_ex/profile_page.dart';
import 'package:gsk_ui/validation_ex/register_screen.dart';
import 'package:gsk_ui/validation_ex/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpHelper {
  String word = 'hello';
  SpHelper._();
  static SpHelper spHelper = SpHelper._();
  SharedPreferences? sharedPreferences;
  initSp() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  saveNewUser(
      {required String name,
      required String email,
      required String phone,
      required String country,
      required String city}) async {
    // sharedPreferences!.setString('name', name);
    // sharedPreferences!.setString('email', email);
    // sharedPreferences!.setString('phone', phone);
    // sharedPreferences!.setString('country', country);
    // sharedPreferences!.setString('city', city);
    Map<String, dynamic> map = {
      "name": name,
      "email": email,
      "phone": phone,
      "country": country,
      "city": city,
    };
    String userData = json.encode(map);
    bool x = await sharedPreferences!.setString('user', userData);
    if (x) {
      UserModel userModel = UserModel.fromMap(map);
      AppRouter.NavigateWithReplacemtnToWidget(ProfilePage(userModel));
    }
  }

  getUser() {
    String? user = sharedPreferences!.getString('user');

    if (user == null) {
      AppRouter.NavigateWithReplacemtnToWidget(RegisterScreen());
    } else {
      Map map = json.decode(user);
      UserModel userModel = UserModel.fromMap(map);
      AppRouter.NavigateWithReplacemtnToWidget(ProfilePage(userModel));

      // navigate to profile page
    }
  }

  deleteUser() {
    sharedPreferences!.remove('user');
    AppRouter.NavigateWithReplacemtnToWidget(RegisterScreen());
  }
  // delete default constructor
  // no ability to make object from this class
  // from outside
}

class Khader {
  SpHelper spHelper = SpHelper._();
  String fun() {
    log(spHelper.word);
    return '';
  }
}
