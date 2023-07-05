import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../entidades/categoria_entidad.dart';

class TablaCategorias extends StatefulWidget {
  @override
  _TablaCategoriasState createState() => _TablaCategoriasState();
}

class _TablaCategoriasState extends State<TablaCategorias> {
  late CategoriaDataSource _dataSource;
  List<DocumentSnapshot> _categorias = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('categoria').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error al cargar los datos'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData) {
            _categorias = snapshot.data!.docs;
            _dataSource = CategoriaDataSource(_categorias, actualizarDocumento);

            return PaginatedDataTable(
              columns: const [
                DataColumn(
                  label: Text('Nombre'),
                ),
                DataColumn(
                  label: Text('Descripción'),
                ),
                DataColumn(label: Text("Editar")),
              ],
              source: _dataSource,
              rowsPerPage: 5,
            );
          }

          return Center(child: Text('No hay datos disponibles'));
        },
      ),
    );
  }

  void actualizarDocumento(int index, String nuevoNombre, String nuevaDescripcion) {
    final doc = _categorias[index];
    final entidad = CategoriaEntidad.fromDocumentSnapshot(doc);

    entidad.nombre = nuevoNombre;
    entidad.descripcion = nuevaDescripcion;

    doc.reference.update(entidad.toMap());
  }
}

class CategoriaDataSource extends DataTableSource {
  final List<DocumentSnapshot> categorias;
  final Function(int, String, String) actualizarDocumento;
  int? _editingRow;

  CategoriaDataSource(this.categorias, this.actualizarDocumento);

  @override
  DataRow? getRow(int index) {
    if (index >= categorias.length) {
      return null;
    }

    final entidad = CategoriaEntidad.fromDocumentSnapshot(categorias[index]);
    final isEditing = index == _editingRow;

    return DataRow.byIndex(
      index: index,
      selected: isEditing,
      cells: [
        DataCell(
          isEditing
              ? TextFormField(
                  initialValue: entidad.nombre,
                  onFieldSubmitted: (value) {
                    actualizarDocumento(index, value, entidad.descripcion);
                    _editingRow = null;
                    notifyListeners();
                  },
                )
              : Text(entidad.nombre),
        ),
        DataCell(
          isEditing
              ? TextFormField(
                  initialValue: entidad.descripcion,
                  onFieldSubmitted: (value) {
                    actualizarDocumento(index, entidad.nombre, value);
                    _editingRow = null;
                    notifyListeners();
                  },
                )
              : Text(entidad.descripcion),
        ),
        DataCell(
          ElevatedButton(
            onPressed: () {
              if (isEditing) {
                actualizarDocumento(index, entidad.nombre, entidad.descripcion);
              }
              _editingRow = isEditing ? null : index;
              notifyListeners();
            },
            child: isEditing ? Text('Guardar') : Text('Editar'),
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => categorias.length;

  @override
  int get selectedRowCount => 0;
}

