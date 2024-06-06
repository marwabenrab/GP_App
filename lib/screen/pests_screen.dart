import 'package:fikra_app/add_process/add_wheat.dart';
import 'package:flutter/material.dart';

class Pestsscreen extends StatefulWidget {
  static const String screenRoute = 'pests_screen';
  const Pestsscreen({Key? key}) : super(key: key);

  @override
  State<Pestsscreen> createState() => _PestsscreenState();
}

class _PestsscreenState extends State<Pestsscreen> {
  final List<String> imagePaths = [
    'images/image10.jpg',
    'images/image11.jpg',
    'images/image12.jpg',
    'images/image13.jpg',
    'images/image14.jpg',
    'images/image15.jpg',
    'images/image16.jpg',
    'images/image17.jpg',
    // Add more image paths here
  ];

  final List<String> routeNames = [
    AddWheat.screenRoute,
    'page2',
    'page3',
    'page4',
    'page5',
    'page6',
    'page7',
    'page8',
    'page9',
    'page10', // Add more route names here
  ];

  final List<String> texts = [
    " Manna (insects)",
    "Yellow rust(fungi)",
    "Powdery mildew",
    "Stem rust(fungi)",
    "Blight(scabies)",
    "Leaves rust(fungi)",
    "Grain necrosis",
    "Loose smut(fungi)",
    // Add more texts here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 1, // Make it square
        ),
        itemCount: imagePaths.length, // Number of squares
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              final String routeName = routeNames[index];
              Navigator.pushNamed(context, routeName);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        imagePaths[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding:const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 66, 141, 66),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                  
                      child: Text(
                        texts[index], // Use different text for each image
                        style:const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                    
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
