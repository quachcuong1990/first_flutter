import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tyest/i18n/translation_service.dart';
import 'package:tyest/routes/app_pages.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rename/rename.dart';
import 'package:change_app_package_name/change_app_package_name.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mintty',
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeft,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
      supportedLocales: const [
        Locale('vi'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}


