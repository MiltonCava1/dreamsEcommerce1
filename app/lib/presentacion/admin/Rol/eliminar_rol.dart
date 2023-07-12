import 'package:app/acceso_datos/usuario_acceso.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


void mostrarDialogoEliminar(BuildContext context, DocumentReference referencia) {
  UsuarioAcceso acceso = UsuarioAcceso();
  
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Eliminar Usuario'),
        content: const Text('¿Está seguro de que desea eliminar esta usuario?'),
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
              acceso.eliminarUsuario(referencia);
              Navigator.of(context).pop(); // Cerrar el diálogo
            },
          ),
        ],
      );
    },
  );
}