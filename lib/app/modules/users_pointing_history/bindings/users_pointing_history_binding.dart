import 'package:get/get.dart';

import '../controllers/users_pointing_history_controller.dart';

class UsersPointingHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsersPointingHistoryController>(
      () => UsersPointingHistoryController(),
    );
  }
}
