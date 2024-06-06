import 'package:fikra_app/constants.dart';
import 'package:fikra_app/widgets/product_body.dart';
import 'package:flutter/material.dart';

class ProductsScreens extends StatelessWidget {
  static const String screenRoute = 'products_screens';

  const ProductsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimarydColor,
      appBar: ProductAppBar(),
      body: const ProductBody(),
    );
  }

  AppBar  ProductAppBar() {
    return AppBar(
      elevation: 0,
      title:const Text('Appropriate products'),
      backgroundColor: kPrimarydColor,
      actions:const [
        Icon(Icons.add_location),
      ],
    );
  }
}
