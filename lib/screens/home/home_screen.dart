import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_flutter/routes/page_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextButton(
                onPressed: () {
                  context.go(settingsPageConfig.path);
                },
                child: const Text('View All')),
          ),
          Expanded(
            child: ListView(
              children: List.generate(6, (index) {
                return _buildItem(((index + 1) * 10).toString());
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(String id) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          context.pushNamed(homeListPageConfig.name, params: {
            "id1": id,
          });
        },
        child: Center(
          child: Text('ID : $id'),
        ),
      ),
    );
  }
}
