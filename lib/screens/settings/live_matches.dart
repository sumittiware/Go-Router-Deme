import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_flutter/routes/page_config.dart';

class LiveMatches extends StatefulWidget {
  const LiveMatches({super.key});

  @override
  State<LiveMatches> createState() => _LiveMatchesState();
}

class _LiveMatchesState extends State<LiveMatches> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildItem("4"),
        _buildItem("5"),
        _buildItem("6"),
      ],
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
