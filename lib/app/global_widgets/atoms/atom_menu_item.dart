import 'package:flutter/material.dart';
import 'package:qrlog_frontend/app/core/values/colors.dart';

import '../../core/theme/text_theme.dart';

class AtomMenuItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final void Function()? onTap;

  const AtomMenuItem({Key? key, required this.label, required this.icon, this.onTap, this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: isSelected ? grey60 : primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Icon(icon, color: isSelected ? primaryColor : white, size: isSelected ? 30 : 25,),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Hero(
                        tag: label,
                        child: Text(
                          label,
                          style: isSelected ? stylePrimaryColorFontBebasW400Size24 : styleWhiteFontRobotoW500Size16,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}