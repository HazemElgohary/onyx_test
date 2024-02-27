import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:onyx_test/app/helpers/api.dart';
import 'package:onyx_test/app/helpers/keys.dart';
import 'package:onyx_test/app/helpers/prefs.dart';
import 'package:onyx_test/app/routes/app_pages.dart';
import 'package:onyx_test/app/service/online/bill.dart';
import 'package:onyx_test/app/service/online/login.dart';

class LoginScreenController extends GetxController {
  final service = Get.find<LoginService>();
  final billService = Get.find<BillService>();
  final loading = false.obs;
  final userId = TextEditingController();
  final password = TextEditingController();

  Future<void> login() async {
    try {
      loading.value = true;
      await service.login(
        id: userId.text,
        password: password.text,
      );
      await billService.getBills(userId: userId.text);
      Get.offAllNamed(Routes.HOME);
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      Get.snackbar('error', e.toString());
    } finally {
      loading.value = false;
    }
  }

  Future<void> updateLang() async {
    try {
      // final en = Prefs.getString(PrefsKeys.lang) == 'en';
      //
      // await Prefs.setString(PrefsKeys.lang, en ? 'ar' : 'en');
      // await Get.updateLocale(Locale(en ? 'ar' : 'en'));
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
    }
  }
}
