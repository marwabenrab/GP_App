import 'dart:async';
import 'dart:convert';

import 'package:fikra_app/auth/map_auth.dart';
import 'package:fikra_app/controllers/user_session_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class Welcomescreen extends StatefulWidget {
  static const String screenRoute =
      'welcom_screen'; // هذه باش تكون عند استدعاء صفحة خفيفة  فنكتب  static
  // يعني تستدعيها هيا فقط وليس صفحة كاملا

  const Welcomescreen({super.key});

  @override
  State<Welcomescreen> createState() => _SplashState();
}

class _SplashState extends State<Welcomescreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Mapauth())),
    );
  }

  Future<void> backLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    
    final d=prefs.getString('date');
    if(d!=null){
      final date=DateTime.parse(d);
      if(date.difference(DateTime.now()).inDays>3){
        prefs.setString('email', '');
        prefs.setString('pass', '');
      }
    }
    final email = prefs.getString("email");
    final pass = prefs.getString("pass");
    
    var url = "http://10.0.2.2:80/falahphp/auth/login.php";

    var response = await http.post(Uri.parse(url), body: {
      "flag": 2.toString(),
      // "flag":2 ,
      //"name": user.text,
      "email": email,
      "password": pass,
      'fcm_token': 'Notifications token',
    });
    Map<String, dynamic> data = json.decode(response.body);
    if (data['status'] == 'success') {
      UserSessionController user = Get.find();
      user.isLocked = false.obs;
      userData = data;
      if (data['user_type'] == 'farmer'.toString()) {
        print(data['id_Farmer']);
        user.idFarmer = int.parse(data['id_Farmer']);
        print(user.idFarmer); // user.idFarmer
        //  Navigator.push(
        //      context,
        //   MaterialPageRoute(
        //    builder: (context) => Mapauth(),
        //    ),
        // );
      } else {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const Pageone(),
        //   ),
        // );
      }
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("date", DateTime.now().toString());
    } else {
      Get.snackbar('Alert', 'Login Failed, Try again');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF04AF5D),
        body: Center(
          child: Container(
            width: 200,
            height: 300,
            child: const Image(
              image: AssetImage('images/photo1.jpg'),
            ),
          ),
        ));
  }
}
