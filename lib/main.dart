import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:onyx_test/app/config/translate/messages.dart';
import 'package:onyx_test/app/service/session_manager/session_config.dart';
import 'package:onyx_test/app/service/session_manager/session_timeout_config.dart';

import 'app/config/theme.dart';
import 'app/helpers/keys.dart';
import 'app/helpers/prefs.dart';
import 'app/inject.dart';
import 'app/routes/app_pages.dart';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  await inject();
  final sessionConfig = SessionConfig(
      invalidateSessionForAppLostFocus: const Duration(minutes: 2),
      invalidateSessionForUserInactiviity: const Duration(minutes: 2));

  sessionConfig.stream.listen((SessionTimeoutState timeoutEvent) {
    if (timeoutEvent == SessionTimeoutState.userInactivityTimeout) {
      Get.offAllNamed(Routes.LOGIN_SCREEN);
      Get.snackbar("Sorry ...! \n Session Expired .. Try Again", '');

      Prefs.clear();
    } else if (timeoutEvent == SessionTimeoutState.appFocusTimeout) {
      Get.offAllNamed(Routes.LOGIN_SCREEN);
      Get.snackbar("Sorry ...! \n Session Expired .. Try Again", '');

      Prefs.clear();
    }
  });
  runApp(
    SessionTimeoutManager(
      sessionConfig: sessionConfig,
      child: DevicePreview(
        enabled: false,
        builder: (BuildContext context) => GetMaterialApp(
          title: "Onyx",
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
            },
          ),
          locale: Locale(
              Prefs.getString(PrefsKeys.lang).isEmpty ? 'en' : Prefs.getString(PrefsKeys.lang)),
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          theme: buildTheme(context),
          translations: Messages(),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          fallbackLocale: const Locale('en'),
        ),
      ),
    ),
  );
}
