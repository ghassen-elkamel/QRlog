import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrlog_frontend/app/core/utils/helpers.dart';
import 'package:qrlog_frontend/app/data/enums/button_type.dart';
import 'package:qrlog_frontend/app/global_widgets/atoms/atom_button.dart';

import '../../../core/values/keys.dart';
import '../../../global_widgets/atoms/atom_text_field.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  //UserController userController = Get.find<UserController>();
  const LoginView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: context.width,
          height: context.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, Colors.lightGreen])),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: getAdaptiveValue(context, isSmall: 100, isLarge: 20),
              ),
              const Image(
                  image: (AssetImage('assets/icons/logo_piximind.png')),
                  height: 150),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    )),
                margin: const EdgeInsets.only(top: 10),
                constraints: const BoxConstraints(maxWidth: 350),
                child: Form(
                  key: Keys.globalKeyLogin,
                  child: Column(children: [
                    SizedBox(
                      height: getAdaptiveValue(context, isSmall: 50, isLarge: 0),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(left: 20, top: 0),
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.blueGrey,
                            letterSpacing: 2,
                            fontFamily: "Lobster",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        padding:
                            const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.lightGreen,
                                  blurRadius: 1,
                                  offset: Offset(1, 1)),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.face, color: Colors.green),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: AtomTextField(
                                  controller: controller.username,
                                  textColor: Colors.black87,
                                  hintText: 'Username',
                                  textInputType: TextInputType.text,
                                  isRequired: true,
                                ),
                              ),
                            ),
                          ],
                        )),
                    Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        padding:
                            const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.lightGreenAccent, width: 1),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.lightGreen,
                                  blurRadius: 1,
                                  offset: Offset(1, 1)),
                            ],
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.fingerprint, color: Colors.green),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: AtomTextField(
                                  controller: controller.password,
                                  isRequired: true,
                                  hintText: " Password ",
                                  textColor: Colors.black87,
                                  isObscureText: true,
                                ),
                              ),
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),

                      child: AtomButton(
                          label: "LOGIN",
                          buttonColor: ButtonColor.blue,
                          onPressed:
                            controller.login
                        ),

                    ),
                    SizedBox(
                      height: getAdaptiveValue(context, isSmall: 0, isLarge: 0),
                    ),
                    AtomButton(
                        isSmall: true,
                        label: "Sign Up",
                        buttonColor: ButtonColor.white,
                        onPressed: () {
                          Get.toNamed('/signup');
                        }),
                    SizedBox(
                      height: getAdaptiveValue(context, isSmall: 20, isLarge: 50),
                    ),
                  ]),
                ),

              )
            ]),
          ),
        ));
  }
}
