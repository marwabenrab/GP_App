

import 'package:fikra_app/admin/farmer_list.dart';
//import 'package:fikra_app/admin/land_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'complaint_list.dart';
import 'land_list.dart';
//import 'produit_list.dart';

class Pageone extends StatefulWidget {
  static const String screenRoute = 'pageone';
  const Pageone({super.key});

  @override
  State<Pageone> createState() => _PageoneState();
}

class _PageoneState extends State<Pageone> {
  final List<Map<String, dynamic>> buttons = [
    {'text': "List of lands" .tr, 'icon': Icons.edit},
    {'text':  "List of complaints".tr, 'icon': Icons.edit},
    {'text': "List of users" .tr, 'icon': Icons.edit},
    //{'text': 'قائمة المنتوجات'.tr, 'icon': Icons.edit},
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF56D76C),
        title: Center(child: Text( "Homepage".tr)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Welcome".tr,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
                'You are able to control the database users'.tr,
              style: const TextStyle(fontSize: 16),
            ),
            Text(
                'And the lands, so care must be taken' .tr,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 50),
            Expanded(
              child: ListView.builder(
                itemCount: buttons.length,
                itemBuilder: (context, index) {
                  final button = buttons[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        switch (index) {
                          case 0:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  // ignore: prefer_const_constructors
                                  builder: (context) => Land_list()),
                            );
                            break;
                          case 1:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  // ignore: prefer_const_constructors
                                  builder: (context) => Complaint_list()),
                            );
                            break;
                          case 2:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const farmer_list()),
                            );
                            break;
                        /*  case 3:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Produit_list()),
                            );
                            break;*/
                          default:
                            break;
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 13),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(button['icon']),
                          const SizedBox(width: 60),
                          Text(button['text'],
                              style: const TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}   









