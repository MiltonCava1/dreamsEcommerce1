import 'package:app/presentacion/admin/titulos_gestion.dart';
import 'package:app/presentacion/widgets_utils/boton.dart';
import 'package:flutter/material.dart';
import '../../logica_negocio/tabla_categoria.dart';
import '../../logica_negocio/validar_categoria.dart';
import '../widgets_utils/input_text.dart';

class GestionarCategoria extends StatefulWidget {
  const GestionarCategoria({Key? key});

  @override
  State<GestionarCategoria> createState() => _GestionarCategoriaState();
}

class _GestionarCategoriaState extends State<GestionarCategoria> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              const TituloGestion(
                title: "Gestionar categoría",
              ),
              const SizedBox(
                height: 30,
              ),
              InputText(
                title: "Nombre de la categoria",
                icon: Icons.app_registration_sharp,
                mostrar: false,
                valueNotifier: _nameController,
              ),
              const SizedBox(
                height: 10,
              ),
              InputText(
                title: "Descripcion",
                icon: Icons.description_sharp,
                mostrar: false,
                valueNotifier: _descripcionController,
              ),
              const SizedBox(
                height: 30,
              ),
              Boton(
                title: "Agregar Categoria de ropa",
                onPressed: () async {
                  agregarValidarCategoria(
                    context,
                    _nameController.text,
                    _descripcionController.text,
                  );
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: 800,
                    height: 400,
                    child: TablaCategorias(),
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

