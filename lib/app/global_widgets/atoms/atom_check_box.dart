import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:qrlog_frontend/app/core/theme/text_theme.dart';
import 'package:qrlog_frontend/app/core/values/colors.dart';

class AtomCheckBox extends StatelessWidget {
  final bool value;
  final void Function(bool?)? onChanged;
  final String checkBoxText;
  final String clickableCheckBoxText;
  final void Function()? onTextClick;
  final bool isWhite;

  const AtomCheckBox(
      {Key? key,
      this.value = false,
      required this.onChanged,
      required this.checkBoxText,
      this.clickableCheckBoxText = '',
      this.onTextClick,
      this.isWhite = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 6.0),
          child: SizedBox.square(
            dimension: 24,
            child: Checkbox(
              value: value,
              onChanged: onChanged,
              side: const BorderSide(color: primaryColor, width: 2.0),
              activeColor: primaryColor,
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: checkBoxText + ' ',
                  style: isWhite
                      ? styleWhiteFontRobotoW400Size16
                      : styleBlackLightFontRobotoW400Size16,
                ),
                TextSpan(
                  text: clickableCheckBoxText,
                  style: stylePrimaryColorFontRobotoW400Size16Underline,
                  recognizer: TapGestureRecognizer()..onTap = onTextClick,
                ),
                if (clickableCheckBoxText.isNotEmpty)
                  TextSpan(
                    text: "*",
                    style: stylePrimaryColorFontRobotoW400Size16,
                    recognizer: TapGestureRecognizer()..onTap = onTextClick,
                  ),
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
