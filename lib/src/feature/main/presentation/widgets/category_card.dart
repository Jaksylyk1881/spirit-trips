import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spirittrips/src/core/resources/resources.dart';
import 'package:spirittrips/src/core/router/app_router.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.ligthBlue,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(16),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            context.router.push(
              ForumDetailRoute(
                title: 'Подготовка к паломничеству',
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 15).copyWith(right: 0),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.book,
                      size: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Text(
                        'Ответов: 256',
                        style: TextStyle(fontSize: 8, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'Подготовка к паломничеству',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    Text(
                      'Перейти к обсуждению',
                      style: TextStyle(fontSize: 8, fontWeight: FontWeight.w500, height: 0.9),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
