import 'package:cinebuy_app/utils/wrapper/wrapper.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assets/images/logo.png'),
      logoWidth: 150,
      title: const Text(
        "Your one-stop shop for movies online!",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 187, 99, 202),
      showLoader: true,
      loadingText: const Text("Loading..."),
      navigator: const Wrapper(),
      durationInSeconds: 5,
    );
  }
}
