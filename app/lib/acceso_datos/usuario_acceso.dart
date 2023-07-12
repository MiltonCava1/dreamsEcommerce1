import 'package:cloud_firestore/cloud_firestore.dart';
//import '../entidades/usuario_entidad.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsuarioAcceso {
  // Instancia de Firestore
  FirebaseFirestore db = FirebaseFirestore.instance;

  // Guardar en Cloud Firestore
  Future<void> guardar(String uid, String email, String nombre, DateTime fechaNacimiento, String rol) async {
    UsuarioEntidad entidad = UsuarioEntidad(
      uid: uid,
      email: email,
      nombre: nombre,
      fechaNacimiento: fechaNacimiento,
      rol: rol,
    );
    await db.collection("usuario").doc(uid).set({
      'email': entidad.email,
      'nombre': entidad.nombre,
      'fechaNacimiento': Timestamp.fromDate(entidad.fechaNacimiento),
      'rol': entidad.rol,
    });
  }

  Future<void> actualizarUsuario(DocumentReference referencia, String nuevoNombre, DateTime nuevaFechaNacimiento, String nuevoEmail, String nuevoRol) async {
    await referencia.update({
      'nombre': nuevoNombre,
      'fechaNacimiento': Timestamp.fromDate(nuevaFechaNacimiento), // Convertir DateTime a Timestamp
      'email': nuevoEmail,
      'rol': nuevoRol,
    });
  }
 /*Future<void> actualizarUsuario(DocumentReference referencia, String nuevoNombre, Timestamp  nuevaFechaNacimiento, String nuevoEmail, String nuevoRol) async {
    await referencia.update({
      'nombre': nuevoNombre,
      //'fechaNacimiento': Timestamp.fromDate(nuevaFechaNacimiento.toDate()),
      'fechaNacimiento': Timestamp.fromDate(nuevaFechaNacimiento.toDate()),
      'email': nuevoEmail,
      'rol': nuevoRol,
    });
  }*/

  Future<void> eliminarUsuario(DocumentReference referencia) async {
    await referencia.delete();
  }
}

class UsuarioEntidad {
  final String uid;
  final String email;
  final String nombre;
  final DateTime fechaNacimiento;
  final String rol;

  UsuarioEntidad({required this.uid, required this.email, required this.nombre, required this.fechaNacimiento, required this.rol});
}

/*class UsuarioAcceso {

  //Instancia de firestore
  FirebaseFirestore db = FirebaseFirestore.instance;

  //Guardar en Cloud Firesote
 Future<void> guardar(String uid, String email, String nombre, DateTime fechaNacimiento, String rol) async {
  UsuarioEntidad entidad = UsuarioEntidad(
    uid: uid, 
    email: email, 
    nombre: nombre, 
    fechaNacimiento: fechaNacimiento, 
    rol: rol
  ); 
    await db.collection("usuario").doc(uid).set({
      'email': entidad.email,
      'nombre': entidad.nombre,
      'fechaNacimiento': Timestamp.fromDate(entidad.fechaNacimiento),
      'rol' : entidad.rol
    });
  }

  Future<void> actualizarUsuario(DocumentReference referencia,
    String nuevoNombre,
    String nuevafechaNacimiento,
    String nuevaEmai,
    String nuevarol) async {
    await referencia.update({
      'nombre': nuevoNombre,
      'fechaNacimiento': nuevafechaNacimiento,
      'email':nuevaEmai,
      'rol':nuevarol
    });
  }

  Future <void> eliminarUsuario(DocumentReference referencia) async {
    await referencia.delete();
  }
}*/
