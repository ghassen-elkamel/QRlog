import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:qrlog_frontend/app/data/services/admin_service.dart';

import '../../../data/models/entities/customer.dart';
import '../../../routes/app_pages.dart';

class EditUserController extends GetxController {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController matriculation = TextEditingController();

  TextEditingController email = TextEditingController();

  AdminService adminService = AdminService();
  late Customer user;

  final count = 0.obs;

  @override
  void onInit() {
    user = Get.arguments;
    email.text = user.email ?? "";
    firstname.text = user.firstName != null ? user.firstName : "";
    lastname.text = user.lastName != null ? user.lastName : "";
    username.text = (user.username != null ? user.username : "")!;
    matriculation.text =
        (user.matriculation != null ? user.matriculation : "")!;
    email.text = (user.email != null ? user.email : "")!;

    super.onInit();
  }

  @override
  void onReady() {

    user = Get.arguments;

    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  updateUser() async {

    Customer editedUser = Customer(
      firstName: firstname.text,
      lastName: lastname.text,
      username: username.text,
      matriculation: matriculation.text,
      email: email.text != "" ? email.text : user.email,
    );

    dynamic response = await adminService.updateUser(editedUser, user.id!);

    if (response != null) {
      user = Customer.fromJson(response);
      Get.back(result: user);
    }
  }

  deleteUser() async {
    var response = await adminService.deleteUser(id: user.id!);
    if (response != null) {
      Get.snackbar("PixiMind", "user deleted successfully");
      Get.offNamed(Routes.USER);
    } else {
      Get.snackbar("PixiMind", "user was not deleted");
    }
  }
}
