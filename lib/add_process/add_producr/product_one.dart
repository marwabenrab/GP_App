
import 'package:fikra_app/add_process/add_producr/product_two.dart';
import 'package:fikra_app/constants.dart';
import 'package:fikra_app/models/product.dart';
//import 'package:fikra_app/models/product.dart';
import 'package:flutter/material.dart';

//import 'product_two.dart';

class ProductOne extends StatefulWidget {
  static const String screenRoute = 'product_one';
  const ProductOne({super.key});

  @override
  State<ProductOne> createState() => _ProductOneState();
}

int selected_index = 0;

class _ProductOneState extends State<ProductOne> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Column(
        children: [
          const SizedBox(height: kDefaultPadding / 2),
          Expanded(
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 70.0),
                  decoration: const BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
                ListView.builder(
                  itemCount: product.length,
                  itemBuilder: (context, index) => ProductTwo(
                      itemIndex: index,
                  // productList: ['Product 1', 'Product 2', 'Product 3'], // يمكنك استبدال هذه القائمة بالمنتجات الخاصة بك
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}



/*import 'package:fikra_app/constants.dart';
import 'package:fikra_app/models/product.dart';
import 'package:flutter/material.dart';

import 'product_two.dart';

class ProductOne extends StatefulWidget {
  static const String screenRoute = 'product_one';
  const ProductOne({super.key});

  @override
  State<ProductOne> createState() => _ProductOneState();
}

  int  selected_index = 0;

class _ProductOneState extends State<ProductOne> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
        child: Column(
        children: [
          const SizedBox(height: kDefaultPadding / 2),
          Expanded(
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 70.0),
                  decoration: const BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
                ListView.builder(
                  itemCount: product.length,
                  itemBuilder: (context, index) => ProductTwo(
                    itemIndex: index, productList: [],
                   // product: product[index],
                    
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}*/
