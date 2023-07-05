import 'package:flutter/material.dart';

class Boton extends StatefulWidget {
  final String title;
  final VoidCallback? onPressed; // Agrega un parámetro de tipo VoidCallback

  const Boton({
    required this.title,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<Boton> createState() => _BotonState();
}

class _BotonState extends State<Boton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed, // Utiliza el onPressed pasado como parámetro
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: 100,
            vertical: 20,
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          Colors.pink,
        ),
      ),
      child: Text(
        widget.title,
      ),
    );
  }
}
