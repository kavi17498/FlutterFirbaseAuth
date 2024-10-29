import 'package:flutter/material.dart';

import 'package:firebasetest2/constans/colors.dart';

TextStyle descriptionStyle = TextStyle(
  fontSize: 10,
  color: textlight,
  fontWeight: FontWeight.w400,
);

const textInputDecoration = InputDecoration(
  hintText: "Email",
  hintStyle: TextStyle(color: textlight, fontSize: 15),
  fillColor: bgblack,
  filled: true,
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: mainYello, width: 1),
    borderRadius: BorderRadius.all(
      Radius.circular(100),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: mainYello, width: 1),
    borderRadius: BorderRadius.all(
      Radius.circular(100),
    ),
  ),
);
