import 'package:flutter/material.dart';

class HomeDetailScreen extends StatelessWidget {
  final String id;
  const HomeDetailScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Detail Screen'),
      ),
      body: Center(
        child: Text('Params is $id'),
      ),
    );
  }
}
