import 'dart:developer';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationService {
  static Position? _position;

  static Future<bool> hasLocationPermission() async {
    PermissionStatus permissionStatus = await Permission.location.status;
    return (permissionStatus.isGranted || permissionStatus.isLimited);
  }

  static Future<bool> getIsGpsAccessible() {
    return Geolocator.isLocationServiceEnabled().then((value) async {
      bool isLocationPermissionDenied = await _getIsLocationPermissionDenied();

      return !isLocationPermissionDenied && value;
    });
  }

  static Future<bool> _getIsLocationPermissionDenied() {
    return Geolocator.checkPermission().then((value) {
      return value == LocationPermission.deniedForever ||
          value == LocationPermission.denied ||
          value == LocationPermission.unableToDetermine;
    });
  }

  static Future<bool> isLocationServiceEnable() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      return true;
    }
    return false;
  }

  // Used this fuction to hande location for this project
  static Future<Position?> getLocationWithPermissionCheck() async {
    LocationPermission permission = await Geolocator.checkPermission();
    Position? currentPosition;

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever ||
        permission == LocationPermission.unableToDetermine) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        currentPosition = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
      }
    } else if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    }

    return currentPosition;
  }

  static Future<bool> isLocationPermissionGranted() async {
    LocationPermission permission = await Geolocator.checkPermission();
    return permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always;
  }

  static Future<String?> getCityName(double latitude, double longitude) async {
    log('latitude ${latitude.runtimeType}');
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;

        return placemark.locality ??
            placemark.subAdministrativeArea ??
            placemark.administrativeArea;
      }
    } catch (e) {
      print('Error: $e');
    }
    return 'Load';
  }
}
