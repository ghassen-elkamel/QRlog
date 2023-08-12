import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrlog_frontend/app/core/utils/helpers.dart';
import 'package:qrlog_frontend/app/global_widgets/atoms/atom_button.dart';

import '../../../global_widgets/molecules/molecule_listview_builder.dart';
import '../../../global_widgets/templates/app_scaffold.dart';
import '../controllers/users_pointing_history_controller.dart';

class UsersPointingHistoryView extends GetView<UsersPointingHistoryController> {
  const UsersPointingHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        withMenu: true,
        appBarTitle: 'users pointing history',
        style: TextStyle(
            fontSize: getAdaptiveValue(context, isSmall: 20, isLarge: 30),
            color: Colors.black),
        body: !isMobile(context)
            ? Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(
                              onPressed: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2025),
                                  confirmText: 'Confirm',
                                  cancelText: 'Cancel',
                                ).then((value) {
                                  controller.beginText.value =
                                      value!.toString().substring(0, 10);
                                  controller.beginDate.value = value;
                                  return controller.onInit();
                                });
                              },
                              child: Obx(() =>
                                  Text("from: ${controller.beginText.value}")),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2025),
                                confirmText: 'Confirm',
                                cancelText: 'Cancel',
                              ).then((value) {
                                controller.endText.value =
                                    value!.toString().substring(0, 10);
                                controller.endDate.value = value;
                                return controller.onInit();
                              });
                            },
                            child: Obx(
                                () => Text("to :${controller.endText.value}")),
                          )
                        ]),
                        Row(children: [
                          AtomButton(
                            label: "download pointing history",
                            onPressed: () async {
                              controller.downloadDataBase();
                            },
                            isSmall: true,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AtomButton(
                              label: "download pointing history per user",
                              onPressed: () async {
                                controller.downloadDataBasePerUser();
                              },
                              isSmall: true,
                            ),
                          ),
                        ]),
                      ]),
                  const SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('matriculation', style: TextStyle(fontSize: 20)),
                        Text('nom', style: TextStyle(fontSize: 20)),
                        Text('date', style: TextStyle(fontSize: 20)),
                        Text('action', style: TextStyle(fontSize: 20)),
                        Text('e/s calculé', style: TextStyle(fontSize: 20)),
                        Text('validité', style: TextStyle(fontSize: 20)),
                        Text("horaire ", style: TextStyle(fontSize: 20)),
                        Text("Departement", style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                  Obx(() {
                    return MoleculeListViewBuilder(
                        length: controller.pointings.value.length,
                        pointingHistory: controller.pointings.value,
                        withname: true);
                  }),
                ],
              )
            : Column(children: [
                TextButton(
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2025),
                      confirmText: 'Confirm',
                      cancelText: 'Cancel',
                    ).then((value) {
                      controller.beginText.value =
                          value!.toString().substring(0, 10);
                      controller.beginDate.value = value;
                      return controller.onInit();
                    });
                  },
                  child: Obx(() => Text("from: ${controller.beginText.value}")),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2025),
                      confirmText: 'Confirm',
                      cancelText: 'Cancel',
                    ).then((value) {
                      controller.endText.value =
                          value!.toString().substring(0, 10);
                      controller.endDate.value = value;
                      return controller.onInit();
                    });
                  },
                  child: Obx(() => Text("to :${controller.endText.value}")),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(() {
                  return MoleculeListViewBuilder(
                      length: controller.pointings.value.length,
                      pointingHistory: controller.pointings.value,
                      withname: true);
                })
              ]));
  }
}
