import 'package:connectivity_plus/connectivity_plus.dart';

class WifiHelper {
  static late List<ConnectivityResult> connectivityResult;
  static Future init() async {
    connectivityResult = await (Connectivity().checkConnectivity());
  }
}
