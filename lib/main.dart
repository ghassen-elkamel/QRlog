import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:qrlog_frontend/app/core/utils/constant.dart';
import 'package:qrlog_frontend/app/core/values/languages/language.dart';
import 'package:qrlog_frontend/app/data/providers/storage_provider.dart';

import 'app/data/services/auth_service.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  StorageHelper storage = StorageHelper();
  String? locale = await storage.fetchItem(storageLocale);
  AuthService authService = AuthService();
  await authService.isLoggedIn();
  runApp(
    GetMaterialApp(
      title: "QR Log",
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.noTransition,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      translations: Language(),
      locale: Locale(locale ?? "fr_FR"),
      builder: EasyLoading.init(),
    ),
  );
}
