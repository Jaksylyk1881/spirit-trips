import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spirittrips/gen/assets.gen.dart';
import 'package:spirittrips/src/feature/app/presentation/onboard_2.dart';

@RoutePage()
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(Assets.images.dec.path),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Column(
                children: [
                  Text(
                    'Комьюнити мусульман',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff2A2A29),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'в одном месте',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              Image.asset(Assets.images.onboard1.path),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RawMaterialButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const OnBoard2()));
                    },
                    fillColor: const Color(0xffD1A977),
                    padding: const EdgeInsets.all(9.0),
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.arrow_forward,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
