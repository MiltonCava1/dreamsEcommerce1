import 'package:app/presentacion/about_us/about_us_page.dart';
import 'package:app/presentacion/widgets_utils/boton.dart';
import 'package:app/presentacion/widgets_utils/custom_dialog_nav.dart';
import 'package:app/presentacion/widgets_utils/date_text.dart';
import 'package:app/presentacion/widgets_utils/input_text.dart';
import 'package:app/presentacion/widgets_utils/custom_dialog.dart';
import 'package:flutter/material.dart';
import '../../logica_negocio/creacion_cuenta.dart';
import '../../logica_negocio/validaciones.dart';
import '../widgets_utils/password_input.dart';

class RegistrarseContenigo extends StatefulWidget {
  const RegistrarseContenigo({super.key});

  @override
  State<RegistrarseContenigo> createState() => _RegistrarseContenigoState();
}

class _RegistrarseContenigoState extends State<RegistrarseContenigo> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 500,
        child: Stack(
          fit: StackFit.expand, //Permite que pueda ocupar el stack todo el ancho disponible
          children: [
            Opacity(
              opacity: 0.7,
              child: Image.asset(
                "assets/img/backgraund.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Center(
                child: Opacity(
                  opacity: 0.9,
                  child: Container(
                    width: 1000,
                    height: 400,
                    color: Colors.black,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                        "Registrate",
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 3,
                          fontSize: 28
                          ),
                        ),
                        const SizedBox(
                            height: 30,
                        ),
                
                        //Llamamos a los inputs:
                      Container(
                        child: InputText(
                            title: "Nombre y Apellido", 
                            icon: Icons.person_outlined, 
                            mostrar: false, 
                            valueNotifier: _nameController,
                        ),
                      ),
              
                      DateText(
                        title: "Fecha de nacimiento", 
                        icon: Icons.date_range_outlined, 
                        valueNotifier: _dateController
                      ),

                      InputText(
                          title: "Correo electrónico", 
                          icon: Icons.email_outlined, 
                          mostrar: false, 
                          valueNotifier: _emailController,
                      ),

                      PasswordInput(
                        title: "Contraseña", 
                        icon: Icons.lock, 
                        valueNotifier: _passController,
                      ),
                      
                      
                      const SizedBox(
                        height: 10,
                      ),
                        //Boton:
                      Boton(
                        title: "Crear cuenta",
                        onPressed: () async {
                          var a = funcionVacioInput(_nameController.text);
                          var b = funcionVacioInput(_dateController.text);
                          var c = funcionVacioInput(_emailController.text);
                          var d = funcionVacioInput(_passController.text);
                          if (a == true && b == true && c == true && d == true) {
                            CreacionCuenta crear = CreacionCuenta();
                            DateTime? fechaNacimiento = DateTime.tryParse(_dateController.text);
                            
                            if (funcionvalidarNombre(_nameController.text) == true) {
                              if (funcionValidarFechaYEdad(fechaNacimiento)) {
                                if (await verificarCorreoRegistrado(_emailController.text) == false) {
                                  if (funcionvalidarCorreo(_emailController.text)) {
                                    if (funcionValidarPass(_passController.text) == true){
                                      await crear.crearUsuario(
                                      _emailController.text,
                                      _passController.text,
                                      _nameController.text,
                                      fechaNacimiento!,
                                      "cliente",
                                    );

                                    CustomDialogNav.show(
                                      context,
                                      "Se registro correctamente",
                                      "Se creo correctamente su usuario en la base de datos",
                                      AboutUsPage(),
                                    );
                                    }
                                    else {
                                      CustomDialog.show(
                                      context,
                                      "Establezca una contraseña segura",
                                      "Debe tener mínimo 8 caracteres y usar algún caracter especial o letra",
                                    );
                                    }
                                    
                                  } else {
                                    CustomDialog.show(
                                      context,
                                      "Formato de correo electrónico no válido",
                                      "Asegúrese de escribir un formato válido",
                                    );
                                  }
                                } else {
                                  CustomDialog.show(
                                    context,
                                    "Este correo electrónico ya está registrado",
                                    "Ingrese otro correo",
                                  );
                                }
                              } else {
                                CustomDialog.show(
                                  context,
                                  "Fecha incorrecta",
                                  "Debe ser mayor de edad",
                                );
                              }
                            } else {
                              CustomDialog.show(
                                context,
                                "Nombre no válido",
                                "Asegúrese de no ingresar caracteres especiales",
                              );
                            }
                          } else {
                            CustomDialog.show(
                              context,
                              "Campos vacíos",
                              "Ingrese el valor de todos los campos",
                            );
                          }
                        },
                      ),
                    ],
                  ),
                  ),
                ),
            ),
          ),
        ],
      ),
    );
  }
}




