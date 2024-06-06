import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddInfo extends StatefulWidget {
  static const String screenRoute = 'add_info';
  const AddInfo({Key? key}) : super(key: key);

  @override
  State<AddInfo> createState() => _AddInfoState();
}

class _AddInfoState extends State<AddInfo> {
  File? _image;
  String _address = '***'; // القيم الافتراضية للعنوان
  String _space = '*** Hectar'; // القيم الافتراضية للمساحة
  String _phoneNumber = '+213 123 123 123'; // القيم الافتراضية لرقم الهاتف
  String _rentalPrice = '*** DA'; // القيم الافتراضية لسعر الإيجار

  @override
  void initState() {
    super.initState();
    // تحميل الصورة مرة أخرى إذا كانت متاحة
    // يمكنك استخدام الحالة النهائية هنا لتحديث _image
  }

  Future<void> _editText(BuildContext context, String title, String value) async {
    String? newValue = await showDialog(
      context: context,
      builder: (BuildContext context) {
        String tempValue = value; // القيمة المؤقتة للتحرير
        return AlertDialog(
          title: Text('Edit $title'),
          content: TextField(
            controller: TextEditingController(text: value),
            onChanged: (value) {
              tempValue = value; // تحديث القيمة المؤقتة أثناء التحرير
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(tempValue); // إغلاق الحوار وإرجاع القيمة المحدثة
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // إغلاق الحوار دون حفظ التغييرات
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );

    // تحديث القيمة بعد الحفظ إذا كان هناك تغيير
    if (newValue != null) {
      setState(() {
        switch (title) {
          case 'Address':
            _address = newValue;
            break;
          case 'Space':
            _space = newValue;
            break;
          case 'Phone Number':
            _phoneNumber = newValue;
            break;
          case 'Rental price':
            _rentalPrice = newValue;
            break;
        }
      });
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 115, 209, 118),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: 330,
                  height: 500,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 115, 209, 118),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: _image == null
                      ? const Icon(
                          Icons.camera_alt,
                          size: 100,
                          color: Colors.black54,
                        )
                      : Image.file(
                          _image!,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.8,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 20),
              children: [
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: Text(
                      'Name of the land location',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 45),
                buildContact(
                  title: 'Address',
                  text: _address,
                  onTap: () {
                    _editText(context, 'Address', _address); // فتح حوار التحرير عند الضغط
                  },
                ),
                const SizedBox(height: 20),
                buildContact(
                  title: 'Space',
                  text: _space,
                  onTap: () {
                    _editText(context, 'Space', _space); // فتح حوار التحرير عند الضغط
                  },
                ),
                const SizedBox(height: 20),
                buildContact(
                  title: 'Phone Number',
                  text: _phoneNumber,
                  onTap: () {
                    _editText(context, 'Phone Number', _phoneNumber); // فتح حوار التحرير عند الضغط
                  },
                ),
                const SizedBox(height: 20),
                buildContact(
                  title: 'Rental price',
                  text: _rentalPrice,
                  onTap: () {
                    _editText(context, 'Rental price', _rentalPrice); // فتح حوار التحرير عند الضغط
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContact({required String title, required String text, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$title:',
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
                SizedBox(width: 5),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}