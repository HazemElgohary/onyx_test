import 'package:equatable/equatable.dart';
import 'package:onyx_test/app/helpers/enums.dart';
import 'package:onyx_test/app/helpers/extentions/string.dart';

class DeliveryBillsModel extends Equatable {
  static const databaseName = 'bill_table';
  final String billDate;
  final String billNo;
  final String billSRL;
  final String billAMT;
  final String deliveryStatusFlg;
  final BillStatus status;

  const DeliveryBillsModel({
    required this.billDate,
    required this.billNo,
    required this.billSRL,
    required this.billAMT,
    required this.deliveryStatusFlg,
    required this.status,
  });

  factory DeliveryBillsModel.fromJson(Map<String, dynamic> json) {
    return DeliveryBillsModel(
      billDate: json["BILL_DATE"],
      billNo: json["BILL_NO"],
      billSRL: json["BILL_SRL"],
      billAMT: json["BILL_AMT"],
      deliveryStatusFlg: json["DLVRY_STATUS_FLG"],
      status: (json["DLVRY_STATUS_FLG"] as String).toBillStatus(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "BILL_AMT": billAMT,
      "BILL_DATE": billDate,
      "BILL_NO": billNo,
      "BILL_SRL": billSRL,
      "DLVRY_STATUS_FLG": deliveryStatusFlg,
    };
  }

  @override
  List<Object?> get props => [
        deliveryStatusFlg,
        billAMT,
        billDate,
        billNo,
      ];

  static const createStatement = """CREATE TABLE "$databaseName" (
                      "BILL_AMT"	VARCHAR,
                      "BILL_DATE"	VARCHAR,
                      "BILL_NO"	VARCHAR,
                      "BILL_SRL"	VARCHAR,
                      "DLVRY_STATUS_FLG"	VARCHAR
                      );""";
}
