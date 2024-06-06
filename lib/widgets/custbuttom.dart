import 'package:flutter/material.dart';

class CustButtom extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const CustButtom({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 25),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        disabledColor: Colors.grey.shade200.withOpacity(0.4),
        onPressed: onPressed,
        minWidth: 500,
        height: 53,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        color: Color.fromARGB(255, 83, 177, 101),
      ),
    );
  }
}
