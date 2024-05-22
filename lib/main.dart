import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:oll2u/core/network/apis.dart';
import 'package:oll2u/core/network/logger.dart';
import 'package:oll2u/presentation/login_screen/notifier/login_notifier.dart';

import 'core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "AIzaSyAHBSRP-9uNYfWZjmxxPfFcDUT-T3S0r1w",
    appId: '1:747311779197:android:bdcef445f37f61c8719014',
    messagingSenderId: '747311779197',
    projectId: 'oil2u-c25aa',
    storageBucket: "oil2u-c25aa.appspot.com",
    databaseURL:
        "https://oil2u-c25aa-default-rtdb.asia-southeast1.firebasedatabase.app",
  ));

  InitDio()();
  Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
    PrefUtils().init()
  ]).then((value) {
    runApp(ProviderScope(child: MyApp()));
  });
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final themeType = ref.watch(themeNotifier).themeType;
    final authToken = ref.watch(loginNotifier.notifier).authToken();

    debugLog(message: "token $authToken");

    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme,
          title: 'oll2u',
          navigatorKey: NavigatorService.navigatorKey,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            AppLocalizationDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          supportedLocales: [
            Locale(
              'en',
              '',
            )
          ],
          initialRoute: authToken != null
              ? AppRoutes.entryScreen
              : AppRoutes.initialRoute,
          routes: AppRoutes.routes,
        );
      },
    );
  }
}
