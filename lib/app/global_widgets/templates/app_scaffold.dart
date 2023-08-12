import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrlog_frontend/app/core/utils/helpers.dart';
import 'package:qrlog_frontend/app/core/values/colors.dart';
import 'package:qrlog_frontend/app/data/services/auth_service.dart';
import 'package:qrlog_frontend/app/global_widgets/atoms/atom_app_bar.dart';
import 'package:qrlog_frontend/app/global_widgets/atoms/atom_drawer.dart';
import 'package:qrlog_frontend/app/global_widgets/atoms/atom_menu_item.dart';
import 'package:qrlog_frontend/app/routes/app_pages.dart';

import '../../core/theme/text_theme.dart';

class AppScaffold extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final Widget body;
  final bool withMenu;
  final double topPadding;
  final bool withCloseIcon;
  final String? appBarTitle;
  final TextStyle style;
  final bool centerTitle;
  final int? selectedIndex;
  final void Function()? onPressedSearch;

  AppScaffold({
    Key? key,
    required this.body,
    this.withMenu = true,
    this.topPadding = 0,
    this.withCloseIcon = false,
    this.appBarTitle,
    this.style = styleBlackLightFontRobotoW400Size18,
    this.centerTitle = true,
    this.selectedIndex,
    this.onPressedSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (appBarTitle != null && isMobile(context))
          ? AtomAppBar(
              title: appBarTitle!,
              style: style,
              centerTitle: centerTitle,
              onPressedSearch: onPressedSearch,
              withMenu: true,
              scaffoldKey: _scaffoldKey)
          : null,
      key: _scaffoldKey,
      backgroundColor: grey,
      drawer: !withMenu && !isMobile(context) ? null : const AtomDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            if(withMenu && !isMobile(context))
              ColoredBox(
                color: primaryColor,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                      minHeight: 70
                  ),
                  child: Row(
                    children: [
                      AtomMenuItem(
                        label: "Home",
                        icon: Icons.home,
                        onTap:selectedIndex == 0 ? null : () => Get.offAllNamed(Routes.HOME),
                        isSelected: selectedIndex == 0,
                      ),
                      AtomMenuItem(
                        label: 'get QR Code'.tr,
                        icon: Icons.qr_code_2,
                        onTap: selectedIndex == 2 ? null : () => Get.offAllNamed(Routes.SCAN),
                        isSelected: selectedIndex == 2,
                      ),
                        AtomMenuItem(
                          label: 'users pointings'.tr,
                          icon: Icons.history,
                          onTap: selectedIndex == 3 ? null : () => Get.offAllNamed(Routes.USERS_POINTING_HISTORY),
                          isSelected: selectedIndex == 3,
                        ),
                        AtomMenuItem(
                          label: 'users'.tr,
                          icon: Icons.people,
                          onTap: selectedIndex == 1 ? null : () => Get.offAllNamed(Routes.USER),
                          isSelected: selectedIndex == 1,
                        ),
                      const Spacer(),
                      TextButton(
                          onPressed: () {
                            AuthService().logout();
                            Get.offAllNamed(Routes.LOGIN);
                          },
                          child: Column(
                            children: [
                              Text(
                                'logout'.tr,
                                style: styleWhiteFontRobotoW500Size16,
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            if(!isMobile(context) && appBarTitle != null && selectedIndex == null)
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text(
                  appBarTitle!,
                  style: styleSecondColorFontBebasNeueW400Size36,
                ),
              ),
            Expanded(
              child: body,
            ),
          ],
        ),
      ),
    );
  }
}
