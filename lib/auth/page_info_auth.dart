
// ignore_for_file: prefer_const_constructors

import 'package:fikra_app/widgets/post_buttom_bar.dart';
import 'package:flutter/material.dart';


class Pageinfoauth extends StatefulWidget {
  static const String screenRoute = 'page_info_auth';
  const Pageinfoauth({super.key});

  @override
  State<Pageinfoauth> createState() => _PageinfoauthState();
}

class _PageinfoauthState extends State<Pageinfoauth> {
  get buildContact=> null ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 115, 209, 118),
        bottomNavigationBar:  PostButtomBar( buildContact), 
        body:  Center( 
          child:  Container( 
              width: 330, 
              height: 500, 
              child: const Image( 
            image: AssetImage('images/land.jpg'), 
          )), 
        )); 
  } 
}
