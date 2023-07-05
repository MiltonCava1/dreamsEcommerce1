import 'package:app/presentacion/login/login_contenido.dart';
import 'package:flutter/material.dart';

import '../footer/footer.dart';
import '../navegacion/nav_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


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
                      //Contenido de login
                      LoginContenido(),

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