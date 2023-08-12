import 'package:flutter/material.dart';
import 'package:qrlog_frontend/app/data/models/item_select.dart';
import 'package:qrlog_frontend/app/global_widgets/atoms/atom_empty_list.dart';
import 'package:qrlog_frontend/app/global_widgets/atoms/atom_item_card.dart';

class MoleculeDropdownContent extends StatelessWidget {
  final List<ItemSelect> items;
  final void Function(ItemSelect) onTap;

  const MoleculeDropdownContent({
    Key? key,
    required this.items,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return items.isEmpty
        ? const AtomEmptyList()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items.map((item) {
              return AtomItemCard(item: item, onTap: onTap);
            }).toList(),
          );
  }
}
