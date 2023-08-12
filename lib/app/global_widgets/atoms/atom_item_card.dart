import 'package:flutter/material.dart';
import 'package:qrlog_frontend/app/data/models/item_select.dart';

import '../../core/theme/text_theme.dart';

class AtomItemCard extends StatelessWidget {
  final ItemSelect item;
  final void Function(ItemSelect value) onTap;

  const AtomItemCard({
    Key? key,
    required this.item,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(item),
      child: SizedBox(
        width: double.infinity,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Text(
              item.label,
              textAlign: TextAlign.center,
              style: styleBlackLightFontRobotoW400Size14,
            ),
          ),
        ),
      ),
    );
  }
}
