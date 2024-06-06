import 'package:fikra_app/constants.dart';
import 'package:flutter/material.dart';

String name = '';

class ProductTwo extends StatefulWidget {
  ProductTwo({
    required this.itemIndex,
    Key? key,
  }) : super(key: key);

  final int itemIndex;

  @override
  State<ProductTwo> createState() => _ProductTwoState();
}

class _ProductTwoState extends State<ProductTwo> {
  String? selectedProduct;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      height: 190,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 166,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 15),
                  blurRadius: 25,
                  color: Colors.black12,
                )
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 160,
              width: 200,
              child: const Icon(
                Icons.image,
                size: 100,
                color: Colors.grey,
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            right: 0.0,
            child: SizedBox(
              height: 136.0,
              width: size.width - 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: DropdownButton<String>(
                      value: selectedProduct,
                      icon: const Icon(Icons.arrow_drop_down),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedProduct = newValue;
                        });
                      },
                      items: <String>['Product 1', 'Product 2', 'Product 3'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedProduct != null
                            ? const Color.fromARGB(255, 0, 123, 255) // لون الزر عند تفعيل المنتج
                            : const Color.fromARGB(255, 200, 200, 200), // لون الزر عند عدم تفعيل المنتج
                      ),
                      onPressed: selectedProduct != null ? () {
                        // Action when "See more" is pressed
                      } : null,
                      child: const Text(
                        'See more',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Appropriate products'),
        backgroundColor: Colors.green, // تغيير لون خلفية شريط التطبيق إلى الأخضر
        actions: const [
          Icon(Icons.add_location),
        ],
      ),
      body: ProductTwo(
        itemIndex: 0,
      ),
    );
  }
}




/*import 'package:fikra_app/constants.dart';
import 'package:flutter/material.dart';


String name = '';

class ProductTwo extends StatefulWidget {
  ProductTwo({
    required this.itemIndex,
   
    Key? key,
  }) : super(key: key);

  final int itemIndex;
 // final List<String> productList;

  @override
  State<ProductTwo> createState() => _ProductTwoState();
}

class _ProductTwoState extends State<ProductTwo> {
  String? selectedProduct; // قم بتعيين القيمة الافتراضية إلى null بدلاً من فارغة

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      height: 190,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 166,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 15),
                    blurRadius: 25,
                    color: Colors.black12,
                  )
                ]),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 160,
              width: 200,
              child: ClipOval(
              //  child: Image.asset(
                //  product.image,
             //     fit: BoxFit.cover,
                //),
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            right: 0.0,
            child: SizedBox(
              height: 136.0,
              // because oure image is 200 width, then -200
              width: size.width - 200,
              child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                     /* child: Text(
                        product.title,
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.green[900],
                          fontWeight: FontWeight.bold,
                        ),
                      ),*/
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                    /*  child: Text(
                        product.subTitle,
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.green[900],
                          fontWeight: FontWeight.normal,
                        ),
                      ),*/
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      child: Container(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 255, 255)),
                          onPressed: () {
                          //  name = product.title;
                           // Navigator.pushNamed(
                              //context,
                            //  Homeconst.screenRoute,
                           // );
                            //selected_index = product.id - 1;
                          },
                          child: const Text('see more'),
                        ),
                      ),
                      //
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}*/


