//la siguiente clase sirve para mostrar los elementos del navbar, esta es un widget reutilizable
import 'package:flutter/material.dart';

class ElementNavBar extends StatefulWidget {
  final String element;
  final Widget? page;
  
  const ElementNavBar({
    Key? key,
    required this.element,
    this.page,
  }) : super(key: key);

  @override
  _ElementNavBarState createState() => _ElementNavBarState();
}

class _ElementNavBarState extends State<ElementNavBar> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: TextButton(
        onPressed: () {
          if (widget.page != null){
            Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => widget.page!),
            );
          }

        },
        style: ButtonStyle(
           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // Ajusta el valor de borderRadius según tus necesidades
              side: BorderSide(
                color: isHovered ? Colors.pink.shade50 : Colors.transparent, // Ajusta el color del borde según tus necesidades
              ),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            isHovered ? Color(0xffFFD1DC) : Colors.transparent,
          ),
        ),
        child: Text(
          widget.element,
          style: const TextStyle(
            fontSize: 18,
            letterSpacing: 2,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
