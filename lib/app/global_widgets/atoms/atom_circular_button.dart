import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qrlog_frontend/app/core/values/colors.dart';

class CircularButton extends StatelessWidget {
  final void Function()? onPressed;
  final String icon;
  final String tag;
  final double height;
  final Color? iconColor;
  final Color backgroundColor;

  const CircularButton(
      {Key? key,
      required this.onPressed,
      required this.icon,
      required this.tag,
      this.height = 51, this.iconColor, this.backgroundColor = white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 51,
      child: FloatingActionButton(
        heroTag: tag,
        onPressed: onPressed,
        elevation: 8,
        backgroundColor: backgroundColor,
        child: SvgPicture.asset(icon, color: iconColor),
      ),
    );
  }
}
