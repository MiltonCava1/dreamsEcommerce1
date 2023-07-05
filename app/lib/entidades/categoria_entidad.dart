import 'package:cloud_firestore/cloud_firestore.dart';


class CategoriaEntidad {
  String nombre;
  String descripcion;

  CategoriaEntidad({
    required this.nombre,
    required this.descripcion,
  });

  // Método para convertir un documento de Firestore en una instancia de Usuario
  factory CategoriaEntidad.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return CategoriaEntidad(
  
      nombre: data['nombre'],
      descripcion: data['descripcion'],
     
    );
  }

  // Método para convertir una instancia de Usuario en un mapa de datos para Firestore
  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'descripcion': descripcion,
    };
  }
}
