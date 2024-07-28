import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spirittrips/gen/assets.gen.dart';
import 'package:spirittrips/gen/fonts.gen.dart';
import 'package:spirittrips/src/core/resources/resources.dart';
import 'package:spirittrips/src/feature/main/presentation/widgets/forum_question_card.dart';
import 'package:spirittrips/src/feature/main/presentation/widgets/main_banner_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            padding: const EdgeInsets.all(16),
            sliver: SliverList.list(
              children: [
                const MainBannerWidget(),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Обсуждения на форуме',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      child: Text(
                        'Посмотреть все',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.5),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
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
              ],
            ),
          ),
        ],
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
