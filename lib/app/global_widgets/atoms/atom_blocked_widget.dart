import 'package:flutter/material.dart';
import 'package:qrlog_frontend/app/core/values/colors.dart';

class AtomBlockedWidget extends StatelessWidget {
  final bool isBlocked;
  final Widget child;

  const AtomBlockedWidget(
      {Key? key, required this.child, this.isBlocked = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isBlocked) {
      return child;
    }
    return Stack(
      children: [
        child,
        const Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: white20,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
