import 'package:app/presentacion/about_us/about_us_page.dart';
import 'package:app/presentacion/login/login_page.dart';
import 'package:app/presentacion/navegacion/nav_bar_element.dart';
import 'package:app/presentacion/registrarse/registrarsePage.dart';
import 'package:flutter/material.dart';

import 'navbar_logo.dart';

class NavBarMobile extends StatelessWidget {
  const NavBarMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.menu),
            onSelected: (String result) {
              // Aquí puedes realizar alguna acción en función del ítem seleccionado
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                child: ElementNavBar(element: "Inicio"),
              ),
              const PopupMenuItem<String>(
                child: ElementNavBar(element: "Ofertas"),
              ),
              const PopupMenuItem<String>(
                child: ElementNavBar(
                  element: "Sobre nosotros",
                  page: AboutUsPage(),
  
                ),
              ),
              const PopupMenuItem<String>(
                child: ElementNavBar(
                  element: "Registrarse",
                  page: RegistrarsePage(),
                ),
              ),

               const PopupMenuItem<String>(
                child: ElementNavBar(
                  element: "Iniciar sesión",
                  page: LoginPage(),
                ),
              ),

              /*
              const PopupMenuItem<String>(
                child: ElementNavBar(
                  element: "Iniciar Sesión",
                  page: Login(),
                ),
              ),
              */
            ],
          ),
          const NavBarLogo(),
        ],
      ),
    );
    
  }
}