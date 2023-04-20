import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routes/page_config.dart';

class CompletedMatches extends StatefulWidget {
  const CompletedMatches({super.key});

  @override
  State<CompletedMatches> createState() => _CompletedMatchesState();
}

class _CompletedMatchesState extends State<CompletedMatches> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildItem("7"),
        _buildItem("8"),
        _buildItem("9"),
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
