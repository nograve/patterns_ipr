import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:patterns_ipr/pages/behavioral/behavioral_page.dart';
import 'package:patterns_ipr/pages/bottom_navigation/bottom_navigation_page.dart';
import 'package:patterns_ipr/pages/creational/creational_page.dart';
import 'package:patterns_ipr/pages/pattern/pattern_page.dart';
import 'package:patterns_ipr/pages/structural/structural_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final _logger = Logger();

final router = GoRouter(
  initialLocation: CreationalPage.routeName,
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    /// Bottom navigation page
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
        /// Creational page
        GoRoute(
          path: CreationalPage.routeName,
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) {
            return const NoTransitionPage(
              child: CreationalPage(),
            );
          },
          routes: [
            GoRoute(
              path: PatternPage.routeName,
              parentNavigatorKey: _shellNavigatorKey,
              pageBuilder: (context, state) {
                return const MaterialPage(
                  child: PatternPage(),
                );
              },
            ),
          ],
        ),

        /// Structural page
        GoRoute(
          path: StructuralPage.routeName,
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) {
            return const NoTransitionPage(
              child: StructuralPage(),
            );
          },
          routes: [
            GoRoute(
              path: PatternPage.routeName,
              parentNavigatorKey: _rootNavigatorKey,
              pageBuilder: (context, state) {
                return const MaterialPage(
                  child: PatternPage(),
                );
              },
            ),
          ],
        ),

        /// Behavioral page
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: BehavioralPage.routeName,
          pageBuilder: (context, state) {
            return const NoTransitionPage(
              child: BehavioralPage(),
            );
          },
          routes: [
            GoRoute(
              path: PatternPage.routeName,
              parentNavigatorKey: _shellNavigatorKey,
              pageBuilder: (context, state) {
                return const MaterialPage(
                  child: PatternPage(),
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
