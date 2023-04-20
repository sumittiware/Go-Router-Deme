import 'package:flutter/material.dart';
import 'package:go_router_flutter/routes/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Go Router',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: CustomRouter().getAppRoutes(),
    );
  }
}
