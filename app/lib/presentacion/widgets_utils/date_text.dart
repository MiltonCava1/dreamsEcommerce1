import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class DateText extends StatefulWidget {
  final String title;
  final IconData icon;
  final TextEditingController valueNotifier;

  const DateText({
    required this.title,
    required this.icon,
    required this.valueNotifier,
    Key? key,
  }) : super(key: key);

  @override
  _DateTextState createState() => _DateTextState();
}

class _DateTextState extends State<DateText> {
  String _selectedDate = '';

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.6,
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        child: TextField(
          controller: widget.valueNotifier,
          readOnly: true,
          onTap: () {
            DatePicker.showDatePicker(
              context,
              showTitleActions: true,
              onConfirm: (date) {
                setState(() {
                  final formattedDate =
                      DateFormat('yyyy-MM-dd', 'es').format(date); // Formatear la fecha
                  _selectedDate = formattedDate;
                  widget.valueNotifier.text = _selectedDate;
                });
              },
              currentTime: DateTime.now(),
              locale: LocaleType.es, // Cambia el idioma a español
            );
          },
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(30.0), // Agregar bordes circulares
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.pink,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(30.0), // Agregar bordes circulares
            ),
            hintText: widget.title,
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            prefixIcon: Icon(
              widget.icon,
              color: Colors.pink,
            ),
          ),
        ),
      ),
    );
  }
}
