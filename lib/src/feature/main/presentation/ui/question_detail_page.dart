import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spirittrips/gen/assets.gen.dart';
import 'package:spirittrips/src/feature/main/presentation/widgets/forum_question_card.dart';

@RoutePage()
class QuestionDetailPage extends StatefulWidget {
  const QuestionDetailPage({super.key});

  @override
  State<QuestionDetailPage> createState() => _QuestionDetailPageState();
}

class _QuestionDetailPageState extends State<QuestionDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Подготовка к паломничеству',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        titleSpacing: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    sliver: SliverList.list(
                      children: const [
                        ForumQuestionCard(
                          name: 'sattily.muslim',
                          commentCount: 13,
                          likeCount: 43,
                        ),
                      ],
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(right: 68),
                    sliver: SliverList.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemBuilder: (context, index) => const ForumQuestionCard(
                        name: 'sattily.muslim',
                        commentCount: 13,
                        likeCount: 43,
                        isAnswer: true,
                      ),
                      itemCount: 10,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CupertinoTextField(
                prefix: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: SvgPicture.asset(
                    Assets.icons.personCropCircleFill,
                    height: 16,
                  ),
                ),
                placeholder: 'Ответьте sattily.muslim',
                placeholderStyle:
                    TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Colors.black.withOpacity(0.5)),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: const Color(0xffF2F2F7)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
