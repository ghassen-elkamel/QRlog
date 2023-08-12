import 'package:qrlog_frontend/app/data/models/entities/customer.dart';

import '../models/entities/appConfig.dart';
import '../providers/api_provider.dart';

class AdminService {
  getUsers() async {
    var response = await ApiProvider().get(
      endpoint: "/v1/user",
    );
    if (response != null) {
      List<Customer> usersLists = [];
      for (var item in response["users"]) {
        usersLists.add(Customer.fromJson(item));
      }

      return usersLists;
    }
  }
  getAppConfig( {withLoadingAlert= true}) async {
    var response = await ApiProvider().get(
      endpoint: "/app-config",
      withLoadingAlert: withLoadingAlert
    );
    if(response != null){
      return AppConfig.fromJson(response);
    }
    return null;

  }
  updateUser(Customer customer, userId) async {
    var response = await ApiProvider().put(
      endpoint: "/v1/user/$userId",
      body: customer.toJson(),
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  updateAppConfig(AppConfig appConfig) async {
    var response = await ApiProvider().put(
      endpoint: "/app-config",
      body: appConfig.toJson(),
    );
    if(response != null) {
      return AppConfig.fromJson(response);
    }else {
      return "app config isn't updated";
    }
  }

  deleteUser({required String id}) async {
    var response = await ApiProvider().delete(
      endpoint: "/v1/user/$id",
    );
    return response;
  }
}
