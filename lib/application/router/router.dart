import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:patterns_ipr/pages/behavioral/behavioral_page.dart';
import 'package:patterns_ipr/pages/bottom_navigation/bottom_navigation_page.dart';
import 'package:patterns_ipr/pages/creational/creational_page.dart';
import 'package:patterns_ipr/pages/structural/structural_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final _logger = Logger();

final router = GoRouter(
  initialLocation: CreationalPage.routeName,
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      pageBuilder: (context, state, child) {
        _logger.i('route: ${state.fullPath}');

        return NoTransitionPage(
          child: BottomNavigationPage(
            location: state.fullPath ?? CreationalPage.routeName,
            child: child,
          ),
        );
      },
      routes: [
        GoRoute(
          path: CreationalPage.routeName,
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) {
            return const NoTransitionPage(
              child: CreationalPage(),
            );
          },
        ),
        GoRoute(
          path: StructuralPage.routeName,
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) {
            return const NoTransitionPage(
              child: StructuralPage(),
            );
          },
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: BehavioralPage.routeName,
          pageBuilder: (context, state) {
            return const NoTransitionPage(
              child: BehavioralPage(),
            );
          },
        ),
      ],
    ),
  ],
);
