import 'package:app/logica_negocio/validaciones.dart';
import 'package:app/presentacion/admin/admin_page.dart';
import 'package:app/presentacion/widgets_utils/boton.dart';
import 'package:app/presentacion/widgets_utils/custom_dialog.dart';
import 'package:app/presentacion/widgets_utils/custom_dialog_nav.dart';
import 'package:app/presentacion/widgets_utils/password_input.dart';
import 'package:flutter/material.dart';
import '../widgets_utils/input_text.dart';
import 'forget_password.dart';

class LoginContenido extends StatefulWidget {
  const LoginContenido({super.key});

  @override
  State<LoginContenido> createState() => _LoginContenidoState();
}

class _LoginContenidoState extends State<LoginContenido> {

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
                "assets/img/backgraund2.jpg",
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
                        "Iniciar Sesión",
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
                        title: "Iniciar Sesión",
                        onPressed: () async {
                          if(funcionVacioInput(_emailController.text) == true && funcionVacioInput(_passController.text) == true){

                            if (await funcionLoguear(_emailController.text, _passController.text)) {
                              
                              String valorUid = await funcionObtenerUID(_emailController.text);
                              String valorRol = await funcionGetRol(valorUid);
                          
                              switch (valorRol) {
                                case 'administrador':
                                CustomDialogNav.show(
                                  context,
                                  "Bienvenido al sistema eCommerce eDreams",
                                  "A ingresado como administrador",
                                  AdminPage(),
                                );
                                break;
                              }
                            
                            }
                            else{
                              CustomDialog.show(
                                context,
                                "Error en el inicio de sesión",
                                "Ingrese el usuario y la contraseña correctas"
                              );
                            }
                          }
                          else {
                            CustomDialog.show(
                                context,
                                "Campos vacíos",
                                "Llene el valor de todos los campos"
                            );
                          }
                        }, 
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      
                      //Olvidaste la contraseña:
                      forgetPassword(context),
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


