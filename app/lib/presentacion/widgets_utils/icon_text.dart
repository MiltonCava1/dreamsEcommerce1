import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String descripcion;
  final VoidCallback? onPressed;

  const IconText({
    required this.icon,
    required this.descripcion,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: const Color(0xff373656),
        child: Ink(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: onPressed, 
                icon: Icon(icon),
                color: Colors.white,
              ),

              Text(
                descripcion,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  decoration: TextDecoration.none
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
