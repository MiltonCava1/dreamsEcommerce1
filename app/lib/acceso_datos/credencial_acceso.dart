import 'package:firebase_auth/firebase_auth.dart';

class CredencialAcceso {

  FirebaseAuth auth = FirebaseAuth.instance;
  
  Future <String> guardar (String email, String pass) async{
    
    try {
      var credential = await auth.createUserWithEmailAndPassword(
      email: email, 
      password: pass
      );
     
     return credential.user!.uid;
    }
    catch(e){
     return "null"; 
    }
    
  }
}