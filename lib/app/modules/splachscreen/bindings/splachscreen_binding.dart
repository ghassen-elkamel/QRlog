import 'package:get/get.dart';

import '../controllers/splachscreen_controller.dart';

class SplachscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashScreenController>(
      () => SplashScreenController(),
    );
  }
}
