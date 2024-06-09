import 'package:fikra_app/const/home_const.dart';
import 'package:fikra_app/constants.dart';
import 'package:fikra_app/screen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../AppProvider.dart';

// تعريف النموذج الأساسي للمنتج
class Product {
  final String image, title, subTitle;
  final int id;

  Product({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.id,
  });
}

// بيانات منتجات تجريبية
List<Product> demoProducts = [
  Product(
    image: 'assets/images/product1.png',
    title: 'Product 1',
    subTitle: 'This is product 1',
    id: 2,
  ),
  Product(
    image: 'assets/images/product2.png',
    title: 'Product 2',
    subTitle: 'This is product 2',
    id: 3,
  ),
  Product(
    image: 'assets/images/product1.png',
    title: 'Product 3',
    subTitle: 'This is product 3',
    id: 4,
  ),
  Product(
    image: 'assets/images/product2.png',
    title: 'Product 4',
    subTitle: 'This is product 4',
    id: 5,
  ),
  Product(
    image: 'assets/images/product1.png',
    title: 'Product 5',
    subTitle: 'This is product 5',
    id: 6,
  ),
  Product(
    image: 'assets/images/product2.png',
    title: 'Product 6',
    subTitle: 'This is product 6',
    id: 7,
  ),
  Product(
    image: 'assets/images/product1.png',
    title: 'Product 7',
    subTitle: 'This is product 7',
    id: 8,
  ),
  Product(
    image: 'assets/images/product2.png',
    title: 'Product 8',
    subTitle: 'This is product 8',
    id: 9,
  ),
  Product(
    image: 'assets/images/product1.png',
    title: 'Product 9',
    subTitle: 'This is product 9',
    id: 10,
  ),
  // يمكنك إضافة منتجات أخرى هنا
];

// متغير لتخزين اسم المنتج المختار
String name = '';
int selected_index = 0;

class ProductBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Provider.of<AppProvider>(context).products.length,
      itemBuilder: (context, index) {
        return ProductTwo(
          itemIndex: index,
          product: Provider.of<AppProvider>(context).products[index],
        );
      },
    );
  }
}

class ProductTwo extends StatefulWidget {
  const ProductTwo({
    required this.itemIndex,
    required this.product,
    Key? key,
  }) : super(key: key);

  final int itemIndex;
  final Map product;

  @override
  _ProductTwoState createState() => _ProductTwoState();
}

class _ProductTwoState extends State<ProductTwo> {
  Map? _selectedProduct;

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
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 160,
              width: 150,
              child: const Icon(
                Icons.image, // استخدام الأيقونة
                size: 100, // تحديد الحجم
                color: Colors.grey, // تحديد اللون
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              height: 136.0,
              width: size.width - 180,
              child: Column(
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                    ),
                    child: DropdownButton<Map>(
                      hint: const Text('Select Product'),
                      value: _selectedProduct,
                      items: Provider.of<AppProvider>(context)
                          .products
                          .map((Map product) {
                        return DropdownMenuItem<Map>(
                          value: product,
                          child: Text(product['name'] ?? " "),
                        );
                      }).toList(),
                      onChanged: (Map? newValue) {
                        setState(() {
                          _selectedProduct = newValue;
                        });
                      },
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                    ),
                    child: Text(
                      widget.product['subtitle'] ?? "Good Product",
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.green[900],
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      onPressed: _selectedProduct == null
                          ? null
                          : () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Homeconst(), // تمرير HomeScreen كمعامل
                                ),
                              );
                            },
                      child: const Text('see more'),
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
