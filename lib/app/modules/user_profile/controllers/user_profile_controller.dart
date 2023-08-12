import 'package:get/get.dart';
import 'package:qrlog_frontend/app/data/models/entities/customer.dart';

import '../../../data/models/entities/pointings.dart';
import '../../../data/services/pointing_service.dart';

class UserProfileController extends GetxController {
  RxList<Pointings> pointings = <Pointings>[].obs;
  PointingService pointingService = PointingService();
  Rx<Customer?> user = Rx(null);
  final count = 0.obs;

  @override
  void onInit() {
    print("Get.arguments");
    print(Get.arguments);
    user.value = Get.arguments;

    getUserPointings();
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

  void getUserPointings() async {
    if (user.value != null) {
      pointings.value =
          await pointingService.getUsersPointings(user.value!.id!);
    }
  }
}
