import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../acceso_datos/categoria_acceso.dart';

void mostrarDialogoEliminar(BuildContext context, DocumentReference referencia) {
  CategoriaAcceso acceso = CategoriaAcceso();
  
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Eliminar Categoría'),
        content: const Text('¿Está seguro de que desea eliminar esta categoría?'),
        actions: [
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () {
              Navigator.of(context).pop(); // Cerrar el diálogo
            },
          ),
          TextButton(
            child: const Text('Aceptar'),
            onPressed: () {
              acceso.eliminarCategoria(referencia);
              Navigator.of(context).pop(); // Cerrar el diálogo
            },
          ),
        ],
      );
    },
  );
}