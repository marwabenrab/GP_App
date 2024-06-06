import 'dart:developer';

import 'package:fikra_app/const/resetpassword.dart';
import 'package:fikra_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerfiyCode extends StatefulWidget {
  static const String screenRoute = 'verfiycode';
  const VerfiyCode({super.key});

  @override
  State<VerfiyCode> createState() => _VerfiyCodeState();
}

class _VerfiyCodeState extends State<VerfiyCode> {
  late String verifycode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Verification Code'.tr,
          style: const TextStyle(fontSize: 22, color: Colors.grey),
        ),
      ),
      body: ListView(children: [
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(" Check Code".tr,
                  style: const TextStyle(
                      fontSize: 27, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text("Please Entre The Digit Code Sent TO Email ".tr,
                  style: const TextStyle(fontSize: 14, color: Colors.grey)),
            ],
          ),
        ),
        const SizedBox(height: 50),
        OtpTextField(
          fieldWidth: 50,
          borderRadius: BorderRadius.circular(20),
          numberOfFields: 5,
          borderColor: const Color.fromARGB(255, 48, 167, 96),
          //set to true to show as box or false to show as dash
          showFieldAsBox: true,
          //runs when a code is typed in
          onCodeChanged: (String code) {
            verifycode = code;
          },
          //runs when every textfield is filled
          onSubmit: (String verificationCode) {
            log(verificationCode.toString());
            log(code.toString());
            if (verificationCode == code.toString()) {
              Navigator.pushNamed(context, ResetPassword.screenRoute);
            } else {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text("الرمز غير صحيح"),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text("حسنا"))
                        ],
                      ));
            }
          }, // end onSubmit
        ),
        const SizedBox(
          height: 40,
        ),
        InkWell(
          onTap: () {},
          child: Center(
              child: Text(
            "Resend Verfiy code".tr,
            style: const TextStyle(fontSize: 17, color: Colors.green),
          )),
        )
      ]),
    );
  }
}
