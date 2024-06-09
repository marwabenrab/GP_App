import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AppProvider extends ChangeNotifier {
  AppProvider() {
    markers.add(Marker(
        draggable: true,
        icon: BitmapDescriptor.defaultMarker,
        markerId: MarkerId(11.toString()),
        position: LatLng(36.256813666275754, 1.955305869326217),
        onDragStart: (value) {
          onDragMarker(value);
        }));
  }
  Set<Marker> markers = {};
  List<Map> products = [];
  bool fakes = false;
  addInitProduct() {
    if (!fakes) {
      fakes = true;
      products.add({});
      notifyListeners();
    }
  }

  setProducts(data) {
    products = data;
    notifyListeners();
  }

  onDragMarker(LatLng latLng) {
    log("asd");
    markers.clear();
    markers.add(Marker(
      draggable: true,
      icon: BitmapDescriptor.defaultMarker,
      markerId: MarkerId(latLng.latitude.toString()),
      position: LatLng(latLng.latitude, latLng.longitude),
    ));
    notifyListeners();
  }
}
