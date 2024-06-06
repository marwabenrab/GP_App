import 'package:flutter/material.dart';

class CustButtomPassword extends StatelessWidget {
  final String label;
  final IconData iconData;
  final String hinted;
   final TextEditingController? controller;


  const CustButtomPassword({
    Key? key,
    required this.label,
    required this.iconData,
    required this.hinted, //this.controller, 
    this.controller, required Null Function(dynamic value) onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 25), // تحديد العرض الأفقي
      child: TextFormField(
        obscureText: true,
        controller: controller,
        decoration: InputDecoration(
          hintText: hinted,
          hintStyle:const  TextStyle(fontSize: 12),
          suffixIcon: Icon(iconData),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40), // تحديد العرض العمودي
            labelText: label,
          labelStyle: const  TextStyle(fontSize: 18),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            //borderSide: BorderSide(color: Colors.green), // تحديد لون الحافة
          ),
        ),
      ),
    );
  }
}

