import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//Funcion para validar que no este vacío el Input
bool funcionVacioInput(String valor) {
  if(valor.isEmpty){
    return false;
  }
  return true;
}


//Función valida un correo electrónico con formato valido
bool funcionvalidarCorreo(String correo) {
  RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  var expresion = regex.hasMatch(correo);
  return expresion; //Devuelve ture si cumple
}


//Función para validar cadena valida (nombres, apellido)
bool funcionvalidarNombre(String nombre) {
  RegExp regex = RegExp(r'^[a-zA-Z ]+$');
  return regex.hasMatch(nombre); //devuelve true si cumple
}

//Funcion para validar que la fecha sea menor a la actual y sea mayor de edad
bool funcionValidarFechaYEdad(DateTime? fechaNacimiento) {
  if (fechaNacimiento == null) {
    return false;
  }

  DateTime fechaActual = DateTime.now();

  Duration diferencia = fechaActual.difference(fechaNacimiento);
  int edad = diferencia.inDays ~/ 365;

  if (edad < 18) {
    return false;
  }

  return true;
}



//Funcion para validar que un correo electrónico no este registrado


Future<bool> verificarCorreoRegistrado(String email) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  try {
    var signInMethods = await auth.fetchSignInMethodsForEmail(email);
    return signInMethods.isNotEmpty; //Si ya esta registrada devuelve True
  } catch (e) {
    return false;
  }
}


//Funcion para loguear usuario:

Future<bool> funcionLoguear(String email, String pass) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  try {
    await auth.signInWithEmailAndPassword(
      email: email, 
      password: pass,
    );
    // Inicio de sesión exitoso
    return true;
  } catch (e) {
    // Error al iniciar sesión
    return false;
  }
}


//Funcion para recuperar la contraseña:
Future<bool> funcionRecuperarPass(String email) async {
  try {
    List<String> signInMethods =
        await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);

    if (signInMethods.isNotEmpty) {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return true;
    } else {
      return false;
    }
  } catch (e) {
  
    return false;
  }
}


//Funcion para determinar una contraseña segura, minimo 8 caracteres, minimo una letra y numero

bool funcionValidarPass(String contrasena) {
  // Validar el mínimo de 8 caracteres
  if (contrasena.length < 8) {
    return false;
  }

  // Validar que la contraseña contenga al menos una letra, un número o un carácter especial
  RegExp letraRegex = RegExp(r'[a-zA-Z]');
  RegExp numeroRegex = RegExp(r'[0-9]');
  RegExp caracterEspecialRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

  if (!letraRegex.hasMatch(contrasena) &&
      !numeroRegex.hasMatch(contrasena) &&
      !caracterEspecialRegex.hasMatch(contrasena)) {
    return false;
  }

  // La contraseña cumple con los criterios de seguridad
  return true;
}


//Funcion para determinar el tipo de usuario (administrador, empleado, cliente)
Future<String> funcionGetRol(String uid) async {
  try {
    FirebaseFirestore db = FirebaseFirestore.instance;
    DocumentReference documentReference = db.collection('usuario').doc(uid);
    
    DocumentSnapshot snapshot = await documentReference.get();
    String valorCampo = snapshot.get('rol'); // Reemplaza 'nombreDelCampo' por el nombre del campo que deseas obtener
    
    return valorCampo;
  } catch (e) {
    print(e.toString());
    return "";
  }
}




Future<String> funcionObtenerUID(String email) async {
  try {
    FirebaseAuth auth = FirebaseAuth.instance;
    
    User? user = auth.currentUser;
    
    if (user != null) {
      String uid = user.uid;
      print(uid);
      return uid;
    } else {
      throw Exception('El usuario no está autenticado');
    }
  } catch (e) {
    print(e.toString());
    return "";
  }
}



//Funcion para cerrar sesión:
Future <void> funcionCerrarSesion () async {
  await FirebaseAuth.instance.signOut();
}