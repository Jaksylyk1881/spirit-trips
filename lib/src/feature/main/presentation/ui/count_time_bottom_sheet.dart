import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:spirittrips/gen/assets.gen.dart';
import 'package:spirittrips/src/core/resources/resources.dart';
import 'package:spirittrips/src/core/services/locator_service.dart';
import 'package:spirittrips/src/core/utils/snackbar_util.dart';
import 'package:spirittrips/src/feature/main/bloc/route_cubit.dart';
import 'package:spirittrips/src/feature/main/presentation/widgets/address_search_modal.dart';

class CountTimeBottomSheet extends StatefulWidget {
  final String? name;
  const CountTimeBottomSheet({
    super.key,
    this.name,
  });

  static Future<void> show(
    BuildContext context, {
    String? title,
  }) async =>
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        useRootNavigator: true,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        builder: (_) => BlocProvider(
          create: (context) => RouteCubit(repository: DI()),
          child: CountTimeBottomSheet(
            name: title,
          ),
        ),
      );

  @override
  State<CountTimeBottomSheet> createState() => _CountTimeBottomSheetState();
}

class _CountTimeBottomSheetState extends State<CountTimeBottomSheet> {
  final TextEditingController _nameController = TextEditingController();
  Prediction? pointA;
  @override
  void initState() {
    super.initState();
    if (widget.name != null) _nameController.text = widget.name!;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RouteCubit, RouteState>(
      listener: (context, state) {
        state.maybeWhen(
          errorState: (message) {
            SnackBarUtil.showErrorTopShortToast(context, message);
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          decoration: const BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 8,
              ),
              Center(
                child: Container(
                  height: 4,
                  width: 48,
                  decoration: BoxDecoration(color: AppColors.grey, borderRadius: BorderRadius.circular(8)),
                ),
              ),
              Row(
                children: [
                  CupertinoButton(
                    child: const Text('Закрыть'),
                    onPressed: () {
                      context.router.maybePop();
                    },
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Расчитать время намаза в Аль-Харам',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700, height: 1),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      AddressSearchModal.show(
                        context,
                        callback: (prediction) {
                          pointA = prediction;
                          log("$prediction", name: "LAT:::");
                          BlocProvider.of<RouteCubit>(context).getRoute(
                            lat: double.parse(prediction.lat ?? '0'),
                            long: double.parse(prediction.lng ?? '0'),
                          );
                          setState(() {});
                        },
                      );
                    },
                    child: PlaceRow(
                      place: pointA?.description ?? 'Выберите адрес',
                      city: '',
                      icon: Assets.icons.figureWave,
                      padding: 22,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 0.5,
                    color: const Color(0xffD6D6D6),
                    margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 16).copyWith(right: 0),
                  ),
                  PlaceRow(
                    place: 'Al Haram',
                    city: 'Makkah',
                    spacing: 8,
                    icon: Assets.icons.flag2CrossedFill,
                    padding: 8,
                  ),
                  Container(
                    width: double.infinity,
                    height: 0.5,
                    color: const Color(0xffD6D6D6),
                    margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 16).copyWith(right: 0),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColors.mainColor.withOpacity(0.1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  Assets.icons.figureWalk,
                                  colorFilter: const ColorFilter.mode(Color(0xffA3835C), BlendMode.srcIn),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '${state.maybeWhen(
                                    loadedState: (route) => route.duration != null ? secToMin(route.duration!) : '',
                                    orElse: () => '-',
                                  )} мин.',
                                  style: const TextStyle(color: Color(0xffA3835C)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.maybeWhen(
                                  loadedState: (route) => '18:48',
                                  orElse: () => '-',
                                ),
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Text(
                                'Выйдя из дома в это время, Вы успеете к намазу в мечети',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${state.maybeWhen(
                                  loadedState: (route) => route.distanceMeters.toString(),
                                  orElse: () => '-',
                                )} м',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Text(
                                'Расстояние до мечети',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Platform.isIOS ? 40 : 32,
              ),
            ],
          ),
        );
      },
    );
  }

  String secToMin(String sec) {
    final int seconds = int.parse(sec.substring(0, sec.length - 2));
    return (seconds ~/ 60).toString();
  }
}

class PlaceRow extends StatelessWidget {
  final double padding;
  final String place;
  final String city;
  final String icon;
  final double? spacing;
  const PlaceRow({
    super.key,
    required this.place,
    required this.city,
    required this.icon,
    this.spacing,
    this.padding = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Row(
        children: [
          SvgPicture.asset(icon),
          SizedBox(
            width: spacing ?? 20,
          ),
          RichText(
            text: TextSpan(
              text: place,
              style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
              children: [
                const TextSpan(text: ' · '),
                TextSpan(
                  text: city,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
