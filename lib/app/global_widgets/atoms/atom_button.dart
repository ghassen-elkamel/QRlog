import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qrlog_frontend/app/core/utils/helpers.dart';
import 'package:qrlog_frontend/app/core/values/colors.dart';
import 'package:qrlog_frontend/app/data/enums/button_type.dart';

import '../../core/theme/text_theme.dart';

class AtomButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final ButtonColor buttonColor;
  final Color? textColor;
  final bool isSmall;
  final bool withForwardIcon;
  final bool withForwardIconSvg;
  final bool withBackIcon;
  final bool withBackIconSvg;
  final bool withPlusIcon;
  final bool blueBorder;
  final String forwardIconSvgPath;
  final IconData forwardIconData;
  final String backIconSvgPath;
  final IconData backIconData;

  const AtomButton({
    Key? key,
    required this.label,
    this.buttonColor = ButtonColor.blue,
    this.blueBorder = false,
    this.onPressed,
    this.isSmall = false,
    this.withForwardIcon = false,
    this.withBackIcon = false,
    this.withPlusIcon = false,
    this.textColor,
    this.forwardIconSvgPath = "",
    this.withForwardIconSvg = false,
    this.forwardIconData = Icons.add,
    this.backIconSvgPath = "",
    this.backIconData = Icons.add,
    this.withBackIconSvg = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(10),
            minimumSize: MaterialStateProperty.all(
                isSmall ? const Size(130, 51) : const Size.fromHeight(51)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
                side: BorderSide(
                    color: blueBorder ? primaryColor : Colors.transparent))),
            textStyle: MaterialStateProperty.all(styleFontBebasW400Size18),
            shadowColor: MaterialStateProperty.all(white15),
            foregroundColor:
                MaterialStateProperty.all(getOnPressedColor(buttonColor)),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return getOnPressedColor(buttonColor);
              } else if (states.contains(MaterialState.disabled)) {
                return grey15;
              }
              return getButtonColor(buttonColor);
            })),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: isMobile(context) ? 8.0 : 30.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (withPlusIcon) SvgPicture.asset('assets/icons/plus_icon.svg'),
              if (withBackIconSvg)
                SvgPicture.asset(backIconSvgPath),
              if (withBackIcon)
                Icon(backIconData, color: getLabelColor(buttonColor)),
              Padding(
                padding: EdgeInsets.only(
                    left: withBackIcon || withPlusIcon ? 10.0 : 0.0,
                    right: withForwardIcon ? 10.0 : 0.0),
                child: Text(label,
                    style: TextStyle(color: getLabelColor(buttonColor))),
              ),
              if (withForwardIconSvg)
                SvgPicture.asset(forwardIconSvgPath),
              if(withForwardIcon)
                Icon(forwardIconData)
            ],
          ),
        ));
  }

  getOnPressedColor(ButtonColor buttonColor) {
    switch (buttonColor) {
      case ButtonColor.blue:
        return primaryColor.withOpacity(0.7);
      case ButtonColor.white:
        return black.withOpacity(0.005);
      case ButtonColor.orange:
        return thirdColor.withOpacity(0.7);
      case ButtonColor.grey15:
        return white.withOpacity(0.7);
    }
  }

  getLabelColor(ButtonColor buttonColor) {
    if (onPressed == null) {
      return white20;
    }

    if (textColor != null) {
      return textColor;
    }
    switch (buttonColor) {
      case ButtonColor.white:
        return primaryColor;

      case ButtonColor.orange:
        return white;

      case ButtonColor.blue:
        return white;

      case ButtonColor.grey15:
        return white;
    }
  }

  getButtonColor(ButtonColor buttonColor) {
    if (onPressed == null) {
      return white10;
    }

    switch (buttonColor) {
      case ButtonColor.white:
        return white;

      case ButtonColor.orange:
        return thirdColor;

      case ButtonColor.blue:
        return primaryColor;

      case ButtonColor.grey15:
        return grey15;
    }
  }
}
