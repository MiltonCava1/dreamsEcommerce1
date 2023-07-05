import 'package:app/acceso_datos/credencial_acceso.dart';
import 'package:app/acceso_datos/usuario_acceso.dart';

class CreacionCuenta {
  CredencialAcceso credencial = CredencialAcceso();
  UsuarioAcceso user = UsuarioAcceso();

  Future<bool> crearUsuario(String email, String pass, String nombre, DateTime fechaNacimiento, String rol) async{

    try {
      
      String uid = await credencial.guardar(email, pass);
      await user.guardar(
        uid, 
        email,
        nombre, 
        fechaNacimiento, 
        rol);
      return true;
    }
    catch (e){
      return false;
    }
  }
}