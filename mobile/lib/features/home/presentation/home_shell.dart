import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../auth/application/auth_provider.dart';

class HomeShell extends ConsumerWidget {
  const HomeShell({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final badge = ref.watch(notificationBadgeProvider).valueOrNull ?? 0;
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: navigationShell.goBranch,
        destinations: [
          const NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: '首页'),
          const NavigationDestination(icon: Icon(Icons.add_circle_outline), selectedIcon: Icon(Icons.add_circle), label: '发布'),
          NavigationDestination(
            icon: Badge(isLabelVisible: badge > 0, label: Text('$badge'), child: const Icon(Icons.notifications_outlined)),
            selectedIcon: Badge(isLabelVisible: badge > 0, label: Text('$badge'), child: const Icon(Icons.notifications)),
            label: '消息',
          ),
          const NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: '我的'),
        ],
      ),
    );
  }
}
