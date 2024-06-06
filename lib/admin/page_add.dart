import 'package:fikra_app/add_process/add_info.dart';
import 'package:fikra_app/add_process/add_producr/product_one.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/ownership.dart';

class PageAdd extends StatefulWidget {
    static const String screenRoute = 'page_add';
  const PageAdd({super.key});

  @override
  State<PageAdd> createState() => _PageAddState();
}

class _PageAddState extends State<PageAdd> {
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
                Navigator.pushNamed(context, AddInfo.screenRoute);
              },
              child: Text(
                'Informations'.tr,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 40),
    
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
                    Navigator.pushNamed(context, ProductOne.screenRoute);
                },
                child: Text(
                  'Produits'.tr,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
                const SizedBox(height: 40,),
        
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
                  Navigator.pushNamed(context, Ownership.screenRoute);

                },
                child: Text(
                  'Claim of ownership'.tr,
                  style:const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
        ]
              ),

    );
  }
}

