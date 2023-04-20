import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_flutter/routes/page_config.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.pushNamed(transactionPageConfig.name);
              },
              child: const Text("View Transactions"),
            ),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(addMoneyPAgeConfig.name);
              },
              child: const Text("Add Money"),
            ),
          ],
        ),
      ),
    );
  }
}
