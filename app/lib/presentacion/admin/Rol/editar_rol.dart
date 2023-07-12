import 'package:app/presentacion/widgets_utils/custom_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../acceso_datos/usuario_acceso.dart';

void mostrarDialogoEditar(BuildContext context, DocumentReference referencia, String nombreActual, DateTime fechaNacimientoActual, String emailActual, String rolActual) {
  final nombreController = TextEditingController(text: nombreActual);
  final fechaNacimientoController = TextEditingController(text: fechaNacimientoActual.toString());
  final emailController = TextEditingController(text: emailActual);
  final rolController = TextEditingController(text: rolActual);
  UsuarioAcceso acceso = UsuarioAcceso();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Editar Usuario'),
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
              controller: fechaNacimientoController,
              decoration: const InputDecoration(
                labelText: 'fechaNacimiento',
              ),
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'email',
              ),
            ),
            TextFormField(
              controller: rolController,
              decoration: const InputDecoration(
                labelText: 'rol',
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
              try {
                final nuevoNombre = nombreController.text;
                final nuevaFechaNacimiento = DateTime.parse(fechaNacimientoController.text);
                final nuevoEmail = emailController.text;
                final nuevorol = rolController.text;
                final dialogContext = context;

                await acceso.actualizarUsuario(referencia, nuevoNombre, nuevaFechaNacimiento, nuevoEmail, nuevorol);

                showDialog(
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
              } catch (e) {
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

/*
void mostrarDialogoEditar(BuildContext context, DocumentReference referencia, String nombreActual, DateTime fechaNacimientoActual, String emailActual, String rolActual) {
    final nombreController = TextEditingController(text: nombreActual);
    final fechaNacimientoController = TextEditingController(text: fechaNacimientoActual.toString());
    final emailController = TextEditingController(text: emailActual);
    final rolController = TextEditingController(text: rolActual);
    UsuarioAcceso acceso = UsuarioAcceso();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Editar Usuario'),
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
                controller: fechaNacimientoController,
                decoration: const InputDecoration(
                  labelText: 'fechaNacimiento',
                ),
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'email',
                ),
              ),
              TextFormField(
                controller: rolController,
                decoration: const InputDecoration(
                  labelText: 'rol',
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
                  //final nuevafechaNacimiento= fechaNacimientoController.text;
                  final nuevaEmail=emailController.text;
                  final nuevarol = rolController.text;
                  final dialogContext = context;

                  acceso.actualizarUsuario(referencia, nuevoNombre, nuevaFechaNacimiento,nuevaEmail,nuevarol);

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
  }*/