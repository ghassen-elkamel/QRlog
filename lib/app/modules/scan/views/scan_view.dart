import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../core/utils/helpers.dart';
import '../../../global_widgets/templates/app_scaffold.dart';
import '../controllers/scan_controller.dart';

class ScanView extends GetView<ScanController> {
  const ScanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: 'Qr Scan',
      style: TextStyle(
          fontSize: getAdaptiveValue(context, isSmall: 20, isLarge: 30),
          color: Colors.black),
      withMenu: true,
      body: Center(
          child: Obx((){
            if(controller.qrCode.value == null ){
              return SingleChildScrollView();
            }
              return Column(
                children: [
                  QrImage(
                    data: controller.qrCode.value!,
                    size: 400.0,
                  ),
                ],
              );
            }
          )
      ),
    );
  }
}
