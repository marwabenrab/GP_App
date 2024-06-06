

import 'package:flutter/material.dart';

class Cuts extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData iconData;
  final void Function(String value) onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;

  const Cuts({
    Key? key,
    required this.hinttext,
    required this.labeltext,
    required this.iconData,
    required this.onChanged,
    this.controller,
    this.validator,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: const TextStyle(fontSize: 12),
          suffixIcon: Icon(iconData),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
          labelText: labeltext,
          labelStyle: const TextStyle(fontSize: 18),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}








/*import 'package:flutter/material.dart';

class Cuts extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData iconData; // Icône du champ de texte

  const Cuts({
    Key? key,
    required this.hinttext,
    required this.labeltext,
    required this.iconData,
    required this.onChanged,
    this.controller, 
    String? errorText, 
    required bool obscureText,
    required String?
    Function(dynamic value) validator,
   //  required String? Function(dynamic value) validator, //required DropdownButtonFormField<String> child, //required Null Function() onTap,
  }) : super(key: key);

  final void Function(String value) onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: const TextStyle(fontSize: 12),
          suffixIcon: Icon(iconData),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
          labelText: labeltext,
          labelStyle: const TextStyle(fontSize: 18),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}  */
