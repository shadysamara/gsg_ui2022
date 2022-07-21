import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gsk_ui/data/news_app/views/screens/all_news_screen.dart';
import 'package:gsk_ui/data/news_app/views/screens/main_screen.dart';
import 'package:gsk_ui/instegram/instegram_feed.dart';
import 'package:gsk_ui/my_first_ui.dart';
import 'package:gsk_ui/navigation/router.dart';
import 'package:gsk_ui/navigation/screens/screen1.dart';
import 'package:gsk_ui/navigation/screens/screen2.dart';
import 'package:gsk_ui/navigation/screens/screen3.dart';
import 'package:gsk_ui/screen2.dart';
import 'package:gsk_ui/translated_ui.dart';
import 'package:gsk_ui/validation_ex/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/langs', // <-- change the path of the translation files
        fallbackLocale: Locale('en'),
        child: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  bool isDark = false;
  changeTheme(bool value) {
    isDark = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            navigatorKey: AppRouter.navKey,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: isDark ? ThemeData.dark() : ThemeData.light(),
            home: RegisterScreen(),
            routes: {
              Screen1.screenName:(context)=>Screen1(),
              Screen2.screenName: (context) => Screen2('')
            },
            onGenerateRoute: (RouteSettings routeSettings) {
              String? name = routeSettings.name;
              dynamic arguments = routeSettings.arguments;
              if (name == Screen2.screenName) {
                return MaterialPageRoute(builder: (context) {
                  return Screen2(arguments.toString());
                });
              } else {
                return MaterialPageRoute(builder: (context) {
                  return PathNotFound(name!);
                });
              }
            },
          );
        });
  }
}
