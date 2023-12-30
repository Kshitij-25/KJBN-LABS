import 'package:flutter/material.dart';
import 'package:kjbn_demo/presentation/pages/splashscreen.dart';

import 'presentation/pages/homescreen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const SplashScreen(),
        "/homePage": (context) => const HomeScreen()
      },
    );
  }
}
