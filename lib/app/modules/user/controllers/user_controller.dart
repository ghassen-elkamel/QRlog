import 'package:flutter/material.dart';
import 'package:get/get.dart';



import '../../../data/models/entities/appConfig.dart';
import '../../../data/models/entities/customer.dart';
import '../../../data/models/entities/pointings.dart';
import '../../../data/services/admin_service.dart';
import '../../../data/services/pointing_service.dart';

class UserController extends GetxController {
  AdminService adminService = AdminService();
  PointingService pointingService = PointingService();
  RxList<Customer> user = <Customer>[].obs;
  RxList<Pointings> pointings = <Pointings>[].obs;
  final count = 0.obs;
  RxBool isLoading = true.obs;
  AppConfig? config;
  RxBool remote = false.obs;

  @override
  onInit() async {
    isLoading.value = true;
    await getAllUsers();
    await getAppConfig();
    isLoading.value = false;

    super.onInit();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future<void> getAllUsers() async {
    user.value = await adminService.getUsers();
  }
   getAppConfig({bool withLoadingAlert = true}) async {
    config = await adminService.getAppConfig(withLoadingAlert: withLoadingAlert);
    if(config != null){
      remote.value = config!.remote;
    }
    return config?.remote;
  }

  void getUserPointings(String userId) async {
    pointings.value = await pointingService.getUsersPointings(userId);
  }

  updateUser(Customer user, String? status, String? remote) async {
    Customer editedUser;
      editedUser = Customer(
          status: status,
          remote: remote,
          lastName: user.lastName,
          firstName: user.firstName,
          username: user.username,
          matriculation: user.matriculation,
          email: user.email,
          password: user.password);
    var response = await adminService.updateUser(editedUser, user.id);
    if (response == null) {
      Get.snackbar(
        "failed",
        "update failed",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 2),
      );
    } else {
      Get.snackbar(
        "success",
        "updated successfully",
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 2),
      );
    }

  }
  void updateAppconfig(bool remote) async {
    AppConfig conf = AppConfig(
        begintime:config?.begintime ,
        endtime: config?.endtime,
        breakbegin: config?.breakbegin,
        breakend: config?.breakend,
        tolerance: config?.tolerance,
        remote: remote);

    var response = await adminService.updateAppConfig(conf);
    if (response == null) {
      Get.snackbar(
        "failed",
        "update failed",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 2),
      );
    } else {
      Get.snackbar(
        "success",
        "updated successfully",
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 2),
      );
    }

  }
}
