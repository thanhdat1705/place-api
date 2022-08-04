import 'package:flutter/material.dart';

class CustomizedTextFormField extends StatelessWidget {
  final FocusNode onFocusedTextField;
  final TextEditingController textFieldController;
  final String textFormFieldName;
  final bool readOnly;
  final Color defaultColor;
  final Color enableColor;
  final Function onChanged;
  final TextInputType keyboardType;
  const CustomizedTextFormField({
    Key key,
    @required this.onFocusedTextField,
    @required this.textFieldController,
    @required this.textFormFieldName,
    @required this.readOnly,
    @required this.defaultColor,
    @required this.enableColor,
    @required this.onChanged,
    @required this.keyboardType,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new TextFormField(
      readOnly: this.readOnly,
      focusNode: this.onFocusedTextField,
      controller: this.textFieldController,
      keyboardType: this.keyboardType,
      style: TextStyle(
        color: Color(0xDD000000),
      ),
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: this.defaultColor, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
              color: this.readOnly ? this.defaultColor : this.enableColor,
              width: 1.0),
        ),
        labelText: this.textFormFieldName,
        labelStyle: TextStyle(
          color: this.readOnly
              ? this.defaultColor
              : (this.onFocusedTextField.hasFocus
                  ? this.enableColor
                  : this.defaultColor),
        ),
      ),
      onChanged: this.onChanged,
    );
  }
}
