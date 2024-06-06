import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Parametre extends StatefulWidget {
  static const String screenRoute = ' parametre';
  const Parametre({super.key});

  @override
  State<Parametre> createState() => _ParametreState();
}

class _ParametreState extends State<Parametre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: const Icon(
          Icons.settings,
          color: Colors.green,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Text(
              "Settings".tr,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
           const SizedBox(
              height: 40,
            ),
          const  Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.green,
                ),
                 SizedBox(
                  height: 8,
                ),
                Text(
                  "Account",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
           const  Divider(
              height: 15,
              thickness: 2,
            ),
         const   SizedBox(
              height: 10,
            ),
            buildAccount(context, "Change Password"),
            buildAccount(context , " Content settings"),
            buildAccount(context, "Social"),
            buildAccount(context , "Peivacy and security"),
           
            const   SizedBox(
              height: 40,
            ),
         const   Row(
              children: [
                Icon(
                  Icons.volume_up_outlined,
                  color: Colors.green,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Notifications",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
         const   Divider(
              height: 15,
              thickness: 2,
            ),
           const SizedBox(
              height: 10,
            ),

            buildnotification("New for you " , true),
          const  SizedBox(height: 7,),
            buildnotification(" Account activity ", true),
              const  SizedBox(height: 7,),
            buildnotification("Opportunity" , false),
             

                
          ],
        ),
      ),
    );
  }

  Row buildnotification(String title ,  bool isActive) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            
                Text( title,
               style:const TextStyle(
                fontSize: 18 ,
                fontWeight:FontWeight.w500 ,
                color:Colors.grey  ),),


                 Transform.scale(
                  scale: 0.7,
              child :  CupertinoSwitch(value: isActive , onChanged: (bool val) {}, )
                 )
        ]
          );
  }

  GestureDetector buildAccount(BuildContext context , String title) {
    return GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(title),
                        content:const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Option 1"),
                            Text("Option 2"),
                            Text("Option 3"),
                          ],
                        ),
                        actions: [
                          FilledButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child:const Text("Close"))
                        ],
                      );
                    });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                           title  ,
                      style:const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                 const   Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    )
                  ],
                ),
              )
              );
  }
}
