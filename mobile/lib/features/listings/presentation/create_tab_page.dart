import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateTabPage extends StatelessWidget {
  const CreateTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('发布')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.sell),
            title: const Text('发布闲置'),
            subtitle: const Text('信用分≥60 可发布'),
            onTap: () => context.push('/listing/create'),
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text('发布求购'),
            onTap: () => context.push('/wanted/create'),
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('我的发布'),
            onTap: () => context.push('/my-listings'),
          ),
        ],
      ),
    );
  }
}
