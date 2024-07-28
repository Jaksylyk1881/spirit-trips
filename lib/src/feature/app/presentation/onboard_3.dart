import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spirittrips/gen/assets.gen.dart';
import 'package:spirittrips/src/core/resources/resources.dart';
import 'package:spirittrips/src/core/router/app_router.dart';
import 'package:spirittrips/src/feature/app/bloc/app_bloc.dart';
import 'package:spirittrips/src/feature/auth/model/user_dto.dart';
import 'package:spirittrips/src/feature/auth/presentation/widgets/custom_button.dart';

class OnBoard3 extends StatefulWidget {
  const OnBoard3({super.key});

  @override
  State<OnBoard3> createState() => _OnBoard3State();
}

class _OnBoard3State extends State<OnBoard3> {
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
              Column(
                children: [
                  const Text(
                    'Изучайте и путешествуйте',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff2A2A29),
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        'через',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 50,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: RichText(
                                  text: const TextSpan(
                                    text: 'spirit',
                                    style:
                                        TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Color(0xff2A2A29)),
                                    children: [
                                      TextSpan(
                                        text: 'trips',
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.mainColor,
                                        ),
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
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Image.asset(Assets.images.onboard3.path),
              const SizedBox(
                height: 60,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Container(
              //       height: 50,
              //       width: 340,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(100),
              //         color: const Color(0xffD1A977),
              //       ),
              //       child: const Padding(
              //         padding: EdgeInsets.only(left: 240.0),
              //         child: Row(
              //           children: [
              //             Text('data'),
              //             Icon(
              //               Icons.arrow_forward,
              //               size: 30,
              //               color: Colors.white,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              const Spacer(),
              CustomButton(
                text: 'Бисмиллях',
                onTap: () {
                  BlocProvider.of<AppBloc>(context)
                      .add(const AppEvent.chageState(state: AppState.inAppState(user: UserDTO())));
                  context.router.popUntil((route) => route.settings.name == LauncherRoute.name);
                },
                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
