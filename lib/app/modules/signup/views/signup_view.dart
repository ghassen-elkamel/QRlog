import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrlog_frontend/app/global_widgets/atoms/atom_button.dart';

import '../../../core/utils/helpers.dart';
import '../../../core/values/keys.dart';
import '../../../global_widgets/atoms/atom_text_field.dart';
import '../../../global_widgets/templates/app_scaffold.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        body: SingleChildScrollView(
            child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.lightGreen])),
      child: Column(children: [
        Column(children: [
          const SizedBox(
            height: 50,
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 0),
            constraints: const BoxConstraints(
              maxWidth: 350,
            ),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                )),
            child: Form(
                key: Keys.globalKeySignup,
                child: Column(children: [
                  SizedBox(
                    height: getAdaptiveValue(context, isSmall: 10, isLarge: 10),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(left: 20, top: 10),
                    child: const Text(
                      'Signup',
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.black,
                          letterSpacing: 2,
                          fontFamily: "Lobster",
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: getAdaptiveValue(context, isSmall: 50, isLarge: 10),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: AtomTextField(
                      controller: controller.firstName,
                      maxLines: 1,
                      textColor: Colors.black87,
                      hintText: 'Username',
                      textInputType: TextInputType.text,
                      isRequired: true,
                      withBorder: true,
                    ),
                  ),
                  SizedBox(
                    height: getAdaptiveValue(context, isSmall: 5, isLarge: 20),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: AtomTextField(
                      controller: controller.lastName,
                      maxLines: 1,
                      textColor: Colors.black87,
                      hintText: 'lastName',
                      textInputType: TextInputType.text,
                      isRequired: true,
                      withBorder: true,
                    ),
                  ),
                  SizedBox(
                    height: getAdaptiveValue(context, isSmall: 5, isLarge: 20),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: AtomTextField(
                      controller: controller.userName,
                      maxLines: 1,
                      textColor: Colors.black87,
                      hintText: 'userName',
                      textInputType: TextInputType.text,
                      isRequired: true,
                      withBorder: true,
                    ),
                  ),
                  SizedBox(
                    height: getAdaptiveValue(context, isSmall: 5, isLarge: 20),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: AtomTextField(
                      controller: controller.password,
                      maxLines: 1,
                      textColor: Colors.black87,
                      hintText: 'Password',
                      textInputType: TextInputType.text,
                      isRequired: true,
                      isObscureText: true,
                      withBorder: true,
                    ),
                  ),
                  SizedBox(
                    height: getAdaptiveValue(context, isSmall: 5, isLarge: 20),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: AtomTextField(
                      controller: controller.email,
                      maxLines: 1,
                      textColor: Colors.black87,
                      hintText: 'email',
                      textInputType: TextInputType.text,
                      isRequired: true,
                      withBorder: true,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AtomButton(
                      label: "Submit",
                      isSmall: true,
                      onPressed: () {
                        controller.signup();
                      }),
                  SizedBox(
                    height: getAdaptiveValue(context, isSmall: 20, isLarge: 50),
                  ),
                ])),
          ),
        ]),
      ]),
    )));
  }
}
