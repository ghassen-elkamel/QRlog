import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/helpers.dart';
import '../../../global_widgets/molecules/molecule_listview_builder.dart';
import '../../../routes/app_pages.dart';
import '../controllers/user_profile_controller.dart';

class UserProfileView extends GetView<UserProfileController> {
  const UserProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Profile',
          style: TextStyle(
              fontSize: getAdaptiveValue(context, isSmall: 20, isLarge: 30),
              color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.edit,
            ),
            onPressed: () async {
              dynamic result = (await Get.toNamed(Routes.EDIT_USER,
                  arguments: controller.user.value));
              if (result != null) {
                controller.user.value = result;
              }
            },
          ),
        ],
      ),
      body: Obx(() {
        return Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 50,
              backgroundImage: AssetImage('assets/images/user.png'),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(controller.user.value?.firstName ?? '',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 10,
            ),
            Text(controller.user.value?.role ?? '',
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 70),
            const Text("pointing history",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 20,
            ),
            Obx(() {
              return MoleculeListViewBuilder(
                  length: controller.pointings.value.length,
                  pointingHistory: controller.pointings.value);
            }),
          ],
        );
      }),
    );
  }
}
