import 'package:qrlog_frontend/app/data/models/entities/customer.dart';
import 'package:qrlog_frontend/app/data/providers/api_provider.dart';

class CustomerService {
  Future<Map<String, dynamic>?>? createUser(Customer user) async {
    final response = await ApiProvider().post(
      endpoint: "/v1/auth/register",
      encodeBody: false,
      body: user.toJson(),
    );

    return response;
  }

  getUser(String userid) async {
    var response = await ApiProvider().get(
      endpoint: "/v1/user/$userid",
      queryParam: {"id": userid},
    );
    if (response != null) {
      return Customer.fromJson(response["customer"]);
    }
  }

  Future<Map<String, dynamic>?> updateUser(Customer user) async {
    final response = await ApiProvider().patch(
      endpoint: '/v1/customer/update',
      encodeBody: false,
      body: user.toJson(),
    );
    return response;
  }

  deleteUser() async {
    final response =
        await ApiProvider().delete(endpoint: '/v1/customer/delete');
    return response;
  }
}
