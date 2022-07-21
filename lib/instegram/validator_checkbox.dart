import 'package:flutter/material.dart';

class CheckBoxValid extends FormField<bool> {
  CheckBoxValid(
      {FormFieldSetter<bool>? onSaved,
      required FormFieldValidator<bool> validator,
      required String title,
      bool initialValue = false,
      bool autovalidate = false})
      : super(
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
         
            builder: (FormFieldState<bool> state) {
               return CheckboxListTile(
                dense: state.hasError,
                title: Text(title),
                value: state.value,
                onChanged: state.didChange,
                subtitle: state.hasError
                    ? Builder(
                        builder: (BuildContext context) =>  Text(
                          state.errorText??'',
                          style: TextStyle(color: Theme.of(context).errorColor),
                        ),
                      )
                    : null,
                controlAffinity: ListTileControlAffinity.leading,
              );
            });
              
              
             
}
