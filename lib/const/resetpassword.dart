import 'dart:developer';

//import 'package:fikra_app/auth/map_auth.dart';
import 'package:fikra_app/constants.dart';
import 'package:fikra_app/screens/login_secreens.dart';
import 'package:fikra_app/widgets/custbuttom.dart';
import 'package:fikra_app/widgets/custbuttompassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ResetPassword extends StatefulWidget {
  static const String screenRoute = 'ٌresetpassword';
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    String password = "";
    // ignore: unused_local_variable
    String repPassword = "";
    TextEditingController passCont = TextEditingController();
    TextEditingController repPassCont = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'ResetPassword'.tr,
          style: const TextStyle(fontSize: 22, color: Colors.grey),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(" New Password ".tr,
                    style: const TextStyle(
                        fontSize: 27, fontWeight: FontWeight.bold)),
                const SizedBox(height: 2),
                Text("Please Entre new Password ".tr,
                    style: const TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ),
          const SizedBox(height: 50),
          CustButtomPassword(
            hinted: 'Entre Your Password'.tr,
            label: 'Password'.tr,
            iconData: Icons.lock_outlined,
            controller: passCont,
            onChanged: (value) {
              password = value;
            },
          ),
          const SizedBox(height: 20),
          CustButtomPassword(
            hinted: 'Retype the password'.tr,
            label: 'Password'.tr,
            controller: repPassCont,
            iconData: Icons.lock_outlined,
            onChanged: (value) {
              repPassword = value;
            },
          ),
          const SizedBox(height: 20),
          CustButtom(
              text: 'save'.tr,
              onPressed: () async {
                if (passCont.text == repPassCont.text) {
                  log(password);
                  var url = "https://192.168.1.6/falahphp/auth/password.php";
                  var response = await http.put(Uri.parse(url),
                      body: {"email": glopalEmail, "password": passCont.text});
                  log(response.body);
                  if (response.statusCode == 200) {
                    Navigator.of(context).pushNamed(loginscreens.screenRoute);
                  }
                } else {
                  // show warning
                }
              }),
        ],
      ),
    );
  }
}
