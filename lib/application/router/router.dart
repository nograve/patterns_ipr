import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:patterns_ipr/application/router/error/error_page.dart';
import 'package:patterns_ipr/application/router/scaffold_with_nested_navigation.dart';
import 'package:patterns_ipr/pages/behavioral/behavioral_page.dart';
import 'package:patterns_ipr/pages/creational/creational_page.dart';
import 'package:patterns_ipr/pages/pattern/pattern_page.dart';
import 'package:patterns_ipr/pages/pattern/pattern_page_arguments.dart';
import 'package:patterns_ipr/pages/structural/structural_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorCreationalKey = GlobalKey<NavigatorState>();
final shellNavigatorStructuralKey = GlobalKey<NavigatorState>();
final shellNavigatorBehavioralKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: CreationalPage.routeName,
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: shellNavigatorCreationalKey,
          routes: [
            GoRoute(
              path: CreationalPage.routeName,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: CreationalPage(),
              ),
              routes: [
                // child route
                GoRoute(
                  path: PatternPage.routeName,
                  pageBuilder: (context, state) {
                    final arguments = state.extra;

                    return NoTransitionPage(
                      child: arguments is PatternPageArguments
                          ? PatternPage(
                              arguments: arguments,
                            )
                          : const ErrorPage(),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        // second branch (B)
        StatefulShellBranch(
          navigatorKey: shellNavigatorBehavioralKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: StructuralPage.routeName,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: StructuralPage(),
              ),
              routes: [
                // child route
                GoRoute(
                  path: PatternPage.routeName,
                  pageBuilder: (context, state) {
                    final arguments = state.extra;

                    return NoTransitionPage(
                      child: arguments is PatternPageArguments
                          ? PatternPage(
                              arguments: arguments,
                            )
                          : const ErrorPage(),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: shellNavigatorStructuralKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: BehavioralPage.routeName,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: BehavioralPage(),
              ),
              routes: [
                // child route
                GoRoute(
                  path: PatternPage.routeName,
                  pageBuilder: (context, state) {
                    final arguments = state.extra;

                    return NoTransitionPage(
                      child: arguments is PatternPageArguments
                          ? PatternPage(
                              arguments: arguments,
                            )
                          : const ErrorPage(),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
