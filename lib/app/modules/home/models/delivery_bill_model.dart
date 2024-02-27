import 'package:equatable/equatable.dart';

class DeliveryBillModel extends Equatable {
  Data? data;
  Result? result;

  DeliveryBillModel({this.data, this.result});

  DeliveryBillModel.fromJson(Map<String, dynamic> json) {
    data = json["Data"] == null ? null : Data.fromJson(json["Data"]);
    result = json["Result"] == null ? null : Result.fromJson(json["Result"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (data != null) {
      _data["Data"] = data?.toJson();
    }
    if (result != null) {
      _data["Result"] = result?.toJson();
    }
    return _data;
  }

  @override
  // ultimate_soluation_onyx: implement props
  List<Object?> get props => [data, result];
}

class Result extends Equatable {
  String? errMsg;
  int? errNo;

  Result({this.errMsg, this.errNo});

  Result.fromJson(Map<String, dynamic> json) {
    errMsg = json["ErrMsg"];
    errNo = json["ErrNo"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["ErrMsg"] = errMsg;
    _data["ErrNo"] = errNo;
    return _data;
  }

  @override
  // ultimate_soluation_onyx: implement props
  List<Object?> get props => [errMsg, errNo];
}

class Data extends Equatable {
  List<DeliveryBills>? deliveryBills;

  Data({this.deliveryBills});

  Data.fromJson(Map<String, dynamic> json) {
    deliveryBills = json["DeliveryBills"] == null
        ? null
        : (json["DeliveryBills"] as List)
            .map((e) => DeliveryBills.fromJson(e))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (deliveryBills != null) {
      _data["DeliveryBills"] = deliveryBills?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  @override
  // ultimate_soluation_onyx: implement props
  List<Object?> get props => [deliveryBills];
}

class DeliveryBills extends Equatable {
  String? billAmt;
  String? billDate;
  String? billNo;
  String? billSrl;
  String? billTime;
  String? cstmrAddrss;
  String? cstmrAprtmntNo;
  String? cstmrBuildNo;
  String? cstmrFloorNo;
  String? cstmrNm;
  String? dlvryAmt;
  String? dlvryStatusFlg;
  String? latitude;
  String? longitude;
  String? mobileNo;
  String? rgnNm;
  String? taxAmt;

  DeliveryBills(
      {this.billAmt,
      this.billDate,
      this.billNo,
      this.billSrl,
      this.billTime,
      this.cstmrAddrss,
      this.cstmrAprtmntNo,
      this.cstmrBuildNo,
      this.cstmrFloorNo,
      this.cstmrNm,
      this.dlvryAmt,
      this.dlvryStatusFlg,
      this.latitude,
      this.longitude,
      this.mobileNo,
      this.rgnNm,
      this.taxAmt});

  DeliveryBills.fromJson(Map<String, dynamic> json) {
    billAmt = json["BILL_AMT"] ?? "";
    billDate = json["BILL_DATE"] ?? "";
    billNo = json["BILL_NO"] ?? "";
    billSrl = json["BILL_SRL"] ?? "";
    billTime = json["BILL_TIME"] ?? "";
    cstmrAddrss = json["CSTMR_ADDRSS"] ?? "";
    cstmrAprtmntNo = json["CSTMR_APRTMNT_NO"] ?? "";
    cstmrBuildNo = json["CSTMR_BUILD_NO"] ?? "";
    cstmrFloorNo = json["CSTMR_FLOOR_NO"] ?? "";
    cstmrNm = json["CSTMR_NM"] ?? "";
    dlvryAmt = json["DLVRY_AMT"] ?? "";
    dlvryStatusFlg = json["DLVRY_STATUS_FLG"] ?? "";
    latitude = json["LATITUDE"] ?? "";
    longitude = json["LONGITUDE"] ?? "";
    mobileNo = json["MOBILE_NO"] ?? "";
    rgnNm = json["RGN_NM"] ?? "";
    taxAmt = json["TAX_AMT"] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["billAmt"] = billAmt;
    _data["billDate"] = billDate;
    _data["billNo"] = billNo;
    _data["billSrl"] = billSrl;
    _data["billTime"] = billTime;
    _data["cstmrAddrss"] = cstmrAddrss;
    _data["cstmrAprtmntNo"] = cstmrAprtmntNo;
    _data["cstmrBuildNo"] = cstmrBuildNo;
    _data["cstmrFloorNo"] = cstmrFloorNo;
    _data["cstmrNm"] = cstmrNm;
    _data["dlvryAmt"] = dlvryAmt;
    _data["dlvryStatusFlg"] = dlvryStatusFlg;
    _data["latitude"] = latitude;
    _data["longitude"] = longitude;
    _data["mobileNo"] = mobileNo;
    _data["rgnNm"] = rgnNm;
    _data["taxAmt"] = taxAmt;
    return _data;
  }

  @override
  // ultimate_soluation_onyx: implement props
  List<Object?> get props => [
        billAmt,
        billDate,
        billNo,
        billSrl,
        billTime,
        cstmrAddrss,
        cstmrAprtmntNo,
        cstmrBuildNo,
        cstmrFloorNo,
        cstmrNm,
        dlvryAmt,
        dlvryStatusFlg,
        latitude,
        longitude,
        mobileNo,
        rgnNm,
        taxAmt,
      ];

  static const databaseName = 'onyx';

  factory DeliveryBills.fromSql(Map<String, dynamic> sql) {
    return DeliveryBills(
      billAmt: sql['billAmt'],
      billDate: sql['billDate'],
      billNo: sql['billNo'],
      billSrl: sql['billSrl'],
      billTime: sql['billTime'],
      cstmrAddrss: sql['cstmrAddrss'],
      cstmrAprtmntNo: sql['cstmrAprtmntNo'],
      cstmrBuildNo: sql['cstmrBuildNo'],
      cstmrFloorNo: sql['cstmrFloorNo'],
      cstmrNm: sql['cstmrNm'],
      dlvryAmt: sql['dlvryAmt'],
      dlvryStatusFlg: sql['dlvryStatusFlg'],
      latitude: sql['latitude'],
      longitude: sql['longitude'],
      mobileNo: sql['mobileNo'],
      rgnNm: sql['rgnNm'],
      taxAmt: sql['taxAmt'],
    );
  }

  static const createStatement = """CREATE TABLE "$databaseName" (
  
  
                      "billAmt"	VARCHAR,
                      "billDate"	VARCHAR,
                      "billNo"	VARCHAR,
                      "billSrl"	VARCHAR,
                      "billTime"	VARCHAR,
                      "cstmrAddrss"	VARCHAR,
                      "cstmrAprtmntNo"	VARCHAR,
                      "cstmrBuildNo"	VARCHAR,
                      "cstmrFloorNo"	VARCHAR,
                      "cstmrNm"	VARCHAR,
                      "dlvryAmt"	VARCHAR,
                      "dlvryStatusFlg"	VARCHAR,
                      "latitude"	VARCHAR,
                      "longitude"	VARCHAR,
                      "mobileNo"	VARCHAR,
                      "rgnNm"	VARCHAR,
                      "taxAmt"	VARCHAR
                      );""";
}
