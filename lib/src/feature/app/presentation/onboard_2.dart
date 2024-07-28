import 'package:flutter/material.dart';
import 'package:spirittrips/gen/assets.gen.dart';
import 'package:spirittrips/src/feature/app/presentation/onboard_3.dart';

class OnBoard2 extends StatefulWidget {
  const OnBoard2({super.key});

  @override
  State<OnBoard2> createState() => _OnBoard2State();
}

class _OnBoard2State extends State<OnBoard2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
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
                    'Ответы на все вопросы',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff2A2A29),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'от опытных паломников',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              Image.asset(Assets.images.onboard2.path),
              const SizedBox(
                height: 110,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RawMaterialButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const OnBoard3()));
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
