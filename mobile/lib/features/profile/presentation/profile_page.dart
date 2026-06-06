import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../auth/application/auth_provider.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider)?.user;
    return Scaffold(
      appBar: AppBar(title: const Text('我的')),
      body: ListView(
        children: [
          ListTile(
            title: Text(user?.nickname ?? ''),
            subtitle: Text('${user?.phone ?? ''} · ${user?.region ?? ''} · 信用 ${user?.creditScore ?? 0}'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text('买入订单'),
            onTap: () => context.push('/orders/buy'),
          ),
          ListTile(
            leading: const Icon(Icons.sell),
            title: const Text('卖出订单'),
            onTap: () => context.push('/orders/sell'),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('收藏'),
            onTap: () => context.push('/favorites'),
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('我的发布'),
            onTap: () => context.push('/my-listings'),
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart_checkout),
            title: const Text('求购广场'),
            onTap: () => context.push('/wanted'),
          ),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text('信用中心'),
            onTap: () => context.push('/credit'),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('设置'),
            onTap: () => context.push('/settings'),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('退出登录'),
            onTap: () async {
              await ref.read(authProvider.notifier).logout();
              if (context.mounted) context.go('/login');
            },
          ),
        ],
      ),
    );
  }
}
