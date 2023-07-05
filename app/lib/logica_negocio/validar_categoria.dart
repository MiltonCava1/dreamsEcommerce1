import 'package:app/logica_negocio/validaciones.dart';
import 'package:flutter/material.dart';
import '../acceso_datos/categoria_acceso.dart';
import '../presentacion/widgets_utils/custom_dialog.dart';

Future<void> agregarValidarCategoria(BuildContext context, String name, String descripcion) async {
  var a = funcionVacioInput(name);
  var b = funcionVacioInput(descripcion);
  
  if (a == true && b == true) {
    var c = funcionvalidarNombre(name);

    if (c == true) {
      try {
        CategoriaAcceso acceso = CategoriaAcceso();
        acceso.guardar(
          name,
          descripcion,
        );

        CustomDialog.show(
          context,
          "Categoria agregada",
          "Se agregó la categoría correctamente",
        );
      } catch (e) {
        CustomDialog.show(
          context,
          "Ocurrió un error",
          "Por favor, vuelva a intentarlo",
        );
      }
    } else {
      CustomDialog.show(
        context,
        "Nombre de categoría no válido",
        "Ingrese un nombre válido para la categoría",
      );
    }
  } else {
    CustomDialog.show(
      context,
      "Campos vacíos",
      "Ingrese el valor de todos los campos",
    );
  }
}
