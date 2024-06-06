import 'dart:convert';
import 'package:fikra_app/controllers/user_session_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:photo_view/photo_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../auth/map_auth.dart';

class Land_list extends StatefulWidget {
  static const String screenRoute = 'land_list';
  const Land_list({Key? key}) : super(key: key);

  @override
  State<Land_list> createState() => _Land_listState();
}

class _Land_listState extends State<Land_list> {
  List<dynamic> _data = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _approvedLand(int index, int approved) async {
    try {
      UserSessionController user = Get.find();
      var url = "https://192.168.1.6/falahphp/auth/Approved_land.php";
      var response = await http.post(Uri.parse(url),
          body: {'idLand': _data[index]['id_land'], 'approved': '$approved'});
    } catch (error) {
      print(error);
    }
  }

  Future<void> _fetchData() async {
    try {
      var url = "https://192.168.1.6/falahphp/auth/Get_land.php";
      var response = await http.post(Uri.parse(url));

      if (response.statusCode == 200) {
        setState(() {
          _data = jsonDecode(response.body);
        });
      } else {
        throw Exception('فشل في تحميل البيانات');
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> _deleteItemFromDatabase(int index) async {
    try {
      var url = "https://192.168.1.6/falahphp/auth/Delet_land.php";
      var response = await http.post(
        Uri.parse(url),
        body: {
          'id_Land': _data[index]['id_Land'].toString(),
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
      print(error);
    }
  }

  void _showDeleteConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("تأكيد الحذف"),
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

  void _addMarkerAndNavigate(double lat, double lng) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('marker_lat', lat);
    await prefs.setDouble('marker_lng', lng);
    Navigator.pushNamed(context, Mapauth.screenRoute);
  }

  void _storeSelectedOption(String option) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_option', option);
  }

  PopupMenuItem<String> buildItem(String itemText) {
    return PopupMenuItem<String>(
      value: itemText,
      child: Text(itemText),
    );
  }

  PopupMenuButton<String> buildPopupMenuButton(
      BuildContext context, int index) {
    return PopupMenuButton<String>(
      itemBuilder: (context) => [
        buildItem('مقبول'),
        buildItem('مرفوض'),
      ],
      onSelected: (String value) async {
        _storeSelectedOption(value);

        switch (value) {
          case 'مقبول':
            _approvedLand(index, 1);
            break;
          case 'مرفوض':
            _approvedLand(index, 2);
            break;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('lands')),
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
                height: 300,
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
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                data['adress'],
                                style: const TextStyle(
                                  fontSize: 18, // تصغير حجم الخط
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                'Phone: ${data['phone']}',
                                style: const TextStyle(
                                  fontSize: 16, // تصغير حجم الخط
                                  color: Colors.black,
                                ),
                                textAlign:
                                    TextAlign.right, // إزاحة النص إلى اليمين
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                'Status: ${data['status']}',
                                style: const TextStyle(
                                  fontSize: 16, // تصغير حجم الخط
                                  color: Colors.black,
                                ),
                                textAlign:
                                    TextAlign.right, // إزاحة النص إلى اليمين
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                'Coordinates: (${data['coord_X']}, ${data['coord_Y']})',
                                style: const TextStyle(
                                  fontSize: 16, // تصغير حجم الخط
                                  color: Colors.black,
                                ),
                                textAlign:
                                    TextAlign.right, // إزاحة النص إلى اليمين
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _showImage(
                                context,
                                "https://192.168.1.6/falahphp/auth/" +
                                    data['image_own']);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8), // تصغير حجم الزر
                            textStyle: TextStyle(
                                fontSize: 14), // تصغير حجم النص داخل الزر
                          ),
                          child: const Text('Ownership Image',
                              style: TextStyle(color: Colors.white)),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            _showImage(
                                context,
                                "https://192.168.1.6/falahphp/auth/" +
                                    data['image_payment']);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8), // تصغير حجم الزر
                            textStyle: TextStyle(
                                fontSize: 14), // تصغير حجم النص داخل الزر
                          ),
                          child: const Text('Payment Image',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        buildPopupMenuButton(context, index),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            double lat = double.parse(data['coord_X']);
                            double lng = double.parse(data['coord_Y']);
                            _addMarkerAndNavigate(lat, lng);
                          },
                          icon: const Icon(
                            Icons.add_location,
                            color: Colors.green,
                            size: 30,
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
                  ],
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
