// ignore_for_file: camel_case_types, avoid_print, prefer_const_constructors

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class Complaint_list extends StatefulWidget {
  static const String screenRoute = 'complaint_list';

  const Complaint_list({super.key});
  @override
  State<Complaint_list> createState() => _Complaint_listState();
}

class _Complaint_listState extends State<Complaint_list> {
  List<dynamic> _data = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      var url = "http://10.0.2.2:80/falahphp/auth/Get_complaint.php";
      var response = await http.post(Uri.parse(url));

      if (response.statusCode == 200) {
        setState(() {
          _data = jsonDecode(response.body);
        });
      } else {
        throw Exception('فشل في تحميل البيانات');
      }
    } catch (error) {
      // ignore:
      print(error);
    }
  }

  Future<void> _deleteItemFromDatabase(int index) async {
    try {
      var url = "http://10.0.2.2:80/falahphp/auth/Delet_complaint.php";
      var response = await http.post(
        Uri.parse(url),
        body: {
          'id_complaint': _data[index]['id_complaint'].toString(),
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
      /// The `print` function in Dart is used to output messages to the console during program
      /// execution. In the provided code, `print` is used to display any errors that occur during

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

  void _showImage(BuildContext context, String imageUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageGallery(imageUrl: imageUrl),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Complaints')),
        backgroundColor: const Color(0xFF56D76C),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: _data.length,
          itemBuilder: (BuildContext context, int index) {
            final data = _data[index];
            return Padding(
              padding: const EdgeInsets.all(8),
              child: IntrinsicHeight(
                child: Container(
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
                            children: [
                              Text(
                                data['id_complaint'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                data['name'],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[700],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                data['number'],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[700],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                data['text'],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _showImage(
                              context,
                              "http://10.0.2.2:80/falahphp/auth/" +
                                  data['image']);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        child: const Text('view photo',
                            style: TextStyle(color: Colors.white)),
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
              ),
            );
          },
        ),
      ),
    );
  }
}

class ImageGallery extends StatelessWidget {
  final String imageUrl;

  ImageGallery({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('عرض الصور')),
        backgroundColor: const Color(0xFF56D76C),
      ),
      body: Center(
        child: PhotoView(
          imageProvider: NetworkImage(imageUrl),
          backgroundDecoration: const BoxDecoration(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
