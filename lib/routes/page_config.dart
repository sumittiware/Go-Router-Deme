import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_flutter/screens/home/home_detail_screen.dart';
import 'package:go_router_flutter/screens/home/home_list_screen.dart';
import 'package:go_router_flutter/screens/home/home_screen.dart';
import 'package:go_router_flutter/screens/profile/profile_detail_screen.dart';
import 'package:go_router_flutter/screens/profile/profile_edit_screen.dart';
import 'package:go_router_flutter/screens/profile/profile_screen.dart';
import 'package:go_router_flutter/screens/settings/settings_screen.dart';
import 'package:go_router_flutter/screens/tabs_screen.dart';
import 'package:go_router_flutter/screens/wallets/add_money.dart';
import 'package:go_router_flutter/screens/wallets/transactions_list.dart';
import 'package:go_router_flutter/screens/wallets/wallet_screen.dart';

class PageConfig {
  String name;
  String path;
  Page<dynamic> Function(BuildContext, GoRouterState)? builder;
  Page<dynamic> Function(BuildContext, GoRouterState, Widget)?
      shellRouterBuilder;

  PageConfig({
    required this.name,
    required this.path,
    this.builder,
    this.shellRouterBuilder,
  });
}

final tabsPageConfig = PageConfig(
  name: 'tabs',
  path: '/',
  shellRouterBuilder: (_, __, child) {
    return NoTransitionPage(child: TabsScreen(child: child));
  },
);

final homePageConfig = PageConfig(
  name: 'home',
  path: '/home',
  builder: (context, state) {
    return const NoTransitionPage(child: HomeScreen());
  },
);

final homeListPageConfig = PageConfig(
  name: 'home-list',
  path: 'list/:id1',
  builder: (p0, p1) {
    return CustomTransitionPage(
      transitionDuration: const Duration(milliseconds: 200),
      reverseTransitionDuration: const Duration(milliseconds: 200),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(1.0, 0.0),
            end: const Offset(0.0, 0.0),
          ).animate(animation),
          child: child,
        );
      },
      child: HomeListScreen(
        id: p1.params['id1']!,
      ),
    );
  },
);

final homeDetailPageConfig = PageConfig(
  name: 'home-detail',
  path: 'detail/:id2',
  builder: (p0, p1) {
    return CustomTransitionPage(
        transitionDuration: const Duration(milliseconds: 200),
        reverseTransitionDuration: const Duration(milliseconds: 200),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween(
              begin: const Offset(1.0, 0.0),
              end: const Offset(0.0, 0.0),
            ).animate(animation),
            child: child,
          );
        },
        child: HomeDetailScreen(
          id: p1.params['id2']!,
        ));
  },
);

final settingsPageConfig = PageConfig(
  name: 'settings',
  path: '/settings',
  builder: (p0, p1) {
    return const NoTransitionPage(child: SettingsScreen());
  },
);

final profilePageConfig = PageConfig(
  name: 'profile',
  path: '/profile',
  builder: (p0, p1) {
    return CustomTransitionPage(
      transitionDuration: const Duration(milliseconds: 200),
      reverseTransitionDuration: const Duration(milliseconds: 200),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(-1.0, 0.0),
            end: const Offset(0.0, 0.0),
          ).animate(animation),
          child: child,
        );
      },
      child: const ProfileScreen(),
    );
  },
);

final profileDetailPageConfig = PageConfig(
  name: 'profile-detail',
  path: 'detail/:name',
  builder: (p0, p1) {
    return CustomTransitionPage(
        transitionDuration: const Duration(milliseconds: 200),
        reverseTransitionDuration: const Duration(milliseconds: 200),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween(
              begin: const Offset(1.0, 0.0),
              end: const Offset(0.0, 0.0),
            ).animate(animation),
            child: child,
          );
        },
        child: ProfileDetailScreen(
          name: p1.params['name']!,
        ));
  },
);

final profileEditPageConfig = PageConfig(
  name: 'profile-edit',
  path: 'edit',
  builder: (p0, p1) {
    return CustomTransitionPage(
        transitionDuration: const Duration(milliseconds: 200),
        reverseTransitionDuration: const Duration(milliseconds: 200),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween(
              begin: const Offset(1.0, 0.0),
              end: const Offset(0.0, 0.0),
            ).animate(animation),
            child: child,
          );
        },
        child: const ProfileEditScreen());
  },
);

final walletPageConfig = PageConfig(
  name: 'wallet',
  path: '/wallet',
  builder: (p0, p1) {
    return const NoTransitionPage(
      child: WalletScreen(),
    );
  },
);

final transactionPageConfig = PageConfig(
  name: 'transactions',
  path: 'transactions',
  builder: (p0, p1) {
    return CustomTransitionPage(
        transitionDuration: const Duration(milliseconds: 200),
        reverseTransitionDuration: const Duration(milliseconds: 200),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween(
              begin: const Offset(1.0, 0.0),
              end: const Offset(0.0, 0.0),
            ).animate(animation),
            child: child,
          );
        },
        child: const TransactionsList());
  },
);

final addMoneyPAgeConfig = PageConfig(
  name: 'add-money',
  path: 'add-money',
  builder: (p0, p1) {
    return CustomTransitionPage(
        transitionDuration: const Duration(milliseconds: 200),
        reverseTransitionDuration: const Duration(milliseconds: 200),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween(
              begin: const Offset(1.0, 0.0),
              end: const Offset(0.0, 0.0),
            ).animate(animation),
            child: child,
          );
        },
        child: const AddMoney());
  },
);
