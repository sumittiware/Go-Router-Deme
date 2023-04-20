import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_flutter/routes/page_config.dart';

class HomeListScreen extends StatefulWidget {
  final String id;

  const HomeListScreen({
    super.key,
    required this.id,
  });

  @override
  State<HomeListScreen> createState() => _HomeListScreenState();
}

class _HomeListScreenState extends State<HomeListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home List Screen ${widget.id}'),
      ),
      body: ListView(
        children: List.generate(10, (index) {
          final val = (int.parse(widget.id) + index).toString();
          return _buildItem(val);
        }),
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
          context.pushNamed(homeDetailPageConfig.name, params: {
            "id1": widget.id,
            "id2": id,
          });
        },
        child: Center(
          child: Text('ID : $id'),
        ),
      ),
    );
  }
}
