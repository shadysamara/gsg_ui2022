import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:gsk_ui/validation_ex/country.dart';
import 'package:gsk_ui/validation_ex/custom_checkbox.dart';
import 'package:gsk_ui/validation_ex/custom_textfield.dart';
import 'package:string_validator/string_validator.dart';
import 'package:gsk_ui/validation_ex/sp_helper.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? requiredValidator(String v) {
    if (v.length < 3) {
      return 'name must contain at least 3 letters';
    }
  }

  String? emailValidator(String v) {
    if (!isEmail(v)) {
      return 'invalid email syntax';
    }
  }

  String? phoneValidation(String v) {
    if (v.length < 9 || v.length > 10) {
      return 'phone number must contain either 9 or 10 numbers';
    }
  }

  String? checkBoxValidator(bool? x) {
    if (!(x!)) {
      return 'you have to accept our conditions first';
    }
  }

  GlobalKey<FormState> registerKey = GlobalKey();

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  String? countryCode = '970';

  Country? selectedCountry;
  String? selectedCity;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Form(
            key: registerKey,
            child: Column(
              children: [
                CustomTextfield(
                    title: 'Name',
                    validator: requiredValidator,
                    controller: nameController),
                SizedBox(
                  height: 15,
                ),
                CustomTextfield(
                    textInputType: TextInputType.emailAddress,
                    title: 'Email',
                    validator: emailValidator,
                    controller: emailController),
                SizedBox(
                  height: 15,
                ),
                CustomTextfield(
                    textInputType: TextInputType.phone,
                    suffix: CountryCodePicker(
                      onChanged: (v) {
                        countryCode = v.dialCode;
                      },
                      initialSelection: 'PS',
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                    ),
                    title: 'Phone',
                    validator: phoneValidation,
                    controller: phoneController),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(
                        15,
                      )),
                  child: DropdownButton<Country>(
                      isExpanded: true,
                      underline: SizedBox(),
                      value: selectedCountry,
                      items: countries.map((e) {
                        return DropdownMenuItem<Country>(
                          value: e,
                          child: Text(e.name),
                        );
                      }).toList(),
                      onChanged: (v) {
                        selectedCountry = v;
                        selectedCity = v!.cities.first;
                        setState(() {});
                      }),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(
                        15,
                      )),
                  child: DropdownButton<String>(
                      isExpanded: true,
                      underline: SizedBox(),
                      value: selectedCity,
                      items: selectedCountry?.cities.map((e) {
                        return DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        );
                      }).toList(),
                      onChanged: (v) {
                        selectedCity = v;
                        setState(() {});
                      }),
                ),
                CustomCheckbox(
                  validator: checkBoxValidator,
                ),
                ElevatedButton(
                    onPressed: () {
                      

                      if (registerKey.currentState!.validate()) {
                        SpHelper.spHelper.saveNewUser(
                            name: nameController.text,
                            email: emailController.text,
                            phone: (countryCode??'970') + phoneController.text,
                            country: selectedCountry?.name ?? 'not defined',
                            city: selectedCity ?? 'not defeined');
                      }
                    },
                    child: Text('Register')),
                ElevatedButton(
                    onPressed: () {
                      SpHelper.spHelper.getUser();
                    },
                    child: Text('Check user'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
