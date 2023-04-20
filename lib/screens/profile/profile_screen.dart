import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_flutter/routes/page_config.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Profile Screen'),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(
                  profileDetailPageConfig.name,
                  params: {"name": "Sumit Tiware"},
                );
              },
              child: const Text('Move to Profile'),
            )
          ],
        ),
      ),
    );
  }
}
