import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';
import '../../../data/services/auth_service.dart';
import '../../../routes/app_pages.dart';

class AuthGuard extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (AuthService.isAuthenticated) {
      return route == "/"
          ? const RouteSettings(name: Routes.SPLACHSCREEN)
          : null;
    }
    return const RouteSettings(name: Routes.LOGIN);
  }
}
