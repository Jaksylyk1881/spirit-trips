import 'package:flutter/material.dart';
import 'package:spirittrips/src/core/resources/resources.dart';

class ForumQuestionCard extends StatelessWidget {
  const ForumQuestionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.mainColor.withOpacity(0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Вопрос #245342134',
              style: TextStyle(fontSize: 8, fontWeight: FontWeight.w500),
            ),
            const Text(
              'Как совершать Умру в первый раз? Через тур. компанию или самостоятельно?',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
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
                  onTap: () {},
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
        ),
      ),
    );
  }
}
