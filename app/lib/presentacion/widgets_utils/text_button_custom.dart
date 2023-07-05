import 'package:flutter/material.dart';

Widget textButtonCustom (String title, double height, VoidCallback? onPressed) {
  return SizedBox(
    height: height,
    child: TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(
          letterSpacing: 1,
          fontSize: 15,
          color: Colors.pink,
          fontWeight: FontWeight.bold
        ),
      ),
    ),
  );
}
