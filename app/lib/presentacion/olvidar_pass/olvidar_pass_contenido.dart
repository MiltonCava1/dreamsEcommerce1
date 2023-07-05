import 'package:flutter/material.dart';
import '../../logica_negocio/validaciones.dart';
import '../widgets_utils/boton.dart';
import '../widgets_utils/custom_dialog.dart';
import '../widgets_utils/input_text.dart';

class OlvidarPassContenido extends StatefulWidget {
  const OlvidarPassContenido({super.key});

  @override
  State<OlvidarPassContenido> createState() => _OlvidarPassContenidoState();
}

class _OlvidarPassContenidoState extends State<OlvidarPassContenido> {

  final TextEditingController _emailController = TextEditingController();
 
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
                "assets/img/backgraund3.jpg",
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
                        "Recupera tu cuenta",
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

                      const SizedBox(
                        height: 10,
                      ),
                      
                      //Boton:
                      Boton(
                        title: "Buscar",
                        onPressed: () async {

                          if(funcionVacioInput(_emailController.text) == true){
                             var result = await funcionRecuperarPass(_emailController.text);

                            if(result == true){
                              CustomDialog.show(
                                context,
                                "Restablezca su contraseña",
                                "Se le envío un correo electrónico a la dirección ${_emailController.text}",
                              );
                            }
                            else {
                              CustomDialog.show(
                                context, 
                                "El correo no esta registrado, vuelva a intentar", 
                                "Ingrese un correo registrado",
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