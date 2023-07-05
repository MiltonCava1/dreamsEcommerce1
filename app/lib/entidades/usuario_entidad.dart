import 'package:cloud_firestore/cloud_firestore.dart';


class UsuarioEntidad {
  String uid;
  String email;
  String nombre;
  DateTime fechaNacimiento;
  String rol;


  UsuarioEntidad({
    required this.uid,
    required this.email,
    required this.nombre,
    required this.fechaNacimiento,
    required this.rol,
  });

  // Método para convertir un documento de Firestore en una instancia de Usuario
  factory UsuarioEntidad.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return UsuarioEntidad(
      uid: snapshot.id,
      email: data['email'],
      nombre: data['nombre'],
      fechaNacimiento: data['fecha_nacimiento'].toDate(),
      rol: data['rol'],
    );
  }

  // Método para convertir una instancia de Usuario en un mapa de datos para Firestore
  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'email': email,
      'fecha_nacimiento': fechaNacimiento,
      'rol': rol,
    };
  }
}
