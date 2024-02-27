import 'package:get/get.dart';
import 'package:onyx_test/app/helpers/api.dart';
import 'package:onyx_test/app/helpers/end_points.dart';
import 'package:onyx_test/app/modules/home/models/delivery_bill_model.dart';
import 'package:onyx_test/app/service/offline/onyx.dart';

class BillService {
  final offlineService = Get.find<OnyxOfflineService>();

  Future<void> getBills({
    required String userId,
  }) async {
    final res = await Api.post(
      EndPoints.getDeliveryBillsItems,
      body: {
        "Value": {
          "P_DLVRY_NO": userId,
          "P_LANG_NO": "2",
          "P_BILL_SRL": "",
          "P_PRCSSD_FLG": "",
        },
      },
    );

    if (res.statusCode != 200) {
      throw res.data['Result']['ErrMsg'].toString() + res.data;
    }
    final List<DeliveryBillsModel> bills = (res.data['Data']['DeliveryBills'] as List)
        .map((e) => DeliveryBillsModel.fromJson(e))
        .toList();
    await offlineService.clear();
    for (final bill in bills) {
      await offlineService.addOnyxDelivery(bills: bill);
    }
  }
}
