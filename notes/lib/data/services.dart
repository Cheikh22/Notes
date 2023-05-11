import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';

class Services {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  // void logout(BuildContext context) async {
  //   await storage.delete(key: "token");
  //   await storage.delete(key: "adresse");
  //   await storage.delete(key: "active");
  //   await storage.delete(key: "refresh");
  //   await storage.delete(key: "nni");
  //   await storage.delete(key: "nom");
  //   await storage.delete(key: "id");
  //   await storage.delete(key: "reference");
  //   Navigator.pushNamedAndRemoveUntil(context, loginPage, (route) => false);
  // }

  static String dateformatter() {
    var date = DateTime.now();
    var formatter = DateFormat('dd-MM-yyyy HH:mm');
    String formattedDate = formatter.format(date);
    return formattedDate;
  }

}
