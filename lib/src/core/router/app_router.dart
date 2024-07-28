import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spirittrips/src/feature/app/presentation/launcher.dart';
import 'package:spirittrips/src/feature/app/presentation/onboard_1.dart';
import 'package:spirittrips/src/feature/auth/presentation/auth_presentation.dart';
import 'package:spirittrips/src/feature/main/presentation/main_presentation.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: LauncherRoute.page,
          initial: true,
          children: [
            AutoRoute(
              page: MainRoute.page,
              initial: true,
            ),
            AutoRoute(page: ProfileRoute.page),
          ],
        ),

        ///
        ///Auth
        ///
        AutoRoute(page: AuthRoute.page),

        ///
        ///Main
        ///
        AutoRoute(page: MainRoute.page),

        AutoRoute(page: ForumRoute.page),
        AutoRoute(page: ForumDetailRoute.page),
        AutoRoute(page: QuestionDetailRoute.page),
      ];
}
