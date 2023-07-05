import 'package:app/presentacion/navegacion/navbar_logo.dart';
import 'package:flutter/material.dart';

import '../../logica_negocio/validaciones.dart';
import '../widgets_utils/icon_button_custom.dart';
import '../widgets_utils/text_button_custom.dart';


class NavBarAdmin extends StatefulWidget {
  const NavBarAdmin({Key? key}) : super(key: key);

  @override
  State<NavBarAdmin> createState() => _NavBarAdminState();
}

class _NavBarAdminState extends State<NavBarAdmin> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 50),
            child: NavBarLogo(),
          ),
          Padding(
            padding: EdgeInsets.only(right: 50),
            child: Row(
              children: [
                
                IconButtonCustom(
                  iconData: Icons.notification_add, 
                  size: 35,
                  onPressed: () {
                    //Hacer algo
                  },
                ),

                const SizedBox(
                  width: 30,
                ),

                IconButtonCustom(
                  iconData: Icons.settings, 
                  size: 35,
                  onPressed: () {
                    //Hacer algo
                  },
                ),
               

                const SizedBox(
                  width: 30,
                ),
                
                textButtonCustom(
                  "Cerrar sesión", 
                  17, 
                  () async { 
                    funcionCerrarSesion();
                    Navigator.pushReplacementNamed(context,"/");
                  }
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
