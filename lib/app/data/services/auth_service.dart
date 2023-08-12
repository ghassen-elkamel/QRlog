import 'package:get/get.dart';
import 'package:qrlog_frontend/app/core/utils/constant.dart';
import 'package:qrlog_frontend/app/core/utils/helpers.dart';
import 'package:qrlog_frontend/app/data/models/entities/customer.dart';
import 'package:qrlog_frontend/app/data/providers/api_provider.dart';
import 'package:qrlog_frontend/app/data/providers/storage_provider.dart';
import 'package:qrlog_frontend/app/data/services/customer_service.dart';

import '../../routes/app_pages.dart';
import '../models/access_user.dart';
import '../models/app_auth.dart';
import '../models/entities/appConfig.dart';
import 'admin_service.dart';

class AuthService {
  static bool isAuthenticated = false;
  static Customer? currentUser;
  static AccessUser? access;
  AdminService adminService = AdminService();
  AppConfig? config;
  bool isRemote = false;

  getAppConfig({bool withLoadingAlert = true}) async {
    config =
        await adminService.getAppConfig(withLoadingAlert: withLoadingAlert);
    return config?.remote;
  }

  Future<bool> customerAuth({required AppAuth auth}) async {
    final response = await ApiProvider().post(
        endpoint: "/v1/auth/login",
        encodeBody: false,
        body: auth.toJson(),
        withLoadingAlert: true);

    if (response != null &&
        response["access_token"] != null && response["refresh_token"] != null &&
        response["status"] == "Active") {
      StorageHelper storage = StorageHelper();
      access = AccessUser.fromJson(response);
      storage.saveItem(storageAccessUser, access?.toJson());
      isAuthenticated = true;
    }
    return isAuthenticated;
  }

  Future<bool> refreshToken() async {
    StorageHelper storage = StorageHelper();
    final response = await ApiProvider().get(
      endpoint: "/v1/auth/refresh",
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${access!.refreshToken}'
      }
    );
    if (response != null && response["access_token"] != null && response["refresh_token"] != null) {
      access = AccessUser.fromJson(response);
      storage.saveItem(storageAccessUser, access?.toJson());
      isAuthenticated = true;
      return isAuthenticated;
    }
    return false;
  }

  logout() {
    StorageHelper storage = StorageHelper();
    storage.removeItem(storageAccessUser);
    access = AccessUser();
    isAuthenticated = false;
  }

  Future<bool> isLoggedIn() async {
    StorageHelper storage = StorageHelper();
    access = AccessUser.fromJson(await storage.fetchItem(storageAccessUser));
    isAuthenticated = access?.token != null;
    return isAuthenticated;
  }

  Future<bool> login(String username, String password) async {
    AppAuth auth = AppAuth(
      username: username,
      password: password,
    );

    bool response = await customerAuth(auth: auth);
    return response;
  }

  void signup(Customer user) async {
    var response = await CustomerService().createUser(user);
    if (response != null && response["username"] != null) {
      showAlertDialog(
        title: 'Success',
        subTitle: 'Account created successfully,wait until admin approve',
        onClose: () {
          Get.offNamed(Routes.LOGIN);
        },
      );
    }
  }

  Future<String> getQR() async {
    var response = await ApiProvider().get(
      endpoint: "/v1/qr",
    );

    if (response != null && response["qr_code"] != null) {
      return response["qr_code"];
    }

    return "";
  }
}
