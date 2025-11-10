import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  static Future<bool> requestMicrophone() async {
    final st = await Permission.microphone.request();
    return st == PermissionStatus.granted;
  }
  static Future<bool> requestCamera() async {
    final st = await Permission.camera.request();
    return st == PermissionStatus.granted;
  }
}
