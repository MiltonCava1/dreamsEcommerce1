import 'package:app/presentacion/about_us/about_us_page.dart';
import 'package:app/presentacion/login/login_page.dart';
import 'package:app/presentacion/navegacion/navbar_logo.dart';
import 'package:app/presentacion/registrarse/registrarsePage.dart';
import 'package:flutter/material.dart';
import 'nav_bar_element.dart';

class NavBarDesktop extends StatelessWidget {
  const NavBarDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavBarLogo(),
          Row(
            mainAxisSize: MainAxisSize.min ,
            children: [
              ElementNavBar(
                element: "Inicio"),
              SizedBox(
                width: 20,
              ),
              ElementNavBar(element: "Ofertas"),
              SizedBox(
                width: 20,
              ),
              ElementNavBar(
                element: "Sobre nosotros",
                page: AboutUsPage(),
         
              ),
              SizedBox(
                width: 20,
              ),
              ElementNavBar(
                element: "Registrarse",
                page: RegistrarsePage(),
              ),
              SizedBox(
                width: 20,
              ),
              
              ElementNavBar(
                element: "Iniciar Sesión",
                page: LoginPage(),
           
              ),
            ],
          )
        ],
      ),
    );
  }
}



