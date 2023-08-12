import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrlog_frontend/app/core/values/colors.dart';
import 'package:qrlog_frontend/app/data/enums/button_type.dart';
import 'package:qrlog_frontend/app/global_widgets/atoms/atom_button.dart';
import 'package:qrlog_frontend/app/global_widgets/molecules/molecule_listview_builder.dart';

import '../../../core/utils/helpers.dart';
import '../../../global_widgets/templates/app_scaffold.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        appBarTitle: isMobile(context) ? 'HOME' : "Your History",
        style: TextStyle(
            fontSize: getAdaptiveValue(context, isSmall: 30, isLarge: 30),
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
            color: primaryColor),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getAdaptiveValue(context, isSmall: 65, isLarge: 0),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 6.0),
                child: Text(isMobile(context) ? " YOUR HISTORY" : "",
                    style: const TextStyle(
                        color: primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ),
              Obx(() {
                return MoleculeListViewBuilder(
                    length: controller.pointings.value.length,
                    pointingHistory: controller.pointings.value);
              }),
              SizedBox(
                  height: getAdaptiveValue(context, isSmall: 40, isLarge: 40)),
              Center(
                  child: isMobile(context)
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 18.0),
                          child: AtomButton(
                            label: "Scan QR",
                            withBackIcon: true,
                            buttonColor: ButtonColor.blue,
                            isSmall: true,
                            backIconData: Icons.fingerprint,
                            textColor: Colors.white,
                            onPressed: () => controller.scanQR(),
                          ),
                        )
                      : null),
            ]));
  }
}
