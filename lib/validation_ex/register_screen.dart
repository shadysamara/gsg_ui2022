import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:gsk_ui/validation_ex/custom_checkbox.dart';
import 'package:gsk_ui/validation_ex/custom_textfield.dart';
import 'package:string_validator/string_validator.dart';

class RegisterScreen extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Container(
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
                  suffix:    CountryCodePicker(
                onChanged: (v) {
                  countryCode = v.dialCode;
                },initialSelection: 'PS',
              showCountryOnly: false,
               showOnlyCountryWhenClosed: false,
               alignLeft: false,
              ),
                  title: 'Phone',
                  validator: phoneValidation,
                  controller: phoneController),
                  SizedBox(height: 10,),
           CustomCheckbox(validator: checkBoxValidator,),
              ElevatedButton(
                  onPressed: () {
                    registerKey.currentState!.validate();
                  },
                  child: Text('Register'))
            ],
          ),
        ),
      ),
    );
  }
}
