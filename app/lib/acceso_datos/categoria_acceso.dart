import 'package:cloud_firestore/cloud_firestore.dart';
import '../entidades/categoria_entidad.dart';

class CategoriaAcceso {

  //Instancia de firestore
  FirebaseFirestore db = FirebaseFirestore.instance;

  //Guardar en Cloud Firesote
 Future<void> guardar(String nombre, String descripcion) async {

    CategoriaEntidad entidad = CategoriaEntidad(
      nombre: nombre, 
      descripcion: descripcion
    );

    await db.collection("categoria").add(entidad.toMap());
  }


  Future<void> actualizarCategoria(DocumentReference referencia,
    String nuevoNombre,
    String nuevaDescripcion) async {
    await referencia.update({
      'nombre': nuevoNombre,
      'descripcion': nuevaDescripcion,
    });
  }

  Future <void> eliminarCategoria(DocumentReference referencia) async {
    await referencia.delete();
  }
}
