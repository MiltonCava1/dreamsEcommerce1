import 'package:flutter/material.dart';
import '../../../../logica_negocio/subir_imagen_page.dart';
import '../../../widgets_utils/boton.dart';
import '../../../widgets_utils/input_text.dart';
import '../../titulos_gestion.dart';

class AddProductos extends StatefulWidget {
  const AddProductos({super.key});

  @override
  State<AddProductos> createState() => _AddProductosState();
}

class _AddProductosState extends State<AddProductos> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _marcaController = TextEditingController();
  final TextEditingController _coloresController = TextEditingController(); 
  final TextEditingController _stockController = TextEditingController();
  final TextEditingController _tallaController = TextEditingController();
  final TextEditingController _precioUnitarioController = TextEditingController();
  final TextEditingController _precioMayorController = TextEditingController();
  
  

  @override
  Widget build(BuildContext context) {
  return Material(
      child: Ink(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              const TituloGestion(
                title: "Gestionar Productos",
              ),
              const SizedBox(
                height: 30,
              ),

              //Formulario para los campos ---------
              InputText(
                title: "Nombre del producto",
                icon: Icons.add_circle_outline_outlined,
                mostrar: false,
                valueNotifier: _nameController,
              ),
              const SizedBox(
                height: 10,
              ),

              InputText(
                title: "Marca",
                icon: Icons.branding_watermark,
                mostrar: false,
                valueNotifier: _marcaController,
              ),
              const SizedBox(
                height: 10,
              ),

              InputText(
                title: "Colores",
                icon: Icons.color_lens,
                mostrar: false,
                valueNotifier: _coloresController,
              ),
              const SizedBox(
                height: 10,
              ),

              InputText(
                title: "Stock",
                icon: Icons.add_box,
                mostrar: false,
                valueNotifier: _stockController,
              ),

               InputText(
                title: "talla",
                icon: Icons.format_size_outlined,
                mostrar: false,
                valueNotifier: _tallaController,
              ),

              InputText(
                title: "Precio unitario",
                icon: Icons.monetization_on,
                mostrar: false,
                valueNotifier: _precioUnitarioController,
              ),

              InputText(
                title: "Precio al por mayor",
                icon: Icons.money_off_rounded,
                mostrar: false,
                valueNotifier: _precioMayorController,
              ),

              InputText(
                title: "Categoría",
                icon: Icons.category_rounded,
                mostrar: false,
                valueNotifier: _precioMayorController,
              ),

              const SizedBox(
                height: 10,
              ),
              
              ElevatedButton(
            onPressed: (){
              
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const ImagenPage()),
              );
            
            }, 
            child: const Text(
              "Subir Imagen"
            )),

              Boton(
                title: "Agregar Producto de ropa",
                onPressed: () async {
                  
                },
              ),
              const SizedBox(
                height: 30,
              ),

              //Llamamos a la tabla 
              /*
              const Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: 800,
                    height: 450,
                    child: TablaCategorias(),
                  ),
                ),
              ),
              */
            ],
          ),
        ),
      ),
    );
  }
}