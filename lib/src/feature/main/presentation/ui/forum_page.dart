import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spirittrips/src/core/router/app_router.dart';
import 'package:spirittrips/src/feature/main/presentation/widgets/forum_question_card.dart';
import 'package:spirittrips/src/feature/main/presentation/widgets/title_row.dart';

@RoutePage()
class ForumPage extends StatefulWidget {
  const ForumPage({super.key});

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Обсуждения на форуме',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              sliver: SliverList.list(
                children: const [
                  SizedBox(
                    height: 16,
                  ),
                  ForumItem(
                    titile: 'Подготовка к паломничеству',
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ForumItem(
                    titile: 'Документы и визы',
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ForumItem(
                    titile: 'Выбор и бронирование туров',
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ForumItem(
                    titile: 'Транспорт и проживание',
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ForumItem(
                    titile: 'Ритуалы и обряды',
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

class ForumItem extends StatelessWidget {
  final String titile;
  const ForumItem({
    super.key,
    required this.titile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleRow(
          title: titile,
          onTap: () {
            context.router.push(ForumDetailRoute(title: titile));
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
      ],
    );
  }
}
