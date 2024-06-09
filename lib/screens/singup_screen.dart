import 'dart:convert';
import 'package:fikra_app/screens/login_secreens.dart';
import 'package:fikra_app/widgets/custbuttom.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fikra_app/widgets/cust.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class singupscreen extends StatefulWidget {
  static const String screenRoute = 'singup_screen';
  const singupscreen({Key? key});

  @override
  State<singupscreen> createState() => _singupcreenState();
}

class _singupcreenState extends State<singupscreen> {
  TextEditingController user = TextEditingController();
  TextEditingController ema = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController phone = TextEditingController();

  final _formKey = GlobalKey<FormState>();
//192.168.115.174
//http://10.0.2.2:80/falahphp/
//192.168.58.220
  Future register() async {
    if (_formKey.currentState!.validate()) {
      var url = "http://10.0.2.2:80/falahphp/auth/singup.php";
      var response = await http.post(
        Uri.parse(url),
        body: {
          "username": user.text,
          "email": ema.text,
          "password": pass.text,
          'phone': phone.text,
        },
      );
      var data = json.decode(response.body);
      if (data['status'] == 'success') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const loginscreens(),
          ),
        );
        Fluttertoast.showToast(
          msg: 'Inscription réussie',
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 25.0,
        );
      } else {
        Fluttertoast.showToast(
          msg: data['status'] ?? '',
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 25.0,
        );
      }
    }
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
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Sign up to continue".tr,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 17),
            Cuts(
              controller: user,
              hinttext: 'Enter Your Username'.tr,
              labeltext: 'Username'.tr,
              iconData: Icons.person_outline,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Username is required'.tr;
                }
                return null;
              },
              onChanged: (value) {},
              obscureText: false,
            ),
            const SizedBox(height: 5),
            Cuts(
              controller: ema,
              hinttext: 'Enter Your Email'.tr,
              labeltext: 'Email'.tr,
              iconData: Icons.email_outlined,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email is required'.tr;
                }
                if (!value.contains('@')) {
                  return 'Invalid email address @'.tr;
                }
                return null;
              },
              onChanged: (value) {},
              obscureText: false,
            ),
            const SizedBox(height: 5),
            Cuts(
              controller: phone,
              hinttext: 'Enter Your Phone (+213XXXXXXXXX)'.tr,
              labeltext: 'Phone'.tr,
              iconData: Icons.phone_android_outlined,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Phone number is required'.tr;
                }
                if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                  return 'Enter a valid phone number'.tr;
                }
                return null;
              },
              onChanged: (value) {},
              obscureText: false,
            ),
            const SizedBox(height: 5),
            Cuts(
              controller: pass,
              hinttext: 'Enter Your Password'.tr,
              labeltext: 'Password'.tr,
              iconData: Icons.password_outlined,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required'.tr;
                }
                if (value.length < 8) {
                  return 'Password must be at least 8 characters long'.tr;
                }
                if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
                  return 'Password must contain only letters and numbers'.tr;
                }
                return null;
              },
              onChanged: (value) {},
            ),
            const SizedBox(height: 6),
            Container(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, loginscreens.screenRoute);
                },
                child: Text(
                  'You have an account?'.tr,
                  style: TextStyle(color: Colors.green),
                  textAlign: TextAlign.right,
                ),
              ),
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 7),
            ),
            const SizedBox(height: 10),
            CustButtom(
              text: "Sign up".tr,
              onPressed: () async => register(),
            ),
          ],
        ),
      ),
    );
  }
}





















/*import 'dart:convert';
import 'package:fikra_app/screens/login_secreens.dart';
import 'package:fikra_app/widgets/custbuttom.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fikra_app/widgets/cust.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class singupscreen extends StatefulWidget {
  static const String screenRoute = 'singup_screen';
  const singupscreen({Key? key});

  @override
  State<singupscreen> createState() => _singupcreenState();
}

class _singupcreenState extends State<singupscreen> {
  TextEditingController user = TextEditingController();
  TextEditingController ema = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController phone = TextEditingController();

  Future register() async {
    var url = "http://10.0.2.2:80/falahphp/auth/singup.php";
    var response = await http.post(
      Uri.parse(url),
      body: {
        "username": user.text,
        "email": ema.text,
        "password": pass.text,
        'phone': phone.text,
      },
    );
    var data = json.decode(response.body);
    if (data['status'] == 'success') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => loginscreens(),
        ),
      );
      Fluttertoast.showToast(
        msg: 'Inscription réussie',
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 25.0,
      );
    } else {
      Fluttertoast.showToast(
        msg: data['status'] ?? '',
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 25.0,
      );
      // Remplacez la ligne suivante par la page vers laquelle vous voulez naviguer après la connexion
      // Navigator.push(context, MaterialPageRoute(builder: (context)=> NextPage(),),);
    }
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
      body: ListView(
        children: [
          const SizedBox(height: 30),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text( 'Welcome '.tr,
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                SizedBox(height: 2),
                Text("Log in to continue".tr,
                    style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Cuts(
            controller: user,
            hinttext: 'Entre  Your User'.tr,
            labeltext: 'User'.tr,
            iconData: Icons.person_outline,
            onChanged: (value) {
              user.text = value;
            }, 
          ),
          const SizedBox(height: 9),
          Cuts(
            controller: ema,
            hinttext: 'Entre Your Email'.tr,
            labeltext: 'Email'.tr,
            iconData: Icons.email_outlined,
            onChanged: (value) {
              ema.text = value;
            }, 
          ),
          Cuts(
            controller: phone,
            hinttext: 'Enter your phone'.tr,
            labeltext: 'phone'.tr,
            iconData: Icons.phone_android_outlined,
            onChanged: (value) {
              phone.text = value;
            }, 
          ),
          Cuts(
            controller: pass,
            hinttext: 'Entre Your Password'.tr,
            labeltext: 'Password'.tr,
            iconData: Icons.password_outlined,
            onChanged: (value) {
              pass.text = value;
            }, 
          ),
          const SizedBox(height: 6),
          Container(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, loginscreens.screenRoute);
              },
              child: Text(
                'you have an account'.tr,
                style: TextStyle(color: Colors.green),
                textAlign: TextAlign.right,
              ),
            ),
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 7),
          ),
          const SizedBox(height: 10),
          CustButtom(
            text: "Create an account".tr,
            // Naviguer vers la prochaine page après la connexion
            onPressed: () async => register(),
          ),
          
        ],
      ),
    );
  }
}*/



