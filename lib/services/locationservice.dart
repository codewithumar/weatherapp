import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location/location.dart';

import 'package:weatherapp/services/sharedprefservice.dart';

Future<void> getlocation() async {
  Location location = Location();

  bool serviceEnabled;
  PermissionStatus permissionGranted;
  LocationData? locationData;

  serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    return;
  }

  permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      Fluttertoast.showToast(msg: "Please enable Location from setting");
      return;
    }
  }

  try {
    locationData = await location.getLocation();
  } on PlatformException catch (e) {
    if (e.code == 'PERMISSION_DENIED') {
      Fluttertoast.showToast(msg: "Permission denied");
    }
  }
  SharedPrefService.setlattosharedpref(locationData!.latitude.toString());
  SharedPrefService.setlongitosharedpref(locationData.longitude.toString());
  SharedPrefService.setcitytosharedpref('');
  // Fluttertoast.showToast(msg: locationData!.latitude.toString());

  log("Latitude in shared pref ${SharedPrefService.getlat()!}");
  log("Longitude in shared pref ${SharedPrefService.getlongi()!}");
}
