import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:qrlog_frontend/app/core/utils/constant.dart';
import 'package:qrlog_frontend/app/core/utils/helpers.dart';
import 'package:qrlog_frontend/app/core/values/colors.dart';
import 'package:qrlog_frontend/app/global_widgets/atoms/atom_circular_button.dart';

import '../../core/theme/text_theme.dart';

class AtomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final TextStyle style;
  final bool centerTitle;
  final bool withCloseIcon;
  final void Function()? onPressedSearch;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final bool withMenu;

  const AtomAppBar({
    Key? key,
    required this.title,
    this.style = styleBlackLightFontRobotoW400Size18,
    this.centerTitle = true,
    this.withCloseIcon = false,
    this.scaffoldKey,
    this.onPressedSearch,
    this.withMenu = false,
  }) : super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      automaticallyImplyLeading: false,
      toolbarHeight: appBarHeight,
      actions: [
        const Padding(
          padding: EdgeInsets.all(16.0),
        ),
        if (withCloseIcon && isMobile(context))
          IconButton(
            icon: SvgPicture.asset('assets/icons/menu_icons/close_menu.svg'),
            onPressed: () {
              Get.back();
            },
          ),
      ],
      leading: !withMenu ? null : Padding(
        padding: const EdgeInsets.all(16.0),
        child: CircularButton(
          onPressed: () => scaffoldKey?.currentState?.openDrawer(),
          icon: "assets/icons/menu_icon.svg",
          backgroundColor: primaryColor,
          iconColor: white,
          tag: "btn1",
        ),
      ),
      leadingWidth: 90,
      backgroundColor: grey,
      title: Text(
        title,
        style: style,
      ),
      centerTitle: centerTitle,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, appBarHeight);
}
