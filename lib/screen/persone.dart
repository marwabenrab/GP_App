import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';
//import '../utilities/videos_page.dart';

class Persone extends StatefulWidget {
  static const String screenRoute = 'persone';

  const Persone({Key? key}) : super(key: key);

  @override
  State<Persone> createState() => _PersoneState();
}

class _PersoneState extends State<Persone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 30),
                  title: Text(
                    'Rabah Machgoul',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  subtitle: Text('Good Morning',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: Colors.white54,
                          )),
                  trailing: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('images/man.png'),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          Container(
            color: Colors.green,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 50),
                  itemDashboard('Videos', CupertinoIcons.play_rectangle,
                      Colors.deepOrange, context),
                  SizedBox(height: 20), // Reduced SizedBox height
                  itemDashboard('Revenue', CupertinoIcons.money_dollar,
                      Colors.indigo, context),
                  SizedBox(height: 20), // Reduced SizedBox height
                  itemDashboard('Contact', CupertinoIcons.phone,
                      Colors.pinkAccent, context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget itemDashboard(String title, IconData iconData, Color background,
      BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (title == 'Videos') {
          // Handle Videos
        } else if (title == 'Contact') {
          _showContactDialog(context);
        } else if (title == 'Revenue') {
          _showRevenueDialog(context);
        }
      },
      child: Container(
        height: 120, // Reduced container height
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              color: Theme.of(context).primaryColor.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 5,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: background,
                shape: BoxShape.circle,
              ),
              child: Icon(
                iconData,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _showContactDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Contact'),
          content: Text('Phone Number: +1234567890'),
          actions: [
            TextButton(
              child:const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showRevenueDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:const Text('Revenue'),
          content:const Text('Price of Assistance: \$100'),
          actions: [
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

