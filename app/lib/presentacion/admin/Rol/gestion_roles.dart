//import 'package:app/logica_negocio/tabla_roles.dart';
//import 'package:app/acceso_datos/categoria_acceso.dart';
import 'package:app/logica_negocio/creacion_cuenta.dart';
import 'package:app/presentacion/admin/Rol/tabla_rol.dart';
import 'package:app/presentacion/admin/titulos_gestion.dart';
import 'package:app/presentacion/widgets_utils/boton.dart';

//import 'package:app/presentacion/widgets_utils/input_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class GestionRoles extends StatefulWidget {
  const GestionRoles({super.key});

  @override
    State<GestionRoles> createState() => _GestionRolesState();
}
class _GestionRolesState extends State<GestionRoles> {
  String _seleccionarOpcion = "ROL";
  List<String> _opciones = ['ROL', 'Administrador', 'Empleado'];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passController =TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  DateTime? _fechaNacimiento;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              const TituloGestion(
                title: "Crear Usuarios",
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Nombre y apellido",
                  icon: Icon(Icons.person),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      enabled: false,
                      controller: TextEditingController(
                        text: _fechaNacimiento != null
                            ? _fechaNacimiento!.toString()
                            : '',
                      ),
                      decoration: InputDecoration(
                        labelText: "Fecha Nacimiento",
                        icon: Icon(Icons.calendar_month),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () {
                      DatePicker.showDatePicker(
                        context,
                        showTitleActions: true,
                        onConfirm: (date) {
                          setState(() {
                            _fechaNacimiento = date;
                          });
                        },
                        //currentTime: DateTime.now(),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  icon: Icon(Icons.email),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _passController,
                decoration: InputDecoration(
                  labelText: "Password",
                  icon: Icon(Icons.password),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownButton<String>(
                value: _seleccionarOpcion,
                onChanged: (String? nuevoValor) {
                  setState(() {
                    _seleccionarOpcion = nuevoValor!;
                  });
                },
                items: _opciones.map((String opcion) {
                  return DropdownMenuItem<String>(
                    value: opcion,
                    child: Text(opcion),
                    
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 30,
              ),
              Boton(
                title: "Agregar nuevo Usuario",
                onPressed: () async {
                 CreacionCuenta creacion = CreacionCuenta();
                 await creacion.crearUsuario( _emailController.text,  _passController.text, _nameController.text, _fechaNacimiento!,_seleccionarOpcion );
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: 800,
                    height: 400,
                    child: TablaUsuario(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*
class _GestionRolesState extends State<GestionRoles> {
  String _seleccionarOpcion = "ROL";
  List<String> _opciones = ['ROL', 'Administrador', 'Empleado'];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passController =TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  DateTime? _fechaNacimiento;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              const TituloGestion(
                title: "Crear Usuarios",
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Nombre y apellido",
                  icon: Icon(Icons.person),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      enabled: false,
                      controller: TextEditingController(
                        text: _fechaNacimiento != null
                            ? _fechaNacimiento!.toString()
                            : '',
                      ),
                      decoration: InputDecoration(
                        labelText: "Fecha Nacimiento",
                        icon: Icon(Icons.calendar_month),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () {
                      DatePicker.showDatePicker(
                        context: context,
                        showTitleActions: true,
                        onConfirm: (date) {
                          setState(() {
                            _fechaNacimiento = date;
                          });
                        },
                        // currentTime: DateTime.now(),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  icon: Icon(Icons.email),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _passController,
                decoration: InputDecoration(
                  labelText: "Password",
                  icon: Icon(Icons.password),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownButton<String>(
                value: _seleccionarOpcion,
                onChanged: (String? nuevoValor) {
                  setState(() {
                    _seleccionarOpcion = nuevoValor!;
                  });
                },
                items: _opciones.map((String opcion) {
                  return DropdownMenuItem<String>(
                    value: opcion,
                    child: Text(opcion),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 30,
              ),
              Boton(
                title: "Agregar nuevo Usuario",
                onPressed: () async {
                 CreacionCuenta creacion = CreacionCuenta();
                 await creacion.crearUsuario( _emailController.text,  _passController.text, _nameController.text, _fechaNacimiento!," ");
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: 800,
                    height: 400,
                    child: TablaUsuario(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/




/*class _GestionRolesState extends State<GestionRoles> {
  String _seleccionarOpcion = "ROL";
  List<String> _opciones = ['ROL', 'Administrador', 'Empleado'];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _fechaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              const TituloGestion(
                title: "Crear Usuarios",
              ),
              const SizedBox(
                height: 10,
              ),
              InputText(
                title: "Nombre y apellido",
                icon: Icons.person,
                mostrar: false,
                valueNotifier: _nameController,
              ),
              const SizedBox(
                height: 10,
              ),
              InputText(
                title: "Fecha Nacimiento",
                icon: Icons.calendar_month,
                mostrar: false,
                valueNotifier: _fechaController,
              ),
              const SizedBox(
                height: 10,
              ),
              InputText(
                title: "Email",
                icon: Icons.email,
                mostrar: false,
                valueNotifier: _emailController,
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownButton<String>(
                value: _seleccionarOpcion,
                onChanged: (String? nuevoValor) {
                  setState(() {
                    _seleccionarOpcion = nuevoValor!;
                  });
                },
                items: _opciones.map((String opcion) {
                  return DropdownMenuItem<String>(
                    value: opcion,
                    child: Text(opcion),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 30,
              ),
              Boton(
                title: "Agregar nuevo Usuario",
                onPressed: () async {
                 _nameController.text;
                  _fechaController.text;
                  _emailController.text;
                  _seleccionarOpcion;

                    //CategoriaAcceso();
                  // Aquí puedes utilizar los valores capturados
                  /*print(nombre);
                  print(fechaNacimiento);
                  print(email);
                  print(rol);*/
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: 800,
                    height: 400,
                    //child: TablaRolUsuario(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/

/*class _GestionRolesState extends State<GestionRoles> {
  String _seleccionarOpcion = "ROL";
  List<String> _opciones = ['ROL','Administrador', 'Empleado'];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _fechaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              const TituloGestion(
                title: "Crear Usuarios",
              ),
              const SizedBox(
                height: 10,
              ),
              InputText(
                title: "Nombre y apellido",
                icon: Icons.person,
                mostrar: false,
                valueNotifier: _nameController,
              ),
              const SizedBox(
                height: 10,
              ),
              InputText(
                title: "Fecha Nacimiento",
                icon: Icons.calendar_month,
                mostrar: false,
                valueNotifier: _fechaController,
              ),
              const SizedBox(
                height: 10,
              ),
              InputText(
                title: "Email",
                icon: Icons.email,
                mostrar: false,
                valueNotifier: _emailController,
              ),
              const SizedBox(
                height: 10,
              ),
              
              DropdownButton<String>(
                value: _seleccionarOpcion,
                onChanged: (String? nuevoValor) {
                  setState(() {
                    _seleccionarOpcion = nuevoValor!;
                  });
                },
                items: _opciones.map((String opcion) {
                  return DropdownMenuItem<String>(
                    value: opcion,
                    child: Text(opcion),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 30,
              ),
              Boton(
                title: "Agregar nuevo Usuario",
                onPressed: () async {
                   
                    
                    _nameController.text;
                    _fechaController.text;
                    _emailController.text;
                    _opciones.value;
                  
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: 800,
                    height: 400,
                    //child: TablaRolUsuario(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/