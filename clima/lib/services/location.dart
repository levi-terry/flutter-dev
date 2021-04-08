import 'package:geolocator/geolocator.dart';
import 'dart:io' show Platform;

class Location {
  double latitude;
  double longitude;

 Future<void> getLocation() async {
    bool isLocationServiceEnabled;
    LocationPermission permission;

    try {
      isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!isLocationServiceEnabled) {
        if (Platform.isAndroid){
          await Geolocator.openLocationSettings();
        } else {
          await Geolocator.openAppSettings();
        }
        isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
        if (!isLocationServiceEnabled) {
          throw("Location services are disabled.");
        }
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.deniedForever) {
          // Permissions are denied forever, handle appropriately.
          throw(
              'Location permissions are permanently denied. Unable to request permissions.');
        }

        if (permission == LocationPermission.denied) {
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.
          return Future.error('Location permissions are denied');
        }
      }

      Position position =  await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e){
      print(e);
    }
  }
}
