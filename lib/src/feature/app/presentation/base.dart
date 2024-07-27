import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spirittrips/src/core/resources/resources.dart';
import 'package:spirittrips/src/core/router/app_router.dart';

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  _PassangerBaseState createState() => _PassangerBaseState();
}

class _PassangerBaseState extends State<Base> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      backgroundColor: AppColors.static,
      routes: const [
        MainRoute(),
        ProfileRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) => NavigationBar(
        selectedIndex: tabsRouter.activeIndex,
        onDestinationSelected: (value) {
          tabsRouter.setActiveIndex(value);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.tab),
            selectedIcon: Icon(Icons.tab),
            label: 'Forum',
          ),
          NavigationDestination(
            icon: Icon(Icons.search_outlined),
            selectedIcon: Icon(Icons.search),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
