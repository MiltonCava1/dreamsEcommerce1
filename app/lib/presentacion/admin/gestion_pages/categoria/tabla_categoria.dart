import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'editar_categoria_dialogo.dart';
import 'eliminar_categoria_dialogo.dart';

class TablaCategorias extends StatefulWidget {

  const TablaCategorias({super.key});

  @override
  State<TablaCategorias> createState() => _TablaCategoriasState();
}

class _TablaCategoriasState extends State<TablaCategorias> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        title: const Center(
          child: Text('Tabla de Categorías'),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('categoria').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar los datos'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final categorias = snapshot.data!.docs;

          return ListView.builder(
            itemCount: categorias.length,
            itemBuilder: (context, index) {
              final categoria = categorias[index].data() as Map<String, dynamic>;
              final nombre = categoria['nombre'] ?? '';
              final descripcion = categoria['descripcion'] ?? '';

              return Card(
                child: ListTile(
                  title: Text(nombre),
                  subtitle: Text(descripcion),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          mostrarDialogoEditar(context, categorias[index].reference, nombre, descripcion);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {       
                          mostrarDialogoEliminar(context, categorias[index].reference);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

