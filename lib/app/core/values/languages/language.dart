import 'package:get/get.dart';
import 'package:qrlog_frontend/app/core/values/languages/base_language.dart';
import 'package:qrlog_frontend/app/core/values/languages/image_language.dart';
import 'package:qrlog_frontend/app/core/values/languages/translations/de.dart';
import 'package:qrlog_frontend/app/core/values/languages/translations/en.dart';
import 'package:qrlog_frontend/app/core/values/languages/translations/fr.dart';

class Language extends Translations {
  final BaseLanguage fr = FrLanguage();
  final BaseLanguage en = EnLanguage();
  final BaseLanguage de = DeLanguage();
  static final List<ImageLanguage> list = [
    ImageLanguage(code: "fr_FR", path: "assets/lang/fr.png"),
    ImageLanguage(code: "en_EN", path: "assets/lang/en.png"),
    ImageLanguage(code: "de_DE", path: "assets/lang/de.png"),
  ];

  static String? getImage(String code) {
    return list.firstWhereOrNull((element) => element.code == code)?.path;
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'fr_FR': fr.toJson(),
        'en_EN': en.toJson(),
        'de_DE': de.toJson(),
      };
}
