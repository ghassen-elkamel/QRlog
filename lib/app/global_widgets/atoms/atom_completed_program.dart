import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qrlog_frontend/app/core/utils/helpers.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/theme/text_theme.dart';

class AtomCompletedProgram extends StatelessWidget {
  const AtomCompletedProgram({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: 16.0,
              bottom: isMobile(context) ? 0.0 : 16.0,
              right: 16.0,
              top: isMobile(context) ? 0.0 : 16.0),
          child: Image.asset("assets/icons/check.png"),
        ),
        Text(
          "program-finished".tr,
          style: styleWhiteFontRobotoW500Size16,
        ),
        Padding(
          padding: EdgeInsets.all(isMobile(context) ? 0.0 : 4.0),
          child: Text(
            "please-collect-your-laundry".tr,
            style: styleWhiteFontRobotoW400Size16,
          ),
        ),
        SizedBox(
          height: isMobile(context) ? 0.0 : 4.0,
        ),
        Padding(
          padding: EdgeInsets.all(isMobile(context) ? 0.0 : 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                5,
                (index) => Padding(
                      padding: EdgeInsets.only(
                          top: isMobile(context) ? 0.0 : 3.0,
                          right: 3.0,
                          left: 3.0,
                          bottom: isMobile(context) ? 0.0 : 3.0),
                      child: SvgPicture.asset("assets/icons/star.svg"),
                    )),
          ),
        ),
        TextButton(
          onPressed: () async {
            String googleUrl = "";
            if (Platform.isAndroid) {
              googleUrl =
                  'https://www.google.com/maps/search/?api=1&query=Golf ParisLongchamp';
            } else {
              googleUrl = 'https://g.page/Golf ParisLongchamp/review';
            }
            await launch(googleUrl);
          },
          child: Text(
            "rate-the-service".tr,
            style: styleWhiteFontRobotoW400Size14,
          ),
        ),
      ],
    );
  }
}
