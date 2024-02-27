import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onyx_test/app/modules/home/models/delivery_bill_model.dart';
import 'package:onyx_test/app/service/offline/onyx.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final isOthersTap = false.obs;
  final offlineService = Get.find<OnyxOfflineService>();

  final loading = false.obs;
  final othersBills = <DeliveryBillsModel>[].obs;
  final newBills = <DeliveryBillsModel>[].obs;

  Future<void> getBills() async {
    try {
      loading.value = true;
      final bills = await offlineService.findManyFromDb();
      newBills.clear();
      othersBills.clear();
      for (final item in bills) {
        if (item.deliveryStatusFlg == '0') {
          newBills.add(item);
        } else {
          othersBills.add(item);
        }
      }
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      Get.snackbar('error', e.toString());
    } finally {
      loading.value = false;
    }
  }

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    getBills();
    super.onInit();
  }

  @override
  void onReady() {
    tabController.addListener(() {
      if (tabController.index == 0) {
        isOthersTap.value = false;
      } else {
        isOthersTap.value = true;
      }
    });
    super.onReady();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
