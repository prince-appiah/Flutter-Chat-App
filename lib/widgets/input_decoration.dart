import 'package:flutter/material.dart';

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
    labelText: hintText,
    hintText: hintText,
    suffixIcon: Icon(
      Icons.supervised_user_circle_sharp,
      color: Colors.white,
    ),
  );
}
