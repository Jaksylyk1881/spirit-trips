import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spirittrips/src/core/resources/resources.dart';
import 'package:spirittrips/src/feature/app/presentation/onboard_1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((d) {
      Timer(const Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const OnBoardingScreen()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 160,
            ),
            Image.asset(
              'assets/images/splash.png',
              height: 400,
            ),
            const SizedBox(
              height: 120,
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: RichText(
                        text: const TextSpan(
                          text: 'spirit',
                          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700, color: Color(0xff2A2A29)),
                          children: [
                            TextSpan(
                              text: 'trips',
                              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700, color: AppColors.mainColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
