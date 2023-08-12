import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrlog_frontend/app/global_widgets/atoms/atom_button.dart';
import 'package:qrlog_frontend/app/global_widgets/atoms/atom_text_field.dart';

import '../../../core/utils/helpers.dart';
import '../../../core/values/keys.dart';
import '../controllers/edit_user_controller.dart';

class EditUserView extends GetView<EditUserController> {
  const EditUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'EditUserView',
          style: TextStyle(
              fontSize: getAdaptiveValue(context, isSmall: 20, isLarge: 30),
              color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
          child: Form(
              key: Keys.globalKeyEditUser,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: AtomTextField(
                    controller: controller.firstname,
                    hintText: controller.user.firstName,
                    textColor: Colors.black,
                    withBorder: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 40.0, right: 40.0, top: 20.0, bottom: 20.0),
                  child: AtomTextField(
                    controller: controller.lastname,
                    hintText: controller.user.lastName,
                    textColor: Colors.black,
                    withBorder: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 40.0, right: 40.0, top: 20.0, bottom: 20.0),
                  child: AtomTextField(
                    controller: controller.username,
                    hintText: "uersname",
                    textColor: Colors.black,
                    withBorder: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 40.0, right: 40.0, top: 20.0, bottom: 20.0),
                  child: AtomTextField(
                    controller: controller.email,
                    hintText: 'email',
                    textColor: Colors.black,
                    withBorder: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 40.0, right: 40.0, top: 20.0, bottom: 20.0),
                  child: AtomTextField(
                    controller: controller.matriculation,
                    hintText: controller.user.matriculation ?? 'matriculation',
                    textColor: Colors.black,
                    withBorder: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 40.0, right: 40.0, top: 20.0, bottom: 20.0),
                  child: AtomButton(
                    isSmall: true,
                    onPressed: () {
                      controller.updateUser();
                    },
                    label: 'Save',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 40.0, right: 40.0, top: 20.0, bottom: 20.0),
                  child: TextButton(
                      child: const Text('Delete'),
                      onPressed: () {
                        controller.deleteUser();
                      }),
                ),
              ]))),
    );
  }
}
