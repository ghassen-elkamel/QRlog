import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qrlog_frontend/app/core/values/colors.dart';
import 'package:qrlog_frontend/app/global_widgets/atoms/atom_spinner_progress_indicator.dart';

import '../../core/theme/text_theme.dart';

class AtomCardInfo extends StatelessWidget {
  final String? icon;
  final String text;
  final bool withAnimatedIcon;

  const AtomCardInfo(
      {Key? key, this.icon, required this.text, this.withAnimatedIcon = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: white, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (withAnimatedIcon) const AtomSpinnerProgressIndicator(),
                if (!withAnimatedIcon && icon != null) SvgPicture.asset(icon!),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    text.tr,
                    textAlign: TextAlign.center,
                    style: styleBlackLightFontRobotoW400Size16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
