import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final String title;
  final IconData icon;
  final TextEditingController valueNotifier;

  const PasswordInput({
    required this.title,
    required this.icon,
    required this.valueNotifier,
    Key? key,
  }) : super(key: key);

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.6,
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        child: TextField(
          onChanged: (value) {
            widget.valueNotifier.value = TextEditingValue(
              text: value,
              selection: widget.valueNotifier.value.selection,
            );
          },
          obscureText: !showPassword,
          controller: widget.valueNotifier,
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
              borderRadius: BorderRadius.circular(30.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.pink,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
            hintText: widget.title,
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            prefixIcon: Icon(
              widget.icon,
              color: Colors.pink,
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              child: Icon(
                showPassword ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
