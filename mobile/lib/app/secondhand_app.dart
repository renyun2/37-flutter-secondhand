import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_router.dart';

class SecondhandApp extends ConsumerWidget {
  const SecondhandApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: '二手闲置',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
      routerConfig: router,
    );
  }
}
