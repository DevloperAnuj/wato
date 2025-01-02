import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:wato/config/service_locator.dart';

import 'features/whatsapp_direct/presentation/pages/home_page/home_page.dart';
import 'firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await MobileAds.instance.initialize();
  await FirebaseAnalytics.instance.logAppOpen();
  initSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WA to',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assets/images/wato.png'),
      navigator: MyHomePage(),
      showLoader: true,
      durationInSeconds: 2,
      title: Text(
        "WAto",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      loaderColor: Colors.green,
      loadingText: Text(
        "App Made with ❤️ in Karad",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
