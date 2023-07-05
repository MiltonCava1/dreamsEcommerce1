import 'package:cloud_firestore/cloud_firestore.dart';
import '../entidades/usuario_entidad.dart';

class UsuarioAcceso {

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
}
