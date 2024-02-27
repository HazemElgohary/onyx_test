import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:onyx_test/app/service/online/login.dart';
import 'package:onyx_test/app/service/offline/databse/db.dart';
import 'package:onyx_test/app/service/offline/onyx.dart';

import 'package:shared_preferences/shared_preferences.dart';

// ignore: depend_on_referenced_packages
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'helpers/api.dart';
import 'helpers/end_points.dart';
import 'service/online/bill.dart';

Future<void> inject() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(await SharedPreferences.getInstance(), permanent: true);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  /// * Offline Database
  final db = await DatabaseServices.boot();

  Get.put(db);
  Get.put(DatabaseServices(), permanent: true);
  Get.put(OnyxOfflineService(db), permanent: true);

  /// * Online Database
  final dio = Dio(
    BaseOptions(
      baseUrl: EndPoints.baseUrl,
      validateStatus: (_) => true,
      followRedirects: true,
      contentType: 'application/json',
      headers: {'accept': 'application/json'},
      listFormat: ListFormat.csv,
    ),
  )..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90));
  Get.put(DioWrapper(dio), permanent: true);

  /// * Services
  Get.put(LoginService());
  Get.put(BillService());
}
