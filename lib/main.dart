import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';

import 'constants/localization.dart';
import 'controller/controller_auth_security_pass.dart';
import 'controller/controller_image.dart';
import 'theme/dark_light_theme.dart';
import 'view/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Future.delayed(const Duration(seconds: 2), () {
    // get data from api
    // remove splash
    FlutterNativeSplash.remove();
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return EasyLocalization(
    //     supportedLocales: const [Locale('en'), Locale('ar')],
    //     path:
    //         'assets/translations', // <-- change the path of the translation files
    //     fallbackLocale: const Locale('en'),
    //     child: MultiProvider(
    //         providers: [
    //           ChangeNotifierProvider(create: (_) => ControllerImage()),
    //           ChangeNotifierProvider(
    //               create: (_) => ControllerAuthSecurityPass()),
    //           ChangeNotifierProvider(create: (_) => DarkLightTheme()),
    //         ],
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: AdaptiveTheme(
            light: DarkLightTheme.themeLight(context),
            dark: DarkLightTheme.themeDark(context),
            initial: AdaptiveThemeMode.system,
            builder: (light, dark) => MaterialApp(
                  title: ConstantLocalization.appName.tr(),
                  debugShowCheckedModeBanner: false,
                  // localizationsDelegates: context.localizationDelegates,
                  // supportedLocales: context.supportedLocales,
                  // locale: context.locale,
                  theme: light,
                  darkTheme: dark,
                  home: const ViewLoginPage(),
                )));
  }
}
