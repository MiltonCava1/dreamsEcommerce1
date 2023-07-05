import 'package:flutter/material.dart';
import '../footer/footer.dart';
import '../navegacion/nav_bar.dart';
import 'olvidar_pass_contenido.dart';


class OlvidarPassPage extends StatefulWidget {
  const OlvidarPassPage({Key? key}) : super(key: key);

  @override
  State<OlvidarPassPage> createState() => _OlvidarPassPageState();
}

class _OlvidarPassPageState extends State<OlvidarPassPage> {
  @override
  Widget build(BuildContext context) {

    double ancho = MediaQuery.of(context).size.width;
    double maxWith = ancho > 1200 ? 1400 : ancho;
    
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: maxWith,
          child: Column(
            children: [
              NavBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      OlvidarPassContenido(), 
                      Footer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
