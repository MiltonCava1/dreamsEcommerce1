import 'package:app/presentacion/registrarse/registrarse_contenido.dart';
import 'package:flutter/material.dart';
import '../footer/footer.dart';
import '../navegacion/nav_bar.dart';

class RegistrarsePage extends StatefulWidget {
  const RegistrarsePage({super.key});

  @override
  State<RegistrarsePage> createState() => _RegistrarsePageState();
}

class _RegistrarsePageState extends State<RegistrarsePage> {
 
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
                      //Contenido de Registrarse
                      RegistrarseContenigo(),

                      //Footer de la aplicación
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