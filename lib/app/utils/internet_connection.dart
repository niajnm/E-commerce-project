import 'package:connectivity/connectivity.dart';

class InternetConnect {
 static Future<bool> isInternetConnected() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}
