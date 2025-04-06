import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/app/views/main/home/home_view.dart';

import '../views/main/main_view.dart';
import '../views/placeholder_view.dart';

Widget material(Widget child) => Material(
      color: Colors.transparent,
      child: child,
    );

final List<RouteBase> listRoute = [
  GoRoute(
    path: "/",
    redirect: (_, __) => Routes.home,
  ),
  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) =>
        MainView(navigationShell: navigationShell),
    branches: [
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: Routes.home,
            builder: (context, state) => material(const HomeView()),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: Routes.inbox,
            builder: (context, state) =>
                material(const PagePlaceholder(label: "Inbox")),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: Routes.calendar,
            builder: (context, state) =>
                material(const PagePlaceholder(label: "Calendar")),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: Routes.category,
            builder: (context, state) =>
                material(const PagePlaceholder(label: "Category")),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: Routes.paper,
            builder: (context, state) =>
                material(const PagePlaceholder(label: "Paper plus")),
          ),
        ],
      ),
    ],
  )
];

class Routes {
  Routes._();

  static const String home = "/home";
  static const String inbox = "/inbox";
  static const String calendar = "/calendar";
  static const String category = "/category";
  static const String paper = "/paper";
}
