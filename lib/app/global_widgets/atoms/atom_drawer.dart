import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qrlog_frontend/app/core/utils/helpers.dart';
import 'package:qrlog_frontend/app/data/services/auth_service.dart';
import 'package:qrlog_frontend/app/global_widgets/atoms/atom_menu_item.dart';
import 'package:qrlog_frontend/app/routes/app_pages.dart';

class AtomDrawer extends StatelessWidget {
  const AtomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 16.0,
      child: Padding(
        padding: const EdgeInsets.only(top: 21),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 4.0),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: SvgPicture.asset(
                      'assets/icons/menu_icons/close_menu.svg'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 2.0),
              child: Image.asset(
                "assets/images/application_logo.png",
                height: 80,
              ),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  const SizedBox(
                    height: 40.0,
                  ),
                  AtomMenuItem(
                    label: 'Home',
                    icon: Icons.home,
                    onTap: () => Get.offAllNamed(Routes.HOME),
                  ),
                  !isMobile(context)
                      ? AtomMenuItem(
                          label: 'get QR Code'.tr,
                          icon: Icons.qr_code_2,
                          onTap: () => Get.offAllNamed(Routes.SCAN))
                      : Container(),
                  if (AuthService.access?.role == 'Admin')
                    AtomMenuItem(
                      label: 'users'.tr,
                      icon: Icons.people,
                      onTap: () => Get.offAllNamed(Routes.USER),
                    ),
                  if (AuthService.access?.role == 'Admin')
                    AtomMenuItem(
                      label: 'users pointings'.tr,
                      icon: Icons.history,
                      onTap: () =>
                          Get.offAllNamed(Routes.USERS_POINTING_HISTORY),
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 19.0),
                        child: TextButton.icon(
                            onPressed: () {
                              AuthService().logout();
                              Get.offAllNamed("/login");
                            },
                            icon: const Icon(Icons.exit_to_app,
                                color: Colors.red),
                            label: const Text('logout',
                                style: TextStyle(
                                  color: Colors.red,
                                ))),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
