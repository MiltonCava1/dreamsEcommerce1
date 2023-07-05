import 'package:app/presentacion/footer/footer.dart';
import 'package:flutter/material.dart';
import '../navegacion/nav_bar.dart';
import 'about_us_contenido.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage ({super.key});

  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width; //obtiene el ancho de la pantalla
    double maxWith = ancho > 1200 ? 1400 : ancho; //Define el tamaño de la pantalla

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: maxWith,
          child: const Column(
            children: [
              //NavBar
              NavBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AboutUsContenido(),
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

