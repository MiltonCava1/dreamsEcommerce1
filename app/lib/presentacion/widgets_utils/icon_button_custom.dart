import 'package:flutter/material.dart';

class IconButtonCustom extends StatelessWidget {
  final IconData iconData;
  final double size;
  final VoidCallback? onPressed;

  const IconButtonCustom({
    required this.iconData,
    required this.size,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onPressed,
        child: Ink(
          child: IconButton(
            icon: Icon(
              iconData,
            ),
            iconSize: size,
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
