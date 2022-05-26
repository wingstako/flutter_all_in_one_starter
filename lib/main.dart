import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_all_in_one_starter/features/auth/auth.dart';
import 'package:flutter_all_in_one_starter/features/feature_1/feature_1.dart';
import 'package:flutter_all_in_one_starter/features/feature_2/feature_2.dart';
import 'package:flutter_all_in_one_starter/shared/providers/bottom_nav_provider.dart';
import 'package:provider/provider.dart';

import 'package:flutter_all_in_one_starter/config/localization_config.dart';
import 'package:flutter_all_in_one_starter/firebase_options.dart';
import 'package:flutter_all_in_one_starter/shared/providers/auth_provider.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
        .then((value) {
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
      runApp(EasyLocalization(
          supportedLocales: LocalizationConfig.supportedLocales,
          fallbackLocale: LocalizationConfig.fallbackLocale,
          path: LocalizationConfig.path,
          child: const MyApp()));
    });
  }, ((error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack);
  }));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
            create: (context) => AuthProvider()),
        ChangeNotifierProvider<BottomNavigationBarProvider>(
            create: (context) => BottomNavigationBarProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Consumer<AuthProvider>(
          builder: (context, value, child) {
            switch (value.status) {
              case Status.uninitialized:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case Status.authenticated:
                return Consumer<BottomNavigationBarProvider>(
                  builder: ((context, value, child) {
                    switch (value.currentIndex) {
                      case 0:
                        return Feature1();
                      case 1:
                        return Feature2();
                      default:
                        return Feature1();
                    }
                  }),
                );

              case Status.registering:
              case Status.authenticating:
              case Status.unauthenticated:
                return const LoginView();

              default:
                break;
            }
            return const Center(
              child: Text("Error"),
            );
          },
        ),
      ),
    );
  }
}
