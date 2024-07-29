import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spirittrips/src/core/resources/resources.dart';
import 'package:spirittrips/src/core/router/app_router.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String icon;
  const CategoryCard({
    super.key,
    required this.title,
    required this.icon,
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
                title: title,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 15).copyWith(right: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      icon,
                    ),
                    // Icon(
                    //   icon
                    //   size: 15,
                    // ),
                    const Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Text(
                        'Ответов: 256',
                        style: TextStyle(fontSize: 8, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  title,
                  style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 2,
                ),
                const Row(
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
