import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profilscrenns extends StatefulWidget {
  static const String screenRoute = 'profil_screnns';
  @override
  _ProfilscrennsState createState() => _ProfilscrennsState();
}

class _ProfilscrennsState extends State<Profilscrenns> {
  String _name = 'Mohamed';
  String _phone = '0667889043';
  String _email = 'mohamed@gmail.com';
  String _address = 'Ain defla';
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _getImageFromPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: _imageFile != null
                        ? FileImage(_imageFile!)
                        : AssetImage('images/profil.jpg') as ImageProvider,
                  ),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: _pickImageFromGallery,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'My profile',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              itemProfile('Name', _name, Icons.person, () {
                _editInfo('Name');
              }),
              const SizedBox(height: 10),
              itemProfile('Phone', _phone, Icons.phone, () {
                _editInfo('Phone');
              }),
              const SizedBox(height: 10),
              itemProfile('Email', _email, Icons.email, () {
                _editInfo('Email');
              }),
              const SizedBox(height: 10),
              itemProfile('Address', _address, Icons.location_city, () {
                _editInfo('Address');
              }),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                /* child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    "Edit Profile",
                    style: TextStyle(color: Colors.black),
                  ),
                ),*/
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget itemProfile(
      String title, String subtitle, IconData iconData, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: Colors.green.withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 10,
          )
        ],
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: IconButton(
          icon: Icon(Icons.edit, color: Colors.green.shade400),
          onPressed: onTap,
        ),
        tileColor: Colors.white,
      ),
    );
  }

  void _editInfo(String infoType) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newValue = '';
        return AlertDialog(
          title: Text('Edit $infoType'),
          content: TextField(
            decoration: InputDecoration(labelText: 'Enter new $infoType'),
            onChanged: (value) {
              newValue = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  switch (infoType) {
                    case 'User':
                      _name = newValue;
                      break;
                    case 'phone':
                      _phone = newValue;
                      break;
                    case 'Email':
                      _email = newValue;

                      break;
                    case 'Address':
                      _address = newValue;
                      break;
                  }
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'.tr),
            ),
          ],
        );
      },
    );
  }

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        _saveImageToPrefs(pickedFile.path);
      });
    }
  }

  Future<void> _saveImageToPrefs(String imagePath) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('imagePath', imagePath);
  }

  Future<void> _getImageFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? imagePath = prefs.getString('imagePath');
    if (imagePath != null) {
      setState(() {
        _imageFile = File(imagePath);
      });
    }
  }
}

