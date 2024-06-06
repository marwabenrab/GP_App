import 'package:flutter/material.dart';

class PostButtomBar extends StatefulWidget {
  const PostButtomBar(buildContact,  {super.key});

  @override
  State<PostButtomBar> createState() => _PostButtomBarState();
}

class _PostButtomBarState extends State<PostButtomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.7,
      decoration:const BoxDecoration(
          color:  Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          )),
      child: ListView(children: [
        Padding(
          
            padding:const  EdgeInsets.only(),
            child: Column(children: [
              Row(
                
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
            
            SizedBox(height: 95),
                  Text(
                    'Name of the land location',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
                  )
                ],
              ),
              SizedBox(height: 40),
              buildContact(
                title: 'Addres',
                text: 'Ain Defla',
              ),
          const    SizedBox(height: 35),
              buildContact(
                title: 'Space ',
                text: '********Hectar',
              ),
            const     SizedBox(height: 35),
              buildContact(
                title: 'phone Number',
                text: '+213 123 123 123 ',
              ),
              const   SizedBox(height: 35),
              buildContact(
                title: 'Rental price ',
                text: '*********DA',
              ),
            const    SizedBox(height: 35),

              buildContact(
                title: ' Selling price',
                text: '*********DA',
              ),
            ])),
      ]),
    );
  }

  Row buildContact({required String title, required String text}) {
    return    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          ' $title :',
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.black ),
        ),
          Text(
        '$text',
          style: const  TextStyle(fontSize: 15, color: Colors.black),
          ) 
      ],
    );
  }
}
