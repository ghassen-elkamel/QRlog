import 'package:intl/intl.dart';

import '../models/entities/pointings.dart';
import '../models/pointing.dart';
import '../providers/api_provider.dart';

class PointingService {
  point({required String act, required String scannedQr  }) async {
    Pointing pointing = Pointing(action: act, scannedQr: scannedQr);
    print("scannedQrscannedQrscannedQr");
   print(scannedQr);

    var response = await ApiProvider().post(
      endpoint: "/v1/pointing",
      encodeBody: false,
      body: pointing.toJson(),
    );

    return response;
  }

  getPointings() async {
    var response = await ApiProvider().get(
      endpoint: "/v1/pointing",
    );
    if (response != null ) {
      List<Pointings> pointings = [];
      for (var item in response["data"]) {
        pointings.add(Pointings.fromJson(item));
      }
      return pointings;
    }
  }

  getUsersPointings(String userid) async {
    var response = await ApiProvider().get(
      endpoint: "/v1/pointing/",
      queryParam: {"userId": userid},
    );
    if (response != null && response.containsKey("data")) {
      List<Pointings> pointings = [];
      for (var item in response["data"]) {
        pointings.add(Pointings.fromJson(item));
      }

      return pointings;
    }
  }


  getAllPointings({required String beginDate, required String endDate}) async {
    DateFormat dateFormat = DateFormat("yyyy/MM/dd hh:mm:ss");

    var response = await ApiProvider().get(
      endpoint: "/v1/pointing/history",
      queryParam: {
        "beginDate": beginDate,
        "endDate": endDate,
      },
    );

    if (response != null) {
      List<Pointings> pointings = [];
      for (var item in response["data"]) {
        pointings.add(Pointings.fromJson(item));
      }
      return pointings;
    }
  }
}
