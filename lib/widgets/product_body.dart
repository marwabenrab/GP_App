import 'package:fikra_app/constants.dart';
import 'package:fikra_app/models/product.dart';
import 'package:fikra_app/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductBody extends StatefulWidget {
  const ProductBody({super.key});

  @override
  State<ProductBody> createState() => _ProductBodyState();
}

  int  selected_index = 0;

class _ProductBodyState extends State<ProductBody> {
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
                  itemBuilder: (context, index) => ProductCard(
                    itemIndex: index,
                    product: product[index],
                    
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
