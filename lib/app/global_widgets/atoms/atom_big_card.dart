import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/models/entities/pointings.dart';

class AtomBigCard extends StatelessWidget {
  const AtomBigCard({
    Key? key,
    required this.withname,
    required this.pointings,
  }) : super(key: key);

  final bool withname;
  final Pointings pointings;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: withname == true
            ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("${pointings.user?.matriculation}"),
                Text(
                    "${pointings.user?.firstName}  ${pointings.user?.lastName}"),
                Text(
                    "${pointings.date.toUtc().day}/${pointings.date.toUtc().month}/${pointings.date.toUtc().year}   ${pointings.date.toUtc().hour}:${pointings.date.toUtc().minute}"),
                Text((pointings.action == 'In') || (pointings.action == 'Out Break') ? "entrée" : "sortie",
                    textScaleFactor: 2,
                    style: TextStyle(
                        color: (pointings.action == 'In') || (pointings.action == 'Out Break')
                            ? Colors.green
                            : Colors.red,
                        fontWeight: FontWeight.bold)),
                Text("e/s calculé"),
                Text("${pointings.validity == true ? "valide" : "non valide"}"),
                Text("Horaire"),
                Text("département"),
              ])
            : Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text((pointings.date.toUtc().toString().substring(10, 19))),
                Text(pointings.date.toUtc().toString().substring(0, 10)),
                Text((pointings.action == 'In') || (pointings.action == 'Out Break') ? "entrée" : "sortie",
                    textScaleFactor: 2,
                    style: TextStyle(
                        color: (pointings.action == 'In') || (pointings.action == 'Out Break')
                            ? Colors.green
                            : Colors.red,
                        fontWeight: FontWeight.bold)),
              ]),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }
}
