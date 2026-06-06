import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../auth/application/auth_provider.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    _boot();
  }

  Future<void> _boot() async {
    await Future.delayed(const Duration(milliseconds: 600));
    await ref.read(authProvider.notifier).restore();
    if (!mounted) return;
    final authed = ref.read(authProvider) != null;
    context.go(authed ? '/home' : '/login');
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('二手闲置', style: TextStyle(fontSize: 24))),
    );
  }
}
