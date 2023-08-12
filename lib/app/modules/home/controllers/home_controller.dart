import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:qrlog_frontend/app/data/models/entities/pointings.dart';
import 'package:qrlog_frontend/app/data/services/auth_service.dart';

import '../../../data/services/pointing_service.dart';


RxBool breakAction = false.obs;

enum Action { In, Out }

class HomeController extends GetxController {
  TextEditingController qrContentEditingController = TextEditingController();
  PointingService pointingService = PointingService();
  AuthService authService = AuthService();
  RxList<Pointings> pointings = <Pointings>[].obs;

  @override
  onInit() async {
    await getPointings();
    super.onInit();
  }

  Future<void> scanQR() async {
    try {
      String scannedQrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.DEFAULT,
      );
      if(scannedQrCode != "-1"){
        point(scannedQrCode);
      }
    } on PlatformException {}
  }

  void point(String value) async {
    String act = "In";

    var response = await pointingService.point(scannedQr: value, act: act );


    if (response != null) {
      Get.snackbar("PIXIMIND", "pointed successfully");
      getPointings();
    } else {
      Get.snackbar("PIXIMIND", "pointing failed");
    }
  }

  getPointings() async {
    pointings.value = await pointingService.getPointings();
    pointings.value = pointings.value.reversed.toList();
  }
}
