// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'dart:developer';

import 'package:fikra_app/const/verfiycode.dart';
import 'package:fikra_app/widgets/cust.dart';
import 'package:fikra_app/widgets/custbuttom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class ForgetPassword extends StatefulWidget {
  static const String screenRoute = 'forgetpassword';
  ForgetPassword({super.key});
  String email = "";
  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Forget Password'.tr,
          style: const TextStyle(fontSize: 22, color: Colors.grey),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 42),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(" Check Email".tr,
                    style: const TextStyle(
                        fontSize: 27, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text("please Entre Your Email Address ".tr,
                    style: const TextStyle(fontSize: 14, color: Colors.grey)),
                const SizedBox(
                  height: 6,
                ),
                Text("A verification code".tr,
                    style: const TextStyle(fontSize: 14, color: Colors.grey))
              ],
            ),
          ),
          const SizedBox(height: 40),
          Cuts(
            hinttext: 'Entre Your Email'.tr,
            labeltext: 'Email'.tr,
            iconData: Icons.email_outlined,
            onChanged: (value) {
              widget.email = value;
            },
            obscureText: true,
            //  validator: (value) {},
          ),
          const SizedBox(height: 20),
          CustButtom(
              text: 'Check'.tr,
              onPressed: () async {
                var url = "https://192.168.1.6/falahphp/auth/password.php";
                var response = await http.post(Uri.parse(url), body: {
                  "email": widget.email,
                });
                log(response.body);
                if (response.statusCode == 200) {
                  var data = jsonDecode(response.body);
                  if (data["success"]) {
                    code = data['verification_code'];
                    glopalEmail = widget.email;
                    Navigator.pushNamed(context, VerfiyCode.screenRoute);
                  }
                }
              }),
        ],
      ),
    );
  }
}
