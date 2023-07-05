import 'package:app/presentacion/about_us/about_us_page.dart';
import 'package:app/presentacion/admin/admin_page.dart';
import 'package:app/presentacion/login/login_page.dart';
import 'package:app/presentacion/olvidar_pass/olvidar_pass_page.dart';
import 'package:app/presentacion/registrarse/registrarsePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'conexion/conexion.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {

  //Inicializar FireBase
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
    options: ConexionFirebase.currentPlatform,
  );

  //Configuración de formato:
  await initializeDateFormatting('en');

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eDreams',
      debugShowCheckedModeBanner: false, //Quita el banner de debug
      initialRoute: '/',
      routes: {
        '/': (context) => const AboutUsPage(),
        '/Registrarse': (context) => const RegistrarsePage(),
        '/IniciarSesion': (context) => const LoginPage(),
        '/IniciarSesion/RecuperarPass': (context) => const OlvidarPassPage(),
      },
    );
  }
}