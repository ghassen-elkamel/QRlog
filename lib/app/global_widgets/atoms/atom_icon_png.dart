import 'package:flutter/material.dart';
import 'package:qrlog_frontend/app/core/values/colors.dart';

class AtomIconPng extends StatelessWidget {
  final String icon;
  final double size;
  final double padding;
  final bool withBorder;
  final Color backGroundColor;

  const AtomIconPng({
    Key? key,
    required this.icon,
    this.size = 48,
    this.padding = 0,
    this.withBorder = true,
    this.backGroundColor = primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget body = Center(
        child: Padding(
      padding: EdgeInsets.all(padding),
      child: Image.asset(
        icon,
        height: size,
        width: size,
      ),
    ));
    return !withBorder
        ? body
        : DecoratedBox(
            decoration: BoxDecoration(
              color: backGroundColor,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10)),
            ),
            child: body);
  }
}
