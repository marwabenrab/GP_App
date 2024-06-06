// ignore_for_file: must_be_immutable

import 'package:fikra_app/const/home_const.dart';
import 'package:fikra_app/constants.dart';
import 'package:fikra_app/models/product.dart';
import 'package:fikra_app/widgets/product_body.dart';
import 'package:flutter/material.dart';

String name = '';

class ProductCard extends StatelessWidget {
  ProductCard({
    required this.itemIndex,
    required this.product,
    super.key,
  });

  final int itemIndex;
  final Product product;

  List Click = [const Homeconst()];

  dynamic get index => null;

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
                child: Image.asset(
                  product.image,
                  fit: BoxFit.cover,
                ),
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
                      child: Text(
                        product.title,
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.green[900],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child: Text(
                        product.subTitle,
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.green[900],
                          fontWeight: FontWeight.normal,
                        ),
                      ),
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
                            name = product.title;
                            Navigator.pushNamed(
                              context,
                              /// `Homeconst` seems to be a class or constant defined in the
                              /// `home_const.dart` file. It is being used in the code snippet as a
                              /// reference for accessing a property called `screenRoute`. This property
                              /// is used in the `Navigator.pushNamed` method to navigate to a specific
                              /// screen when the "see more" button is clicked in the `ProductCard`
                              /// widget.
                              Homeconst.screenRoute,
                            );
                            selected_index = product.id - 1;
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
}
