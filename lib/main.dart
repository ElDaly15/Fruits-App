import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruits_app/core/db/cached_helper.dart';
import 'package:fruits_app/core/helper/on_generate_routes.dart';
import 'package:fruits_app/core/helper/singleton_helper.dart';
import 'package:fruits_app/featuers/splash/presentation/views/splash_view.dart';
import 'package:fruits_app/generated/l10n.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup(); // SetUp Singleton
  getIt<CacheHelper>().init();
  runApp(
      DevicePreview(enabled: false, builder: (context) => const FruitsApp()));
}

class FruitsApp extends StatelessWidget {
  const FruitsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Cairo'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
