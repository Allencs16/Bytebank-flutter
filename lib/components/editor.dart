import 'package:flutter/material.dart';

class Editor extends StatelessWidget {

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final IconData? icon;

  const Editor({required this.controller, required this.labelText, required this.hintText, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 16.0
        ),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: labelText,
          hintText: hintText
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}