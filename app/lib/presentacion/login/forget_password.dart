import 'package:flutter/material.dart';

import '../olvidar_pass/olvidar_pass_page.dart';

Widget forgetPassword(BuildContext context) {
    return Container(
      height: 35,
      alignment: Alignment.center,
      child: TextButton(
        child: const Text(
          "Olvidaste la contraseña?",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
            ),
          textAlign: TextAlign.center,
        ),
        onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => const OlvidarPassPage()),
          );
        }
      ),
    );
}
  