import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'cargar_imagen.dart';

class ImagenPage extends StatefulWidget {
  const ImagenPage({Key? key}) : super(key: key);

  @override
  _ImagenPageState createState() => _ImagenPageState();
}

class _ImagenPageState extends State<ImagenPage> {
  html.File? imagenToUpload;
  String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("--SUBIR IMAGENES--"),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            color: Colors.red,
            width: double.infinity,
            child: imageUrl != null
                ? Image.network(imageUrl!, fit: BoxFit.contain)
                : const SizedBox(),
          ),
          ElevatedButton(
            onPressed: () async {
              await getImagen((imagen) {
                if (imagen != null) {
                  setState(() {
                    imagenToUpload = imagen;
                    imageUrl = html.Url.createObjectUrl(imagen);
                  });
                }
              });
            },
            child: const Text("Seleccionar Imagen"),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
             onPressed: ()  async {
             
              if (imagenToUpload == null){
                return;
              } 
              else {
                /*
                final upload = await subirImagen(imagenToUpload!);
                */
              }
             }, 
             /*imagenToUpload != null ? () => subirImagen() : null,*/
            child: const Text("Subir Imagen"),
          ),
        ],
      ),
    );
  }
}
 

