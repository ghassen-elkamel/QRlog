import 'package:flutter/material.dart';
import 'package:qrlog_frontend/app/core/utils/helpers.dart';

import '../../data/models/entities/pointings.dart';
import '../atoms/atom_big_card.dart';
import '../atoms/atom_small_card.dart';

class MoleculeListViewBuilder extends StatelessWidget {
  final int length;
  final pointingHistory;
  final bool withname;

  const MoleculeListViewBuilder({
    required this.length,
    required this.pointingHistory,
    this.withname = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: length,
      itemBuilder: (context, index) {
        Pointings pointings = pointingHistory[index];
        return isMobile(context)
            ? AtomSmallCard(pointings: pointings, withname: withname)
            : AtomBigCard(withname: withname, pointings: pointings);
      },
    ));
  }
}
