


import 'package:fikra_app/auth/page_info_auth.dart';
import 'package:fikra_app/controllers/user_session_controller.dart';
import 'package:fikra_app/screens/ownership.dart';
import 'package:fikra_app/screens/products_screens.dart';
import 'package:fikra_app/screens/login_secreens.dart'; // تأكد من تضمين شاشة تسجيل الدخول
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pageauth extends StatefulWidget {
  static const String screenRoute = 'page_auth';
  const Pageauth({Key? key}) : super(key: key);

  @override
  State<Pageauth> createState() => _PageauthState();
}

class _PageauthState extends State<Pageauth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 88, 161, 88),
        title: const Center(
          child: Text(
            '',
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(100),
            bottomRight: Radius.circular(100),
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: SizedBox(),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 150),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {
                Navigator.pushNamed(context, Pageinfoauth.screenRoute);
              },
              child: Text(
                'Informations'.tr,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 40),
          GetBuilder<UserSessionController>(builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  if (controller.isLocked.isTrue) {
                    Navigator.pushNamed(context, loginscreens.screenRoute);
                  } else {
                    Navigator.pushNamed(context, ProductsScreens.screenRoute);
                  }
                },
                child: Text(
                  'Produits'.tr,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            );
          }),
          const SizedBox(height: 40),
          GetBuilder<UserSessionController>(builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  if (controller.isLocked.isTrue) {
                    Navigator.pushNamed(context, loginscreens.screenRoute);
                  } else {
                    Navigator.pushNamed(context, Ownership.screenRoute);
                  }
                },
                child: Text(
                  'Claim of ownership'.tr,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

