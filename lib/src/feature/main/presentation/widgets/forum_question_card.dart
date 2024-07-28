import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spirittrips/gen/assets.gen.dart';
import 'package:spirittrips/src/core/resources/resources.dart';
import 'package:spirittrips/src/core/router/app_router.dart';

class ForumQuestionCard extends StatelessWidget {
  final String? name;
  final int? commentCount;
  final int? likeCount;
  final bool isAnswer;
  const ForumQuestionCard({
    super.key,
    this.name,
    this.commentCount,
    this.likeCount,
    this.isAnswer = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: !isAnswer ? AppColors.mainColor.withOpacity(0.1) : AppColors.ligthBlue.withOpacity(0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (name != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    SvgPicture.asset(Assets.icons.personCropCircleFill),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      name!,
                      style: const TextStyle(fontSize: 8, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            Text(
              '${isAnswer ? 'Ответ' : 'Вопрос'} #245342134',
              style: const TextStyle(fontSize: 8, fontWeight: FontWeight.w500),
            ),
            Text(
              isAnswer
                  ? 'Пусть Всевышний пример Ваши намерения! Если Вы собираетесь совершить Умру в первый раз, рекомендую сперва самостоятельно ознакомиться об этом сакральном туризме, это Вы можете сделать на этой же платформе. А через компанию или самостоятельно - рекомендую с через тур. компании. Так как они уже в этом деле эксперты.Мир Вам!'
                  : 'Как совершать Умру в первый раз? Через тур. компанию или самостоятельно?',
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            if (commentCount != null && likeCount != null)
              Row(
                children: [
                  SvgPicture.asset(Assets.icons.heart),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    likeCount.toString(),
                    style: const TextStyle(fontSize: 8, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  SvgPicture.asset(Assets.icons.message),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    commentCount.toString(),
                    style: const TextStyle(fontSize: 8, fontWeight: FontWeight.w500),
                  ),
                ],
              )
            else ...[
              const Text(
                'Ответов: 256. Полезность: 97%',
                style: TextStyle(fontSize: 8, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 22,
                width: 102,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(width: 0.5, color: AppColors.mainColor.withOpacity(0.5)),
                ),
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(40),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(40),
                    onTap: () {
                      context.router.push(const QuestionDetailRoute());
                    },
                    child: const Center(
                      child: Text(
                        'Посмотреть ответы',
                        style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w500,
                          color: AppColors.mainColor,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
