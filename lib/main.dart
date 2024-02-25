import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:onyx_test/app/config/translate/messages.dart';

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
  runApp(
    DevicePreview(
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
        initialRoute: Prefs.getString(PrefsKeys.token).isNotEmpty ? Routes.HOME : AppPages.INITIAL,
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
  );
}
