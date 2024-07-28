import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spirittrips/src/feature/main/presentation/ui/forum_page.dart';
import 'package:spirittrips/src/feature/main/presentation/widgets/forum_question_card.dart';
import 'package:spirittrips/src/feature/main/presentation/widgets/title_row.dart';

@RoutePage()
class ForumDetailPage extends StatefulWidget {
  final String title;
  const ForumDetailPage({super.key, required this.title});

  @override
  State<ForumDetailPage> createState() => _ForumDetailPageState();
}

class _ForumDetailPageState extends State<ForumDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
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
                        ForumItem(
                          titile: 'Топ обсуждения',
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TitleRow(title: 'Последние обсуждения'),
                      ],
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    sliver: SliverList.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemBuilder: (context, index) => const ForumQuestionCard(
                        name: 'sattily.muslim',
                        commentCount: 13,
                        likeCount: 43,
                      ),
                      itemCount: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
