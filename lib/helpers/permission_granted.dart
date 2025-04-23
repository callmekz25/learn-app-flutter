import 'package:permission_handler/permission_handler.dart';

Future<bool> requestPermission(Permission permission) async {
  if (await permission.isGranted) {
    return true;
  }

  PermissionStatus permissionStatus = await permission.request();
  if (permissionStatus.isGranted) {
    return true;
  }
  if (permissionStatus.isPermanentlyDenied) {
    await openAppSettings();
  }
  return false;
}
