import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class Ownership extends StatefulWidget {
  static const String screenRoute = 'ownership';
  const Ownership({Key? key}) : super(key: key);

  @override
  State<Ownership> createState() => _OwnershipState();
}

class _OwnershipState extends State<Ownership> {
  File? imageFile;
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController textController = TextEditingController();
  String statusMessage = "";
  bool imageConfirmation = false;

  _showOption(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Choose one'.tr),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.image),
                title: Text('Gallery'.tr),
                onTap: () => _imageFromGallery(context),
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: Text('Camera'.tr),
                onTap: () => _imageFromCamera(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future _imageFromGallery(BuildContext context) async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        imageFile = File(image.path);
        imageConfirmation = true;
      }
    });
  }

  Future _imageFromCamera(BuildContext context) async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      if (image != null) {
        imageFile = File(image.path);
        imageConfirmation = true;
      }
    });
  }

  Future<void> sendDataToServer(
      String name, String number, String text, File? imageFile) async {
    if (imageFile == null) {
      setState(() {
        statusMessage = "Please select an image.";
      });
      return;
    }

    if (name.isEmpty || number.isEmpty || text.isEmpty) {
      setState(() {
        statusMessage = "All fields are required.";
      });
      return;
    }

    try {
      var url = "https://192.168.1.6/falahphp/auth/complaint.php";
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields['name'] = name;
      request.fields['number'] = number;
      request.fields['text'] = text;
      request.files
          .add(await http.MultipartFile.fromPath('image', imageFile.path));

      var response = await request.send();

      var responseData = await response.stream.toBytes();
      var responseString = utf8.decode(responseData);

      // Logging the response body for debugging
      debugPrint("Response Body: $responseString");

      if (response.statusCode == 200) {
        try {
          var data = json.decode(responseString);

          setState(() {
            statusMessage = data['status'];
          });
          debugPrint("Response Data: $data");
        } catch (e) {
          //   setState(() {
          // statusMessage = "Error: Invalid JSON response";
          // });
          debugPrint("Error decoding JSON: $e");
        }
      } else {
        setState(() {
          statusMessage = "Error: Server returned ${response.statusCode}";
        });
        debugPrint("Server Error: ${response.statusCode}");
      }
    } catch (error) {
      debugPrint("Error: $error");
      setState(() {
        statusMessage = "Error: $error";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        // title: Text(
        //   'Ownership'.tr,
        // ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(100)),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: SizedBox(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 70),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.grey),
            ),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Enter Your User'.tr,
                labelText: 'User'.tr,
                prefixIcon: Icon(Icons.person),
                icon: SizedBox(),
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.grey),
            ),
            child: TextField(
              controller: numberController,
              decoration: InputDecoration(
                hintText: 'Enter Your Number'.tr,
                labelText: 'Number'.tr,
                prefixIcon: Icon(Icons.phone),
                icon: SizedBox(),
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: 50,
            child: ElevatedButton.icon(
              onPressed: () => _showOption(context),
              icon: const Icon(Icons.photo_camera),
              label: Text('Enter the ownership certificate'.tr),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: textController,
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'Enter text.....'.tr,
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              if (imageConfirmation) {
                sendDataToServer(
                  nameController.text,
                  numberController.text,
                  textController.text,
                  imageFile,
                );
              } else {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Confirmation'.tr),
                    content: Text(
                        'Are you sure you want to continue without selecting an image?'
                            .tr),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Cancel'.tr),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          sendDataToServer(
                            nameController.text,
                            numberController.text,
                            textController.text,
                            imageFile,
                          );
                        },
                        child: Text('Continue'.tr),
                      ),
                    ],
                  ),
                );
              }
            },
            child: Text('Send'.tr),
          ),
          const SizedBox(height: 20),
          Text(
            statusMessage,
            style: const TextStyle(color: Colors.red),
          )
        ],
      ),
    );
  }
}









/*import 'dart:io';

//import 'package:fikra_app/widgets/cust.dart';
import 'package:fikra_app/widgets/cust.dart';
import 'package:fikra_app/widgets/custbuttom.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:image_picker/image_picker.dart';

class Ownership extends StatefulWidget {
  static const String screenRoute = 'ownership';
  const Ownership({super.key});

  @override
  State<Ownership> createState() => _OwnershipState();
}

class _OwnershipState extends State<Ownership> {
  late File imageFile;

  _showOption(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(' Choose one'.tr),
              content: SingleChildScrollView(
                child: Column(children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.image),
                    title: Text('Gallery'.tr),
                    onTap: () => _imageFromGallery(context),
                  ),
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: Text('Camera'.tr),
                    onTap: () => _imageFromCamera(context),
                  )
                ]),
              ),
            ));
  }

  Future _imageFromGallery(BuildContext context) async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = File(image!.path);
    });
  }

  Future _imageFromCamera(BuildContext context) async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      imageFile = File(image!.path); // فارغة ما عندها قيمة  null
      // لما نفتح الكاميرا  و ما ناخذ صورة  يطلع خطا
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          ''.tr,
          //  style: TextStyle(color: Colors.white),
        ),
        centerTitle: true, // titre  في وسط
        shape: const RoundedRectangleBorder(
          //  side: BorderSide(width: 3, color: Color.fromARGB(210, 18, 79, 11)),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(100)),
        ),
        bottom: const PreferredSize(
          // هذه   شكلت المستطيل   قبل تشكيله لي نصف دائرة
          preferredSize: Size.fromHeight(60),
          child: SizedBox(),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 70,
          ),
          Cuts(
            hinttext: 'Entre  Your User'.tr,
            labeltext: 'User'.tr,
            iconData: Icons.person,
            onChanged: (value) {}, obscureText: true, validator: (value) {  }, 
          
          ),
          const SizedBox(
            height: 10,
          ),
          Cuts(
              hinttext: 'Entre Your Number'.tr,
              labeltext: 'Number'.tr,
              iconData: Icons.phone,
              onChanged: (value) {}, obscureText: true, validator: (value) {  }, 
            ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            height: 50,
            child: ElevatedButton.icon(
                onPressed: () => _showOption(context),
                icon: const Icon(Icons.photo_camera),
                label: Text('Entre the ownership certificate'.tr)),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              border: Border.all(
                  color:
                      Colors.grey), // يمكنك تعديل هذا لتناسب التصميم الخاص بك
              borderRadius:
                  BorderRadius.circular(10), // تعديل شكل الزوايا حسب الحاجة
            ),
            child: TextField(
              maxLines: null, //  للسماح بعدة أسطر للنص
              decoration: InputDecoration(
                hintText: 'Enter text.....'.tr, // نص تلميحي
                border: InputBorder.none, // لإزالة حدود الإدخال
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustButtom(
            text: 'Send'.tr,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}*/
