/*import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Produit_list extends StatefulWidget {
  static const String screenRoute = 'produit_list';
  const Produit_list({super.key});

  @override
  State<Produit_list> createState() => _Produit_listState();
}

// ignore: camel_case_types
class _Produit_listState extends State<Produit_list> {
  List<dynamic> _data = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      var url =
          "http://10.0.2.2:80/falahphp/auth/Get_produit.php";
      var response = await http.post(Uri.parse(url));

      if (response.statusCode == 200) {
        setState(() {
          _data = jsonDecode(response.body);
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
      var url =
          "http://10.0.2.2:80/falahphp/auth/Delet_produit.php";
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
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('المنتوجات')),
        backgroundColor: const Color(0xFF56D76C),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: _data.length,
          itemBuilder: (BuildContext context, int index) {
            final data = _data[index];
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                height: 160,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(115, 167, 164, 164),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              data['name'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            //  const SizedBox(height: 8),
                            Text(
                              data['id_Product'],
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[700],
                              ),
                            ),
                            //  const SizedBox(height: 8),
                            Text(
                              data['id_Land'],
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[700],
                              ),
                            ),
                            //  const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _showDeleteConfirmationDialog(context, index);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.green,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
  } */
