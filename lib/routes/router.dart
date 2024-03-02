import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_flutter/routes/page_config.dart';
import 'package:go_router_flutter/screens/tabs_screen.dart';

class CustomRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(
    debugLabel: 'root',
  );

  static final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>(
    debugLabel: 'shell',
  );

  static GlobalKey<NavigatorState> get rootNavigatorKey => _rootNavigatorKey;
  static GlobalKey<NavigatorState> get shellNavigatorKey => _shellNavigatorKey;

  GoRouter getAppRoutes() {
    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: homePageConfig.path,
      routes: [
        // Tab Screen on the root
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return TabsScreen(child: child);
          },
          routes: [
            // Home Route
            GoRoute(
              name: homePageConfig.name,
              path: homePageConfig.path,
              pageBuilder: homePageConfig.builder,
              parentNavigatorKey: _shellNavigatorKey,
              routes: [
                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  name: homeListPageConfig.name,
                  path: homeListPageConfig.path,
                  pageBuilder: homeListPageConfig.builder,
                  routes: [
                    GoRoute(
                      parentNavigatorKey: _rootNavigatorKey,
                      name: homeDetailPageConfig.name,
                      path: homeDetailPageConfig.path,
                      pageBuilder: homeDetailPageConfig.builder,
                    )
                  ],
                )
              ],
            ),
            // Setting Tab Route
            GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              name: settingsPageConfig.name,
              path: settingsPageConfig.path,
              pageBuilder: settingsPageConfig.builder,
            ),
            // Wallet Tab Routes
            GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              name: walletPageConfig.name,
              path: walletPageConfig.path,
              pageBuilder: walletPageConfig.builder,
              routes: [
                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  name: transactionPageConfig.name,
                  path: transactionPageConfig.path,
                  pageBuilder: transactionPageConfig.builder,
                ),
                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  name: addMoneyPAgeConfig.name,
                  path: addMoneyPAgeConfig.path,
                  pageBuilder: addMoneyPAgeConfig.builder,
                )
              ],
            )
          ],
        ),
        // Profile page route
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          name: profilePageConfig.name,
          path: profilePageConfig.path,
          pageBuilder: profilePageConfig.builder,
          routes: [
            GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              name: profileDetailPageConfig.name,
              path: profileDetailPageConfig.path,
              pageBuilder: profileDetailPageConfig.builder,
              routes: [
                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  name: profileEditPageConfig.name,
                  path: profileEditPageConfig.path,
                  pageBuilder: profileEditPageConfig.builder,
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
