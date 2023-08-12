import 'package:get/get.dart';

class FormValidator {
  static FormValidator? _instance;

  FormValidator._internal();

  factory FormValidator() {
    _instance ??= FormValidator._internal();
    return _instance!;
  }

  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9\-]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return "enter-valid-email".tr;
    } else if (!regExp.hasMatch(value)) {
      return "please-enter-a-valid-email".tr;
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    String pattern = r'^\+{0,1}[0-9}]{9,15}$';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return "enter-valid-mobile-number".tr;
    } else if (!regExp.hasMatch(value)) {
      return "please-enter-a-valid-mobile-number".tr;
    }
    return null;
  }
}
