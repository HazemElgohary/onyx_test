import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:onyx_test/app/config/theme.dart';
import 'package:onyx_test/app/config/widgets/custom_app_bar.dart';
import 'package:onyx_test/app/modules/home/views/widgets/bills_list_view.dart';
import 'package:onyx_test/generated/assets.dart';

import '../controllers/home_controller.dart';
import 'widgets/segmentation_card.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            imagePath: Asset.images.png.topbar,
          ),
          const SizedBox(
            height: 20,
          ),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(100),
            child: Container(
              height: 40,
              width: size.width * .6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              child: Obx(
                () => Row(
                  children: [
                    SegmentationsCard(
                      onTap: () {
                        if (controller.isOthersTap.value) {
                          controller.tabController.animateTo(0);
                        }
                        controller.isOthersTap.value = false;
                      },
                      title: "New",
                      selected: !controller.isOthersTap.value,
                    ),
                    SegmentationsCard(
                      onTap: () {
                        if (!controller.isOthersTap.value) {
                          controller.tabController.animateTo(1);
                        }
                        controller.isOthersTap.value = true;
                      },
                      title: "Others",
                      selected: controller.isOthersTap.value,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: TabBarView(
                controller: controller.tabController,
                children: [
                  Obx(
                    () => controller.newBills.isEmpty
                        ? Center(
                            child: Text('There is No Bills'),
                          )
                        : BillsListView(
                            bills: controller.newBills,
                          ),
                  ),
                  Obx(
                    () => controller.othersBills.isEmpty
                        ? Center(
                            child: Text('There is No Bills'),
                          )
                        : BillsListView(
                            bills: controller.othersBills,
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
