//Widget Reutilizable para el input -------------------

import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool mostrar;
  final TextEditingController valueNotifier;

  const InputText({
    required this.title,
    required this.icon,
    required this.mostrar,
    required this.valueNotifier,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.6,
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        child: TextField(
          onChanged: (value) {
            valueNotifier.value = TextEditingValue(
              text: value,
              selection: valueNotifier.value.selection,
            );
          },
          obscureText: mostrar,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(30.0), // Agregar bordes circulares
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.pink,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(30.0), // Agregar bordes circulares
            ),
            hintText: title,
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            prefixIcon: Icon(
              icon,
              color: Colors.pink,
            ),
          ),
        ),
      ),
    );
  }
}
