import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qrlog_frontend/app/core/values/colors.dart';

class AtomProgressiveBar extends StatelessWidget {
  final bool isCompleted;
  final double value;

  const AtomProgressiveBar({
    Key? key,
    this.isCompleted = false,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        DecoratedBox(
          decoration: BoxDecoration(
              color: secondColor, borderRadius: BorderRadius.circular(16)),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 16,
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(16)),
          child: SizedBox(
            child: Center(
              child: (value == 1)
                  ? SvgPicture.asset(
                      "assets/icons/check_icon.svg",
                    )
                  : const SizedBox(),
            ),
            width: MediaQuery.of(context).size.width * value,
            height: 16,
          ),
        )
      ],
    );
  }
}
