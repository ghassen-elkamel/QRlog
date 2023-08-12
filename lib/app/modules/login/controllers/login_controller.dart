import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:qrlog_frontend/app/data/services/auth_service.dart';
import 'package:qrlog_frontend/app/routes/app_pages.dart';

import '../../../core/values/keys.dart';

class LoginController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  AuthService authService = AuthService();
  final bool isTeleTravail = false;

  void onInit() {
    super.onInit();
  }
  login() async {
    if (Keys.globalKeyLogin.currentState!.validate()) {
      var response = await authService.login(username.text, password.text);
      if(response){
        Get.offNamed(Routes.HOME);
      }
    }
  }
}
