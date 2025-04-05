import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/app/widgets/nav_item.dart';

class MainView extends StatelessWidget {
  const MainView({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        child: Row(
          children: [
            NavItem(
                icon: Icons.home,
                index: 0,
                isSelected: navigationShell.currentIndex == 0,
                onTap: () => navigationShell.goBranch(0)),
            NavItem(
                icon: Icons.inbox,
                index: 1,
                isSelected: navigationShell.currentIndex == 1,
                onTap: () => navigationShell.goBranch(1)),
            NavItem(
                icon: Icons.calendar_month,
                index: 2,
                isSelected: navigationShell.currentIndex == 2,
                onTap: () => navigationShell.goBranch(2)),
            NavItem(
                icon: Icons.category,
                index: 3,
                isSelected: navigationShell.currentIndex == 3,
                onTap: () => navigationShell.goBranch(3)),
            NavItem(
                icon: Icons.plus_one,
                index: 4,
                isSelected: navigationShell.currentIndex == 4,
                onTap: () => navigationShell.goBranch(4)),
          ],
        ),
      ),
    );
  }
}
