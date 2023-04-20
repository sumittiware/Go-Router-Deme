import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileDetailScreen extends StatelessWidget {
  final String name;

  const ProfileDetailScreen({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Detail Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Profile Detail for $name"),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(
                  "profile-edit",
                  params: {
                    "name": name,
                  },
                );
              },
              child: const Text('Edit Profile'),
            )
          ],
        ),
      ),
    );
  }
}
