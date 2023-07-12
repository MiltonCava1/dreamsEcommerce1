import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../acceso_datos/categoria_acceso.dart';
import '../../../widgets_utils/custom_dialog.dart';

void mostrarDialogoEditar(BuildContext context, DocumentReference referencia, String nombreActual, String descripcionActual) {
    final nombreController = TextEditingController(text: nombreActual);
    final descripcionController = TextEditingController(text: descripcionActual);
    CategoriaAcceso acceso = CategoriaAcceso();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Editar Categoría'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                ),
              ),
              TextFormField(
                controller: descripcionController,
                decoration: const InputDecoration(
                  labelText: 'Descripción',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Guardar'),
              onPressed: () async {
                
                
                try{
                  final nuevoNombre = nombreController.text;
                  final nuevaDescripcion = descripcionController.text;
                  final dialogContext = context;

                  acceso.actualizarCategoria(referencia, nuevoNombre, nuevaDescripcion);

                  await showDialog(
                    context: dialogContext,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Éxito'),
                        content: const Text('Se editó correctamente. Se guardaron los cambios realizados.'),
                        actions: [
                          TextButton(
                            child: const Text('Aceptar'),
                            onPressed: () {
                              Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
                  
                }catch(e){
                  CustomDialog.show(
                    context,
                    "Sucedio un error",
                    "Intentelo de nuevo",
                  );
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }