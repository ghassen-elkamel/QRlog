import 'package:get/get.dart';
import 'package:qrlog_frontend/app/data/models/entities/customer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/models/entities/pointings.dart';
import '../../../data/services/admin_service.dart';
import '../../../data/services/customer_service.dart';
import '../../../data/services/pointing_service.dart';

class UsersPointingHistoryController extends GetxController {
  PointingService pointingService = PointingService();
  CustomerService customerService = CustomerService();
  RxList<Pointings> pointings = <Pointings>[].obs;
  Rx<Customer?> customer = null.obs;
  AdminService adminService = AdminService();
  final count = 0.obs;
  Rx<DateTime> beginDate = DateTime.now().obs;
  Rx<DateTime> endDate = DateTime.now().obs;
  RxString beginText = DateTime.now().toString().substring(0, 10).obs;
  RxString endText = DateTime.now().toString().substring(0, 10).obs;
  RxList<Customer> users = <Customer>[].obs;

  @override
  Future<void> onInit() async {
    await getAllPointings();
    super.onInit();
  }

  void increment() => count.value++;

  getAllPointings() async {
    List<Pointings>? response = await pointingService.getAllPointings(
        beginDate: beginDate.value.toUtc().toString(),
        endDate: endDate.value.toUtc().toString());
    if (response != null) {
      pointings.value = response;
    }
  }

  void getUser(String userId) async {
    customer.value = await customerService.getUser(userId);
  }

  void downloadDataBase() {
    String pointingDownload =
        "http://localhost:3000/api/excel/project/download?beginDate=$beginDate&endDate=$endDate";
    if (beginText.value != "") {
      launchUrl(Uri.parse(pointingDownload));
    } else {
      Get.snackbar("Error", "Please select a date");
    }
  }

  void downloadDataBasePerUser() {
    String pointingDownloadPerUser =
        "http://localhost:3000/api/excel/project/download/perUsers?beginDate=$beginDate&endDate=$endDate";
    if (beginText.value != "") {
      launchUrl(Uri.parse(pointingDownloadPerUser));
    } else {
      Get.snackbar("Error", "Please select a date");
    }
  }
}
