import 'package:flutter/material.dart';

Widget boX(String text) {
  return Container(
    height: 45,
    width: 200,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      gradient: LinearGradient(
        colors: [Color(0xfffddb81), Color(0xffe65c1e)],
      ),
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}