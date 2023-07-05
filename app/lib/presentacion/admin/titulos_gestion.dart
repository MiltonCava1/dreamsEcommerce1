import 'package:flutter/material.dart';

class TituloGestion extends StatelessWidget {
  final String title;

   const TituloGestion({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [ 
        Container(
        height: 45,
        width: double.infinity,
        color: Colors.pink,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30
            ),
          ),
        )
      ] 
    );
  }
}