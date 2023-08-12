import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:switcher/core/switcher_size.dart';
import 'package:switcher/switcher.dart';

import '../../../core/utils/helpers.dart';
import '../../../data/models/entities/customer.dart';
import '../../../global_widgets/templates/app_scaffold.dart';
import '../controllers/user_controller.dart';

class UserView extends GetView<UserController> {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        appBarTitle: 'USERS',
        style: TextStyle(
            fontSize: getAdaptiveValue(context, isSmall: 20, isLarge: 30),
            color: Colors.black),
        body: Obx((){
          if(controller.isLoading.isTrue){
           return const Center(child: CircularProgressIndicator());
          }
            return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              const SizedBox(height: 100),
              const SizedBox(
                height: 40,
              ),
              Switcher(
                value:  controller.config!.remote,
                size: SwitcherSize.large,
                switcherButtonRadius: 50,
                enabledSwitcherButtonRotate: true,
                iconOff: Icons.lock_open,
                iconOn: Icons.lock,
                colorOff: Colors.blueGrey.withOpacity(0.3),
                colorOn: Colors.blue,
                onChanged: (bool state) {
                  controller.remote.value = state;
                  controller.updateAppconfig(controller.remote.value);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(child: Obx(() {
                return ListView.builder(
                  itemCount: controller.user.value.length,
                  itemBuilder: (context, index) {
                    Customer user = controller.user[index];
                    return Card(
                       child: InkWell(
                        onTap: () {
                          Get.toNamed('/user-profile', arguments: user);
                        },
                        child: ListTile(
                          title: Text(
                            "${user.firstName} ${user.lastName}",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(user.remote == "Active" ? "( Work remotely )" : ""),
                          trailing: Wrap(
                            children: [
                              IconButton(
                                onPressed: () async {
                                  Customer currentUser = controller.user[index];
                                  await controller.updateUser(currentUser, currentUser.status, currentUser.remote == 'Active' ? 'Blocked' : 'Active');
                                  controller.getAllUsers();
                                },
                                icon: user.remote == 'Active'
                                    ? const Icon(Icons.fingerprint, color: Colors.green)
                                    : const Icon(Icons.fingerprint, color: Colors.red),
                              ),
                              IconButton(
                                onPressed: () async {
                                  Customer currentUser = controller.user[index];
                                  await controller.updateUser(currentUser, currentUser.status == 'Active' ? 'Blocked' : 'Active', currentUser.remote);
                                  controller.getAllUsers();
                                },
                                icon: user.status == 'Active'
                                    ? const Icon(Icons.gpp_good, color: Colors.green)
                                    : const Icon(Icons.gpp_bad, color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }))
            ]);
          }
        ));
  }
}
