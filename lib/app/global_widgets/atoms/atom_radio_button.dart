import 'package:flutter/material.dart';
import 'package:qrlog_frontend/app/core/values/colors.dart';

class AtomRadioButton extends StatelessWidget {
  final bool isSelected;
  final void Function(bool? value)? onChanged;

  const AtomRadioButton({
    Key? key,
    required this.isSelected,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: SizedBox.square(
        dimension: 16,
        child: Radio(
          value: true,
          groupValue: isSelected ? true : null,
          onChanged: onChanged,
          activeColor: primaryColor,
          fillColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            return primaryColor;
          }),
        ),
      ),
    );
  }
}
