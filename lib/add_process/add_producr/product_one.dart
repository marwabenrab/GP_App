import 'dart:convert';

import 'package:fikra_app/AppProvider.dart';
import 'package:fikra_app/add_process/add_producr/product_two.dart';
import 'package:fikra_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ProductOne extends StatefulWidget {
  static const String screenRoute = 'product_one';
  const ProductOne({super.key});

  @override
  State<ProductOne> createState() => _ProductOneState();
}

class _ProductOneState extends State<ProductOne> {
  int selected_index = 0; // تم نقل المتغير هنا
  List _data = [];
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      var url = "http://10.0.2.2:80/falahphp/auth/get_lands_products.php";
      var response = await http
          .post(Uri.parse(url), body: {'id': selectedLand['id_Land']});

      if (response.statusCode == 200) {
        setState(() {
          _data = jsonDecode(response.body);
          Provider.of<AppProvider>(context, listen: false).setProducts(_data);
        });
      } else {
        throw Exception('فشل في تحميل البيانات');
      }
    } catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }

  Future<void> _deleteItemFromDatabase(int index) async {
    try {
      var url = "http://10.0.2.2:80/falahphp/auth/Delet_produit.php";
      var response = await http.post(
        Uri.parse(url),
        body: {
          'id_Product': _data[index]['id_Product']
              .toString(), // تأكد من وجود مفتاح id في البيانات
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          _data.removeAt(index);
        });
      } else {
        throw Exception('فشل في حذف البيانات من قاعدة البيانات');
      }
    } catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }

  void _showDeleteConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("تأكيد الحذف"),
          content: Text("هل أنت متأكد أنك تريد حذف هذا العنصر؟"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("إلغاء"),
            ),
            TextButton(
              onPressed: () async {
                await _deleteItemFromDatabase(index);
                Navigator.of(context).pop();
              },
              child: Text("تأكيد"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed:
              Provider.of<AppProvider>(context, listen: false).addInitProduct(),
          child: Icon(Icons.add),
        ),
        backgroundColor: kPrimarydColor,
        appBar: AppBar(
          elevation: 0,
          title: const Text('Appropriate products'),
          backgroundColor: kPrimarydColor,
          actions: const [
            Icon(Icons.add_location),
          ],
        ),
        body: Column(
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
                    shrinkWrap: true,
                    itemCount: Provider.of<AppProvider>(context)
                        .products
                        .length, // تم استبدال product.length ب demoProducts.length
                    itemBuilder: (context, index) => ProductTwo(
                      itemIndex: index,
                      product: Provider.of<AppProvider>(context)
                          .products[index], // تم تمرير المنتج من demoProducts
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
