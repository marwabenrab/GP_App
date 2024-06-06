
import 'package:fikra_app/models/details.dart';
import 'package:fikra_app/models/product.dart';
import 'package:fikra_app/screen/homescreen.dart';
import 'package:fikra_app/screen/persone.dart';
import 'package:fikra_app/widgets/product_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:flutter/widgets.dart';
import '../screen/pests_screen.dart';

class Homeconst extends StatefulWidget {
  static const String screenRoute = 'home_const';
  const Homeconst({Key? key}) : super(key: key);

  

  @override
  State<Homeconst> createState() => _HomeconstState();
}

class _HomeconstState extends State<Homeconst> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'information',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(
          Icons.psychology_alt,
          color: Color.fromARGB(255, 54, 53, 53),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 71, 183, 103),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Hi FeLah'.tr,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    child: Text(
                      'We hope you find everything that helps you get fresh produce'
                          .tr,
                      style:const TextStyle(
                        color: Colors.white,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Details.screenRoute,
                    );
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          spreadRadius: 1,
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 160,
                          width: 140,
                          child: Image.asset(product[selected_index].image),
                        ),
                        Text(
                          "Product Information".tr,
                          style:const TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      HomeScreen.screenRoute,
                    );
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          spreadRadius: 1,
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 160,
                          width: 140,
                          child: Image.asset("images/calc.jpg"),
                        ),
                        Text(
                          "calculator".tr,
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Pestsscreen.screenRoute);
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          spreadRadius: 1,
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 160,
                          width: 140,
                          child: Image.asset("images/seedling0.jpg"),
                        ),
                        Text(
                          "Pests and diseases".tr,
                          style:const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Persone.screenRoute);
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          spreadRadius: 1,
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 160,
                          width: 140,
                          child: Image.asset("images/doc.jpg"),
                        ),
                        Text(
                          "Crop Consultant".tr,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}






