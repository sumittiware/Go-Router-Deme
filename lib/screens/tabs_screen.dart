import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_flutter/routes/page_config.dart';
import 'package:go_router_flutter/widgets/custom_nav_bottom_bar.dart';

class TabsScreen extends StatefulWidget {
  final Widget child;
  const TabsScreen({
    super.key,
    required this.child,
  });

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final tabs = [
    CustomNavBarTabItem(
      icon: const Icon(Icons.home),
      label: 'Home',
      initialLocation: homePageConfig.path,
    ),
    CustomNavBarTabItem(
      icon: const Icon(Icons.settings),
      label: 'Settings',
      initialLocation: settingsPageConfig.path,
    ),
    CustomNavBarTabItem(
      icon: const Icon(Icons.wallet),
      label: 'Wallet',
      initialLocation: walletPageConfig.path,
    ),
  ];

  void _onItemTap(int tabIndex) {
    context.go(tabs[tabIndex].initialLocation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pushNamed(
              profilePageConfig.name,
            );
          },
          icon: const Icon(
            Icons.account_circle_outlined,
            color: Colors.white,
          ),
        ),
        title: const Text('Go router demo!'),
      ),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateSelectedIndex(context),
        onTap: _onItemTap,
        items: tabs,
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith(homePageConfig.path)) {
      return 0;
    }
    if (location.startsWith(settingsPageConfig.path)) {
      return 1;
    }
    if (location.startsWith(walletPageConfig.path)) {
      return 2;
    }
    return 0;
  }
}
