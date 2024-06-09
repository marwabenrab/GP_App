import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:fikra_app/AppProvider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../auth/map_auth.dart';
import '../controllers/user_session_controller.dart';
import '../widgets/custbuttom.dart';

class Advsecreens extends StatefulWidget {
  static const String screenRoute = 'adv_secreens';
  const Advsecreens({Key? key}) : super(key: key);

  @override
  State<Advsecreens> createState() => _AdvsecreensState();
}

class _AdvsecreensState extends State<Advsecreens> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController adr = TextEditingController();
  TextEditingController phone = TextEditingController();
  File? imageOwnFile;
  File? imagePaymentFile;
  String? selectedStatus;

  Set<Marker> markers = {};

  _showOption(BuildContext context, bool isOwnImage) {
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
                onTap: () => _imageFromGallery(context, isOwnImage),
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: Text('Camera'.tr),
                onTap: () => _imageFromCamera(context, isOwnImage),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _imageFromGallery(BuildContext context, bool isOwnImage) async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (isOwnImage) {
        imageOwnFile = File(image!.path);
      } else {
        imagePaymentFile = File(image!.path);
      }
    });
    Navigator.pop(context);
  }

  Future _imageFromCamera(BuildContext context, bool isOwnImage) async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      if (isOwnImage) {
        imageOwnFile = File(image!.path);
      } else {
        imagePaymentFile = File(image!.path);
      }
    });
    Navigator.pop(context);
  }

  Future<void> registerLand() async {
    if (!_formKey.currentState!.validate() ||
        selectedStatus == null ||
        imageOwnFile == null ||
        imagePaymentFile == null) {
      Get.snackbar('Error'.tr, 'Please fill all fields and upload images'.tr);
      return;
    }
    //http://10.0.2.2:80/falahphp//falahphp/auth

    var url = "http://10.0.2.2:80/falahphp/auth/land.php";
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields['adress'] = adr.text;
    request.fields['phone'] = phone.text;
    request.fields['status'] = selectedStatus!;

    request.fields['coord_X'] =
        Provider.of<AppProvider>(context, listen: false).markers.isNotEmpty
            ? Provider.of<AppProvider>(context, listen: false)
                .markers
                .first
                .position
                .latitude
                .toString()
            : "";
    request.fields['coord_Y'] =
        Provider.of<AppProvider>(context, listen: false).markers.isNotEmpty
            ? Provider.of<AppProvider>(context, listen: false)
                .markers
                .first
                .position
                .longitude
                .toString()
            : "";
    UserSessionController user = Get.find();
    request.fields['idFrmer'] = user.idFarmer.toString();

    request.files.add(
        await http.MultipartFile.fromPath('image_own', imageOwnFile!.path));
    request.files.add(await http.MultipartFile.fromPath(
        'image_payment', imagePaymentFile!.path));

    var response = await request.send();
    print(response);

    if (response.statusCode == 200) {
      var responseData = await http.Response.fromStream(response);
      print(responseData.body);
      var data = json.decode(responseData.body);
      if (data['status'] == 'success') {
        Get.snackbar('Success'.tr, 'Land registered successfully'.tr);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Success'.tr),
              content: Text('تم التسجيل بنجاح'.tr),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushReplacementNamed(
                        context, Mapauth.screenRoute);
                  },
                  child: Text('OK'.tr),
                ),
              ],
            );
          },
        );
      } else {
        Get.snackbar('Error'.tr, data['status']);
      }
    } else {
      Get.snackbar('Error'.tr, 'Failed to register land'.tr);
    }
  }

  // دالة لعرض الـDialog مع خريطة Google Map
  void _showAdditionalDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: double.maxFinite,
            height: 400, // زيادة الارتفاع إلى 400
            child: GetBuilder<UserSessionController>(
              init: UserSessionController(),
              builder: (controller) => GoogleMap(
                initialCameraPosition: const CameraPosition(
                  target: LatLng(36.256813666275754, 1.955305869326217),
                  zoom: 13,
                ),
                mapType: MapType.hybrid,
                myLocationEnabled: true,
                compassEnabled: true,
                cameraTargetBounds: CameraTargetBounds.unbounded,
                markers: Provider.of<AppProvider>(context).markers,
                // onTap: (LatLng latLng) {

                //   setState(() {
                //     log("message");
                //     markers.clear();
                //     markers.add(
                //       Marker(
                //         draggable: true,
                //         icon: BitmapDescriptor.defaultMarker,
                //         markerId: MarkerId(latLng.latitude.toString()),
                //         position: LatLng(latLng.latitude, latLng.longitude),
                //       ),
                //     );
                //   });
                // },
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'.tr),
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
        backgroundColor: Colors.green,
        title: Text(
          'Land registration'.tr,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(100),
            bottomRight: Radius.circular(100),
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: SizedBox(),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 20),
            TextFormField(
              controller: adr,
              decoration: InputDecoration(
                hintText: 'Enter Your Address'.tr,
                labelText: 'Address'.tr,
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required'.tr;
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: phone,
              decoration: InputDecoration(
                hintText: 'Enter Your Number'.tr,
                labelText: 'Number'.tr,
                prefixIcon: const Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required'.tr;
                } else if (value.length != 10) {
                  return 'Phone number must be 10 digits'.tr;
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Status'.tr,
                prefixIcon: const Icon(Icons.info),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              ),
              value: selectedStatus,
              items: ['Rent', 'Sell'].map((status) {
                return DropdownMenuItem(
                  value: status,
                  child: Text(status.tr),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedStatus = newValue;
                });
              },
              validator: (value) {
                if (value == null) {
                  return 'This field is required'.tr;
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () => _showOption(context, true),
                icon: const Icon(Icons.photo_camera),
                label: Text('Enter the ownership certificate'.tr),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () => _showOption(context, false),
                icon: const Icon(Icons.photo_camera),
                label: Text('Payment has arrived'.tr),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () => _showAdditionalDialog(
                    context), // استدعاء الدالة لعرض الـDialog مع الخريطة
                icon: const Icon(Icons.map),
                label: Text('Show Map'.tr),
              ),
            ),
            const SizedBox(height: 20),
            CustButtom(
              text: 'registration'.tr,
              onPressed: registerLand,
            ),
          ],
        ),
      ),
    );
  }
}





















/*import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../auth/map_auth.dart';
import '../controllers/user_session_controller.dart';
import '../widgets/custbuttom.dart';

class Advsecreens extends StatefulWidget {
  static const String screenRoute = 'adv_secreens';
  const Advsecreens({Key? key}) : super(key: key);

  @override
  State<Advsecreens> createState() => _AdvsecreensState();
}

class _AdvsecreensState extends State<Advsecreens> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController adr = TextEditingController();
  TextEditingController phone = TextEditingController();
  File? imageOwnFile;
  File? imagePaymentFile;
  String? selectedStatus;

  Set<Marker> markers = {};

  _showOption(BuildContext context, bool isOwnImage) {
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
                onTap: () => _imageFromGallery(context, isOwnImage),
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: Text('Camera'.tr),
                onTap: () => _imageFromCamera(context, isOwnImage),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _imageFromGallery(BuildContext context, bool isOwnImage) async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (isOwnImage) {
        imageOwnFile = File(image!.path);
      } else {
        imagePaymentFile = File(image!.path);
      }
    });
    Navigator.pop(context);
  }

  Future _imageFromCamera(BuildContext context, bool isOwnImage) async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      if (isOwnImage) {
        imageOwnFile = File(image!.path);
      } else {
        imagePaymentFile = File(image!.path);
      }
    });
    Navigator.pop(context);
  }

  Future<void> registerLand() async {
    if (!_formKey.currentState!.validate() ||
        selectedStatus == null ||
        imageOwnFile == null ||
        imagePaymentFile == null) {
      Get.snackbar('Error'.tr, 'Please fill all fields and upload images'.tr);
      return;
    }

    var url = "http://10.0.2.2:80/falahphp/auth/land.php";
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields['adress'] = adr.text;
    request.fields['phone'] = phone.text;
    request.fields['status'] = selectedStatus!;

    request.files.add(await http.MultipartFile.fromPath('image_own', imageOwnFile!.path));
    request.files.add(await http.MultipartFile.fromPath('image_payment', imagePaymentFile!.path));

    var response = await request.send();

    if (response.statusCode == 200) {
      var responseData = await http.Response.fromStream(response);
      var data = json.decode(responseData.body);
      if (data['status'] == 'success') {
        Get.snackbar('Success'.tr, 'Land registered successfully'.tr);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Success'.tr),
              content: Text('تم التسجيل بنجاح'.tr),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushReplacementNamed(context, Mapauth.screenRoute);
                  },
                  child: Text('OK'.tr),
                ),
              ],
            );
          },
        );
      } else {
        Get.snackbar('Error'.tr, data['status']);
      }
    } else {
      Get.snackbar('Error'.tr, 'Failed to register land'.tr);
    }
  }

  // دالة لعرض الـDialog مع خريطة Google Map
  void _showAdditionalDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: double.maxFinite,
            height: 400, // زيادة الارتفاع إلى 400
            child: GetBuilder<UserSessionController>(
              init: UserSessionController(),
              builder: (controller) => GoogleMap(
                initialCameraPosition: const CameraPosition(
                  target: LatLng(36.256813666275754, 1.955305869326217),
                  zoom: 13,
                ),
                mapType: MapType.hybrid,
                myLocationEnabled: true,
                compassEnabled: true,
                cameraTargetBounds: CameraTargetBounds.unbounded,
                markers: markers,
                onLongPress: (LatLng latLng) {
                  // لا تقم بشيء هنا، لأننا سنتعامل مع العلامات فقط
                },
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'.tr),
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
        backgroundColor: Colors.green,
        title: Text(
          'Land registration'.tr,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(100),
            bottomRight: Radius.circular(100),
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: SizedBox(),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 20),
            TextFormField(
              controller: adr,
              decoration: InputDecoration(
                hintText: 'Enter Your Address'.tr,
                labelText: 'Address'.tr,
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required'.tr;
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: phone,
              decoration: InputDecoration(
                hintText: 'Enter Your Number'.tr,
                labelText: 'Number'.tr,
                prefixIcon: const Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required'.tr;
                } else if (value.length != 10) {
                  return 'Phone number must be 10 digits'.tr;
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Status'.tr,
                prefixIcon: const Icon(Icons.info),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              ),
              value: selectedStatus,
              items: ['Rent', 'Sell'].map((status) {
                return DropdownMenuItem(
                  value: status,
                  child: Text(status.tr),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedStatus = newValue;
                });
              },
              validator: (value) {
                if (value == null) {
                  return 'This field is required'.tr;
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () => _showOption(context, true),
                icon: const Icon(Icons.photo_camera),
                label: Text('Enter the ownership certificate'.tr),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () => _showOption(context, false),
                icon: const Icon(Icons.photo_camera),
                label: Text('Payment has arrived'.tr),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () => _showAdditionalDialog(context), // استدعاء الدالة لعرض الـDialog مع الخريطة
                icon: const Icon(Icons.map),
                label: Text('Show Map'.tr),
              ),
            ),
            const SizedBox(height: 20),
            CustButtom(
              text: 'registration'.tr,
              onPressed: registerLand,
            ),
          ],
        ),
      ),
    );
  }
}*/

/*import 'dart:convert';
import 'dart:io';
import 'dart:js';
//import 'package:fikra_app/auth/map_auth.dart';
import 'package:fikra_app/widgets/cust.dart';
import 'package:fikra_app/widgets/custbuttom.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../auth/map_auth.dart';

class Advsecreens extends StatefulWidget {
  static const String screenRoute = 'adv_secreens';
  const Advsecreens({Key? key}) : super(key: key);

  @override
  State<Advsecreens> createState() => _AdvsecreensState();
}

TextEditingController adr = TextEditingController();
TextEditingController phone = TextEditingController();
TextEditingController status = TextEditingController();

Future registerLand(String? selectedStatus, File imageFile) async {
  print("hhhhhhhhhhhhhhhhhhh image: ${imageFile.path}");
  var url = "http://10.0.2.2:80/falahphp/auth/land.php";
  var http;
  var response = await http.post(
    Uri.parse(url),
    body: {
      "adress": adr.text,
      "phone": phone.text,
      "status": selectedStatus,
      //'phone': phone.text,
    },
  );
  var data = json.decode(response.body);
  if (data['status'] == 'success') {
    Navigator.push(
      context as BuildContext ,
      MaterialPageRoute(
        builder: (context) => Mapauth(),
      ),
    );
    Fluttertoast.showToast(
      msg: 'Inscription réussie',
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 25.0,
    );
  } else {
    Fluttertoast.showToast(
      msg: data['status'] ?? '',
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 25.0,
    );
    // Remplacez la ligne suivante par la page vers laquelle vous voulez naviguer après la connexion
    // Navigator.push(context, MaterialPageRoute(builder: (context)=> NextPage(),),);
  }
} 

class _AdvsecreensState extends State<Advsecreens> {
  late File imageFile;
  String? selectedStatus;

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
        )
      ),
    );
  }

  Future _imageFromGallery(BuildContext context) async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = File(image!.path);
    });
  }

  Future _imageFromCamera(BuildContext context) async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        imageFile = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Land registration'.tr,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(100),
            bottomRight: Radius.circular(100),
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: SizedBox(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 50),
          Cuts(
              controller: adr,
            hinttext: 'Entre Your Address'.tr,
            labeltext: 'Address'.tr,
            iconData: Icons.person,
            onChanged: (value) {
                adr.text = value;
            },
          ),
          const SizedBox(height: 10),
          Cuts(
            controller: phone,
            hinttext: 'Entre Your Number'.tr,
            labeltext: 'Number'.tr,
            iconData: Icons.phone,
            onChanged: (value) {
                phone.text = value;
            },
          ),
          const SizedBox(height: 15),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Status'.tr,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            ),
            value: selectedStatus,
            items: ['Rent', 'Sell'].map((status) {
              return DropdownMenuItem(
                value: status,
                child: Text(status.tr),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                selectedStatus = newValue;
              });
            },
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: 50,
            child: ElevatedButton.icon(
              onPressed: () => _showOption(context),
              icon: const Icon(Icons.photo_camera),
              label: Text('Entre the ownership certificate'.tr),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: 50,
            child: ElevatedButton.icon(
              onPressed: () => _showOption(context),
              icon: const Icon(Icons.photo_camera),
              label: Text('Payment has arrived'.tr),
            ),
          ),
          const SizedBox(height: 20),
          CustButtom(
            text: 'registration'.tr,
            onPressed: () {
              //registerLand(selectedStatus, imageFile);
              //   Navigator.pushNamed(context, Paymentconst.screenRoute);
            },
          )
        ],
      ),
    );
  }
}*/

/*<?php
include "../connect.php";
if( 
isset($_POST['adress']) && 
isset($_POST['phone'])&& 
isset($_POST['status'])&& 
//isset($_POST['codex'])&&
//isset($_POST['codey'])
)
{

$adress = $_POST['adress'];
$number = $_POST['number'];
$status = $_POST['status'];
//$codex = $_POST['codex'];
//$codey = $_POST['codey'];
$sql = "INSERT INTO `land` (`adress`, `phone`,  `status`) VALUES ('$adress', '$phone', '$status') ";


if ($con->query($sql) === TRUE) {
    
    $data = array('status' => 'success');
    echo json_encode($data);
}  else {
    
    $data = array('status' => 'Error: '.$con->error);
    echo json_encode($data);
}

}else {
    $data = array('status' => 'Error: Missing Data');
    echo json_encode($data);
}
?>   */
