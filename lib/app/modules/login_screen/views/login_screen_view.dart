import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:onyx_test/app/config/theme.dart';
import 'package:onyx_test/app/config/widgets/inputs/custom_button.dart';
import 'package:onyx_test/app/config/widgets/inputs/custom_ff.dart';
import 'package:onyx_test/generated/assets.dart';

import '../controllers/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  LoginScreenView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 60,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: SvgPicture.asset(
                          Asset.images.svg.logo,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        height: context.height * 0.075,
                      ),
                      Text(
                        "Welcome Back!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Log back into your account!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        hint: "User ID",
                        controller: controller.userId,
                        validator: (value) {
                          if (value?.isEmpty ?? false) {
                            return "Please enter your own id ";
                          }
                          return null;
                        },
                        isNumber: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        hint: "Password",
                        controller: controller.password,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "Please enter your own id ";
                          }
                          if ((value?.length ?? 0) > 3) {
                            return "Minimum length is 3  ";
                          }
                          return null;
                        },
                        isPassword: true,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Obx(
                        () => DefaultButton(
                          onTap: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              controller.login();
                            }
                          },
                          loading: controller.loading.value,
                          text: "Log in",
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Center(
                        child: SvgPicture.asset(
                          Asset.images.svg.delivery,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Stack(
            alignment: AlignmentDirectional.centerEnd,
            children: [
              SvgPicture.asset(
                Asset.images.svg.icCircle,
                fit: BoxFit.cover,
              ),
              IconButton(
                onPressed: controller.updateLang,
                icon: Icon(
                  Icons.language,
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
