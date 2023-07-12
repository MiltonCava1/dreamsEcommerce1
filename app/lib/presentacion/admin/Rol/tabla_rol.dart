import 'package:app/presentacion/admin/Rol/editar_rol.dart';
import 'package:app/presentacion/admin/Rol/eliminar_rol.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class TablaUsuario extends StatefulWidget {

  const TablaUsuario({super.key});

  @override
  State<TablaUsuario> createState() => _TablaUsuarioState();
}
class _TablaUsuarioState extends State<TablaUsuario> {
  final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        title: const Center(
          child: Text('Tabla de Usuarios'),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('usuario').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar los datos'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final usuarios = snapshot.data!.docs;

          return ListView.builder(
            itemCount: usuarios.length,
            itemBuilder: (context, index) {
              final usuario = usuarios[index].data() as Map<String, dynamic>;
              final nombre = usuario['nombre'] ?? '';
              final fechaNacimiento = usuario['fechaNacimiento'] as Timestamp?;
              final email = usuario['email'] ?? '';
              final rol = usuario['rol'] ?? '';

              DateTime? fechaNacimientoDate;
              String fechaNacimientoFormatted = '';

              if (fechaNacimiento != null) {
                fechaNacimientoDate = fechaNacimiento.toDate();
                fechaNacimientoFormatted = formatter.format(fechaNacimientoDate);
              }

              return Card(
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nombre: $nombre'),
                      Text('Fecha de Nacimiento: $fechaNacimientoFormatted'),
                      Text('Email: $email'),
                      Text('Rol: $rol'),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          mostrarDialogoEditar(
                            context,
                            usuarios[index].reference,
                            nombre,
                            fechaNacimientoDate!,
                            email,
                            rol,
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          mostrarDialogoEliminar(context, usuarios[index].reference);
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

/*class _TablaUsuarioState extends State<TablaUsuario> {
  //final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
 // final String formattedDate = formatter.format(Timestamp.parse(fechaNacimiento).toDate());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        title: const Center(
          child: Text('Tabla de Usuarios'),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('usuario').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar los datos'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final usuarios = snapshot.data!.docs;

          return ListView.builder(
            itemCount: usuarios.length,
            itemBuilder: (context, index) {
              final usuario = usuarios[index].data() as Map<String, dynamic>;
              final nombre = usuario['nombre'] ?? '';
              final fechaNacimiento = usuario['fechaNacimiento'] ?? '';
              final email = usuario['email'] ?? '';
              final rol = usuario['rol'] ?? '';

              return Card(
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nombre: $nombre'),
                     
                      //Text('Fecha: ${Timestamp.parse(fechaNacimiento).toString()}'),
                      
                      Text('Fecha: $fechaNacimiento'),
                      Text('Email: $email'),
                      Text('Rol: $rol'),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          mostrarDialogoEditar(context, usuarios[index].reference, nombre, fechaNacimiento,email,rol );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {       
                          mostrarDialogoEliminar(context, usuarios[index].reference);
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
}*/
