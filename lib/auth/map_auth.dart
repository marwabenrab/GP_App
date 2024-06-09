//import 'dart:convert';

import 'dart:convert';
import 'dart:developer';

import 'package:fikra_app/admin/page_add.dart';
import 'package:fikra_app/constants.dart';
import 'package:fikra_app/screens/myadv_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart'; // استيراد مكتبة الخدمات
import '../admin/pageone.dart';
import '../controllers/user_session_controller.dart';
import '../screenns/parametre.dart';
import '../screenns/profil_screnns.dart';
import '../screens/adv_secreens.dart';
import '../screens/login_secreens.dart';
import '../widgets/custbuttom.dart';
import 'page_auth.dart';
import 'package:http/http.dart' as http;

class Mapauth extends StatefulWidget {
  static const String screenRoute = 'map_auth';
  const Mapauth({Key? key}) : super(key: key);

  @override
  State<Mapauth> createState() => _MapauthState();
}

class _MapauthState extends State<Mapauth> {
  List<String> list = ['en', 'ar', 'fn'];
  int selectedIndex = 0;
  SharedPreferences? prefs;
  Set<Marker> markers = {};
  List<dynamic> _data = [];
  @override
  void initState() {
    super.initState();
    _fetchData();
    _loadMarkers();

    _addInitialMarkers();
  }

  Future<void> _fetchData() async {
    try {
      var url = "http://10.0.2.2:80/falahphp/auth/Get_land.php";
      var response = await http.post(Uri.parse(url));

      if (response.statusCode == 200) {
        setState(() {
          _data = jsonDecode(response.body);
          _loadMarkers();
        });
      } else {
        log(response.body);
        throw Exception('فشل في تحميل البيانات');
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> _loadMarkers() async {
    prefs = await SharedPreferences.getInstance();
    double? lat = prefs?.getDouble('marker_lat');
    double? lng = prefs?.getDouble('marker_lng');

    if (lat != null && lng != null) {
      final Marker newMarker = Marker(
        markerId: MarkerId('marker_id_${lng}'),
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(title: 'New Marker', snippet: 'Added from list'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
        onTap: () {},
      );

      setState(() {
        markers.add(newMarker);
      });
    }
    log(_data.length.toString());
    log(_data
        .where(
            (element) => element["approved"] == "1" || element["approved"] == 1)
        .toList()
        .toString());

    for (var i in (_data
        .where(
            (element) => element["approved"] == "1" || element["approved"] == 1)
        .toList())) {
      if (i["coord_X"] != null && i["coord_Y"] != null) {
        final Marker newMarker = Marker(
          markerId: MarkerId('marker_id_${i["coord_X"]}'),
          position:
              LatLng(double.parse(i["coord_X"]), double.parse(i["coord_Y"])),
          infoWindow:
              InfoWindow(title: 'New Marker', snippet: 'Added from list'),
          icon: i['status'] == 'Rent'
              ? BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueYellow)
              : BitmapDescriptor.defaultMarker,
          onTap: () {
            selectedLand = i;
            Navigator.pushNamed(context, PageAdd.screenRoute);
          },
        );

        setState(() {
          markers.add(newMarker);
        });
      }
    }
  }

  void _addInitialMarkers() {
    // Add initial markers on the map
    final Marker marker1 = Marker(
      markerId: const MarkerId('marker_id_1'),
      position: const LatLng(36.27207921771714, 1.9698267053269236),
      infoWindow: const InfoWindow(title: 'benrabah marwa', snippet: 'للكراء'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
      onTap: () {
        Navigator.pushNamed(context, Pageauth.screenRoute);
      },
    );

    markers.add(marker1);
    Marker marker2 = Marker(
      markerId: const MarkerId('marker_id_2'),
      position: const LatLng(36.27111984043929, 1.943641020808114),
      infoWindow: const InfoWindow(title: 'Oudadi Nadjlaa', snippet: 'للبيع'),
      onTap: () {
        Navigator.pushNamed(context, Pageone.screenRoute);
      },
    );

    markers.add(marker2);
  }

  void _addNewMarker(LatLng position) {
    final String markerIdVal =
        'marker_id_${position.latitude}_${position.longitude}';
    final MarkerId markerId = MarkerId(markerIdVal);

    final Marker newMarker = Marker(
        markerId: markerId,
        position: position,
        infoWindow: InfoWindow(title: 'New Marker', snippet: 'Added from list'),
        onTap: () {
          //Navigator.pushNamed(context, Pageauth.screenRoute);
        });

    setState(() {
      markers.add(newMarker);
    });
  }

  Future<void> _showAdStatusDialog() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String adStatus = prefs.getString('ad_status') ?? 'pending';

    Color statusColor;
    String statusText;

    if (adStatus == 'approved') {
      statusColor = Colors.green;
      statusText = 'Approved';
    } else if (adStatus == 'rejected') {
      statusColor = Colors.red;
      statusText = 'Rejected';
    } else {
      statusColor = Colors.yellow;
      statusText = 'Pending';
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text('Ad Status'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: statusColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    // ,
                    Text(statusText),
                  ],
                ),
              ),
              // SizedBox(height: 20),
              //   Text(
              //    'تم $statusText الملف',
              //    style: TextStyle(fontSize: 16),
              //   ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('images/veire.jpg'),
                ),
              ),
              accountName: Text('accountName'.tr),
              accountEmail: Text('accountEmail@gmail.com'.tr),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.person),
              title: Text('Profile'.tr),
              onTap: () {
                Navigator.pushNamed(context, Profilscrenns.screenRoute);
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.login),
              title: Text('Login'.tr),
              onTap: () {
                Navigator.pushNamed(context, loginscreens.screenRoute);
              },
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTapDown: (TapDownDetails details) {
                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(
                    details.globalPosition.dx,
                    details.globalPosition.dy,
                    details.globalPosition.dx + 1.0,
                    details.globalPosition.dy + 1.0,
                  ),
                  items: List.generate(
                    3,
                    (index) => PopupMenuItem(
                      child: Text(list[index]),
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                          Get.updateLocale(Locale(list[index]));
                        });
                      },
                    ),
                  ),
                );
              },
              child: ListTile(
                trailing: const Icon(Icons.chevron_right),
                leading: const Icon(Icons.language),
                title: Text('Language'.tr),
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.task),
              title: Text('My adv'.tr),
              onTap: () =>
                  Navigator.pushNamed(context, MyadvScreen.screenRoute),
              // onTap: _showAdStatusDialog,
            ),
            const SizedBox(height: 10),
            const Divider(color: Colors.black),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.settings),
              title: Text('Settings'.tr),
              onTap: () {
                Navigator.pushNamed(context, Parametre.screenRoute);
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.logout),
              title: Text('Exit'.tr),
              onTap: () async {
                UserSessionController user = Get.find();
                await user.logout();
                SystemNavigator.pop(); // إغلاق التطبيق بالكامل
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 97, 188, 114),
        title: Text(
          'Map'.tr,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(5),
          child: SizedBox(),
        ),
      ),
      body: Stack(
        children: [
          GetBuilder<UserSessionController>(
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
              onLongPress: _addNewMarker,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: GetBuilder<UserSessionController>(
              init: UserSessionController(),
              builder: (controller) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: CustButtom(
                  text: 'Land Registration'.tr,
                  onPressed: () {
                    if (controller.isLocked.isTrue) {
                      Navigator.pushNamed(context, loginscreens.screenRoute);
                    } else {
                      Navigator.pushNamed(context, Advsecreens.screenRoute);
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
