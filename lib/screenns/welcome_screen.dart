import 'dart:async';

import 'package:fikra_app/auth/map_auth.dart';
import 'package:flutter/material.dart';

class Welcomescreen extends StatefulWidget {
  static const String screenRoute = 'welcom_screen'; // هذه باش تكون عند استدعاء صفحة خفيفة  فنكتب  static  
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
          context, MaterialPageRoute(builder: (context) => const  Mapauth())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:const Color(0xFF04AF5D),
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
