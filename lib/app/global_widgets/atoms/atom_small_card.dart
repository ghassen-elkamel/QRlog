import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/models/entities/pointings.dart';

class AtomSmallCard extends StatelessWidget {
  const AtomSmallCard({
    Key? key,
    required this.pointings,
    required this.withname,
  }) : super(key: key);

  final Pointings pointings;
  final bool withname;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          pointings.date.toUtc().toString().substring(0, 10),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          withname == true
              ? "${pointings.date.toUtc().toString().substring(10, 19)},   (${pointings.user?.firstName} ${pointings.user?.lastName})"
              : pointings.date.toUtc().toString().substring(10, 19),
        ),
        trailing: Text(pointings.action == "In" ? "entrée" : "sortie",
            textScaleFactor: 1.5,
            style: TextStyle(
                color: pointings.action == 'In' ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
