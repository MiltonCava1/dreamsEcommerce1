import 'package:app/presentacion/admin/gestionar_categoria.dart';
import 'package:flutter/material.dart';
import '../widgets_utils/icon_text.dart';
import 'admin_navbar.dart';
import 'agregar_productos.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  String selectedOption = '';

  Widget _buildDynamicContent() {
    if (selectedOption == 'a') {
      return const AddProductos();
    } else if (selectedOption == 'b') {
      return const Align(
        alignment: Alignment.center,
        child: GestionarCategoria(),
      );
    } else if (selectedOption == 'c') {
      return Text("Hola");
    } else if (selectedOption == "d") {
      return Text("A");
    } else if (selectedOption == "e") {
      return Text("MImir");
    } else if (selectedOption == "f") {
      return Text("Ahora");
    }

    return const Text(
      'Bienvenido elija una opción del panel',
      style: TextStyle(
        color: Colors.pink,
        letterSpacing: 3,
        fontSize: 30,
        decoration: TextDecoration.none,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const NavBarAdmin(),
        Expanded(
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    color: const Color(0xff373656),
                    width: 400,
                    height: double.infinity,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Panel de Administración",
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          IconText(
                            icon: Icons.add_business,
                            descripcion: 'Agregar Productos',
                            onPressed: () {
                              setState(() {
                                selectedOption = 'a';
                              });
                            },
                          ),
                          IconText(
                            icon: Icons.add,
                            descripcion: 'Agregar categorias',
                            onPressed: () {
                              setState(() {
                                selectedOption = 'b';
                              });
                            },
                          ),
                          IconText(
                            icon: Icons.shopping_cart_checkout,
                            descripcion: 'Controlar Stock',
                            onPressed: () {
                              setState(() {
                                selectedOption = 'c';
                              });
                            },
                          ),
                          IconText(
                            icon: Icons.person,
                            descripcion: 'Agregar Usuarios',
                            onPressed: () {
                              setState(() {
                                selectedOption = 'd';
                              });
                            },
                          ),
                          IconText(
                            icon: Icons.content_paste_sharp,
                            descripcion: 'Reportes',
                            onPressed: () {
                              setState(() {
                                selectedOption = 'e';
                              });
                            },
                          ),
                          IconText(
                            icon: Icons.settings,
                            descripcion: 'Variables',
                            onPressed: () {
                              setState(() {
                                selectedOption = 'f';
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  color: Colors.grey[200],
                  child: Center(
                    child: _buildDynamicContent(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
