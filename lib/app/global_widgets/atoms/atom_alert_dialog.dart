import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:qrlog_frontend/app/core/values/colors.dart';

import '../../core/theme/text_theme.dart';

class AtomAlertDialog extends StatelessWidget {
  final String? iconSvg;
  final String? title;
  final TextStyle? titleStyle;
  final String? subTitle;
  final TextAlign? subTitleAlign;
  final Widget? content;
  final Function()? onClose;
  final List<Widget> actions;

  const AtomAlertDialog({
    Key? key,
    this.iconSvg,
    this.title,
    this.titleStyle,
    this.subTitle,
    this.subTitleAlign,
    this.content,
    this.actions = const [],
    this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 6,
              ),
              child: MaterialButton(
                onPressed: () {
                  Get.back();
                  if (onClose != null) {
                    onClose!.call();
                  }
                },
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(7),
                color: white,
                child: const Icon(
                  Icons.clear,
                  size: 25,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: DecoratedBox(
                decoration: const BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (title != null)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 16.0,
                            ),
                            child: Text(
                              title!,
                              style: titleStyle ?? styleW500Size18,
                            ),
                          ),
                        if (iconSvg != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: SvgPicture.asset(
                              iconSvg!,
                            ),
                          ),
                        if (subTitle != null)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 2),
                            child: Text(
                              subTitle!,
                              style: styleBlackLightFontRobotoW400Size16,
                              textAlign: subTitleAlign ?? TextAlign.center,
                            ),
                          ),
                        if (content != null)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 2),
                            child: content,
                          ),
                        ...actions
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
