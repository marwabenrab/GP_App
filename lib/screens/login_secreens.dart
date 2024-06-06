import 'dart:convert';
import 'package:fikra_app/admin/pageone.dart';
import 'package:fikra_app/auth/map_auth.dart';
import 'package:fikra_app/config/static_values.dart';
import 'package:fikra_app/controllers/user_session_controller.dart';
import 'package:fikra_app/const/forgetpassword.dart';
import 'package:fikra_app/screens/singup_screen.dart';
import 'package:fikra_app/widgets/cust.dart';
import 'package:fikra_app/widgets/custbuttom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class loginscreens extends StatefulWidget {
  static const String screenRoute = 'login_screens';
  const loginscreens({Key? key});

  @override
  State<loginscreens> createState() => _loginscreensState();
}

class _loginscreensState extends State<loginscreens> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // TextEditingController user = TextEditingController();
  TextEditingController ema = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future login(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    var url = "https://192.168.1.6/falahphp/auth/login.php";

    var response = await http.post(Uri.parse(url), body: {
      "flag": 2.toString(),
      // "flag":2 ,
      //"name": user.text,
      "email": ema.text,
      "password": pass.text,
      'fcm_token': 'Notifications token',
    });
    Map<String, dynamic> data = json.decode(response.body);
    if (data['status'] == 'success') {
      UserSessionController user = Get.find();
      user.isLocked = false.obs;

      if (data['user_type'] == 'farmer'.toString()) {
        print(data['id_Farmer']);
        user.idFarmer = int.parse(data['id_Farmer']);
        print(user.idFarmer); // user.idFarmer
        Get.to(const Mapauth());
        //  Navigator.push(
        //      context,
        //   MaterialPageRoute(
        //    builder: (context) => Mapauth(),
        //    ),
        // );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Pageone(),
          ),
        );
      }
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool(StaticValues.isUserLoggedIn, true);
      prefs.setString('email', ema.text);
    } else {
      Get.snackbar('Alert', 'Login Failed, Try again');
    }

    debugPrint(data.toString());
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!value.contains('@')) {
      return 'Invalid email address @';
    }
    return null;
  }

  /*String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }
  if (value.length != 8) {
    return 'Password must be 8 characters long';
  }
  return null;
}*/

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long'.tr;
    }
    if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
      return 'Password must contain only letters and numbers'.tr;
    }
    return null;
  }

  String? validateUser(String? value) {
    if (value == null || value.isEmpty) {
      return 'User is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.elliptical(60, 60),
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: SizedBox(),
        ),
        flexibleSpace: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'images/pa.png',
              height: 100,
              width: 120,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome '.tr,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "Log in to continue".tr,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            /*  Cuts(
              controller: user,
              hinttext: 'Enter Your User'.tr,
              labeltext: 'User'.tr,
              iconData: Icons.person_outline,
              onChanged: (value) {
                user.text = value;
              },
              obscureText: false,
              validator: validateUser,
            ),*/
            const SizedBox(height: 9),
            Cuts(
              controller: ema,
              hinttext: 'Enter Your Email'.tr,
              labeltext: 'Email'.tr,
              iconData: Icons.email_outlined,
              onChanged: (value) {
                ema.text = value;
              },
              obscureText: false,
              validator: validateEmail,
            ),
            const SizedBox(height: 10),
            Cuts(
              controller: pass,
              hinttext: 'Enter Your Password'.tr,
              labeltext: 'Password'.tr,
              iconData: Icons.lock_outlined,
              onChanged: (value) {
                pass.text = value;
              },
              obscureText: true,
              validator: validatePassword,
            ),
            const SizedBox(height: 6),
            Container(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, ForgetPassword.screenRoute);
                },
                child: Text(
                  'Forget Password?'.tr,
                  style: const TextStyle(color: Colors.green),
                  textAlign: TextAlign.right,
                ),
              ),
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 7),
            ),
            const SizedBox(height: 15),
            CustButtom(
              text: 'Log in'.tr,
              onPressed: () async => login(context),
            ),
            const SizedBox(height: 10),
            Container(
              child: InkWell(
                onTap: () =>
                    Navigator.pushNamed(context, singupscreen.screenRoute),
                child: Center(
                  child: Text(
                    'Sign up'.tr,
                    style: const TextStyle(color: Colors.green),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
