import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spirittrips/gen/assets.gen.dart';
import 'package:spirittrips/gen/fonts.gen.dart';
import 'package:spirittrips/src/core/resources/resources.dart';
import 'package:spirittrips/src/core/router/app_router.dart';
import 'package:spirittrips/src/feature/auth/presentation/widgets/custom_button.dart';
import 'package:spirittrips/src/feature/main/presentation/ui/count_time_bottom_sheet.dart';
import 'package:spirittrips/src/feature/main/presentation/widgets/category_card.dart';
import 'package:spirittrips/src/feature/main/presentation/widgets/forum_question_card.dart';
import 'package:spirittrips/src/feature/main/presentation/widgets/main_banner_widget.dart';
import 'package:spirittrips/src/feature/main/presentation/widgets/title_row.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  List<(String, String)> catnames = [
    ('Подготовка к паломничеству', Assets.icons.bookClosedFill2),
    ('Документы и визы', Assets.icons.airplane),
    ('Выбор и бронирование туров', Assets.icons.airplane),
    ('Транспорт и проживание', Assets.icons.busDoubledecker),
    ('Ритуалы и обряды', Assets.icons.figureMindAndBody),
    ('Культура и этикет', Assets.icons.globe),
    ('Питание и здоровье', Assets.icons.heartFill),
    ('Безопасность и личная защита', Assets.icons.checkmarkShieldFill),
    ('Финансовые вопросы', Assets.icons.dollarsign),
    ('Общение и поддержка', Assets.icons.bubbleLeftAndTextBubbleRightFill),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton(
          text: 'Расчитать время намаза в Аль-Харам',
          height: 50,
          onTap: () {
            CountTimeBottomSheet.show(context);
          },
        ),
      ),
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: _SliverAppBar(
                expandedHeight: MediaQuery.of(context).size.height / 2,
                image: Assets.images.kaaba.path,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16).copyWith(bottom: 0),
              sliver: SliverList.list(
                children: [
                  const MainBannerWidget(),
                  const SizedBox(
                    height: 16,
                  ),
                  TitleRow(
                    title: 'Обсуждения на форуме',
                    onTap: () {
                      context.router.push(const ForumRoute());
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => const ForumQuestionCard(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const TitleRow(title: 'Категории обсуждаемых тем'),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8).copyWith(bottom: 100),
              sliver: SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 194 / 75,
                ),
                itemCount: catnames.length,
                itemBuilder: (context, index) => CategoryCard(
                  title: catnames[index].$1,
                  icon: catnames[index].$2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final String image;

  _SliverAppBar({
    required this.expandedHeight,
    required this.image,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final progress = shrinkOffset / maxExtent;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 466),
      child: Material(
        color: 1 - progress < 0.5 ? Colors.white : Colors.transparent,
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.topCenter,
          children: [
            AnimatedOpacity(
              duration: const Duration(milliseconds: 150),
              opacity: 1 - progress < 0.3 ? 0 : 1 - progress,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.34478673,
                width: double.infinity,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
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
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                          children: [
                            TextSpan(
                              text: 'trips',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.mainColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 16,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: 50,
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 12.5,
                        sigmaY: 12.5,
                      ),
                      child: CupertinoSearchTextField(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        prefixInsets: const EdgeInsetsDirectional.all(14).copyWith(end: 0),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 20,
                        ),
                        placeholder: 'Поиск по spirittrips',
                        placeholderStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontFamily: FontFamily.avenirNext,
                          height: 1,
                        ),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontFamily: FontFamily.avenirNext,
                          height: 1,
                        ),
                        suffixInsets: const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 50;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
