import 'package:get/get.dart';
import 'package:qrlog_frontend/app/data/services/auth_service.dart';

class ScanController extends GetxController {
  AuthService authService = AuthService();
  Rx<String?> qrCode = Rx(null);
  onInit() async {
    super.onInit();
    qrCode.value = await authService.getQR();
  }

}
