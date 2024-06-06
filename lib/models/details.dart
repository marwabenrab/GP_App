import 'package:fikra_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/product_body.dart';
import 'product.dart';

class Details extends StatefulWidget {
  static const String screenRoute = 'details';
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  // قائمة ثابتة لمسارات الصور المحلية
  final List<String> localImagePaths = [
    'images/image1.jpg',
    'images/image2.jpg',
    'images/image3.jpg',
    'images/image4.jpg',
    'images/image5.jpg',
    'images/image6.jpg',
    'images/image7.jpg',
    'images/image8.jpg',
    'images/image9.jpg',
   // 'images/image4.jpg',
    // أضف المسارات الخاصة بالصور الأخرى هنا
  ];

  // قائمة ثابتة لأسماء الصور
  final List<String> imageTitles = [
    'Planting Depth',
    'Plant to plant spacing',
    'Row to row spacing',
    'Sprout to harvest',
    'Watering',
    'Season',
    'Germination time',
    'Sowing Type',
    'Fertilizer',
  
    // أضف الأسماء الخاصة بالصور الأخرى هنا
  ];
 

  @override
  Widget build(BuildContext context) {
    // لتزويدنا بارتفاع وعرض الهاتف
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: size.height * 0.4, // ارتفاع الحاوية الخضراء
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.1, // رفع الصورة للأعلى
                left: size.width * 0.1,
                right: size.width * 0.1,
                child: Container(
                  height: size.height * 0.3, // ارتفاع الصورة
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      product[selected_index].image, // صورة المنتج المختار
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Quick Info'.tr,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 5, 5, 5),
                      ),
                    ),
                    Text(
                      '(Tap on cards for more details)',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey, // اللون الرمادي
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20), // إضافة مسافة لرفع المربعات قليلاً
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(kDefaultPadding),
              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemCount: localImagePaths
                  .length, // عدد العناصر في قائمة مسارات الصور المحلية
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
        
                        return AlertDialog(
                          title: Text('Info'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(imageTitles[index],
                              style:const TextStyle(color:Color.fromARGB(255, 35, 164, 44),fontSize: 20),
                              
                              ), // عنوان الصورة
                              const SizedBox(height: 10),
                              Text(
                                  product[selected_index].descriptions[index],
                              )
                             // Text(  descriptions [index],
                            // style:const TextStyle(   color: Color.fromARGB(255, 77, 75, 75)) ) // وصف الصورة
                            ],
                          ),
                          actions: <Widget>[
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
                  },
                  child: Container(
                    height: 90,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          localImagePaths[
                              index], // استخدام المسار من قائمة مسارات الصور المحلية
                          height: 70,
                          width: 70,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 5),
                      //  Text(
                        //  imageTitles[index], // عنوان الصورة
                        //  textAlign: TextAlign.center,
                         // style: const TextStyle(fontSize: 12),
                       // ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}













/*import 'package:fikra_app/constants.dart';
import 'package:fikra_app/models/product.dart';
import 'package:fikra_app/widgets/product_body.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:flutter/widgets.dart';

class Details extends StatefulWidget {
  static const String screenRoute = 'details';
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  @override
  Widget build(BuildContext context) {
    // لتزويدنا بارتفاع وعرض الهاتف
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Container(
            // width: double.infinity, //   شكل لي فيه صورة يحليه يدي مساحة كاملا
            padding:const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            //   height: 300,
            decoration:const BoxDecoration(
            
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                )),
            child: Column(
              children: [
                Container(
                  margin:const EdgeInsets.symmetric(vertical: kDefaultPadding),
                  height: size.width * 0.5,
                  //  color: Colors.black,
                  child: Stack(
                    children: [
                      Container(
                          ),
                      Center(
                        child: ClipOval(
                          child: Image.network(
                            (product[selected_index].image),//هنا هناخد الصوره اللي اخترانا المنتج بتاعها
                            fit: BoxFit.cover, // وكدا حصلنا علي الصوره ودلوقتي هنجيب الوصف
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                product[selected_index].title,
                style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
      const   SizedBox(height: 10,),
          Container(
            child:  Text(
              'Some information about the product'.tr,
              style: TextStyle(fontSize:17  ,fontWeight: FontWeight.w700,color:  Color.fromARGB(255, 5, 5, 5)),
              ),  
          ),
        const  SizedBox(height: 30,),
          Text(    product[selected_index]. description, 
            style:const TextStyle(   color: Color.fromARGB(255, 77, 75, 75)),
          ),
        ],
      ),
    );
  }
}*/


//product[selected_index].image 
//بنجيب البيانات بنفس الشكل دا وبنغير علي حسب المطلوب يعني انا لو عايز الصوره بختار image