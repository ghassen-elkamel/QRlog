import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/values/keys.dart';
import '../../../data/models/entities/customer.dart';
import '../../../data/services/auth_service.dart';
import '../../../data/services/customer_service.dart';

class SignupController extends GetxController {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  CustomerService customerService = CustomerService();

  AuthService authService = AuthService();

  signup() {
    if (Keys.globalKeySignup.currentState!.validate()) {
      authService.signup(Customer(
        firstName: firstName.text,
        lastName: lastName.text,
        password: password.text,
        username: userName.text,
        email: email.text,
        status: "Blocked",
        matriculation: "12",
      ));
    }
  }
}
