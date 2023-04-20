import 'package:flutter/material.dart';
import 'package:go_router_flutter/screens/settings/completed_matches.dart';
import 'package:go_router_flutter/screens/settings/live_matches.dart';
import 'package:go_router_flutter/screens/settings/upcomming_screen.dart';

class SettingsScreen extends StatefulWidget {
  final int index;
  const SettingsScreen({
    super.key,
    this.index = 0,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      initialIndex: widget.index,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: [
              _buildTabBarItem('Upcoming', 0),
              _buildTabBarItem('Live', 1),
              _buildTabBarItem('Completed', 2),
            ],
            indicator: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.blue,
                  width: 2,
                ),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                UpcommingScreen(),
                LiveMatches(),
                CompletedMatches()
              ],
            ),
          )
        ],
      ),
    ));
  }

  Widget _buildTabBarItem(name, index) {
    return Tab(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          name,
          textScaleFactor: 1,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildBody(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Tab number $index'),
        const SizedBox(
          height: 8,
        ),
        ElevatedButton(onPressed: () {}, child: const Text('Detail'))
      ],
    );
  }
}
