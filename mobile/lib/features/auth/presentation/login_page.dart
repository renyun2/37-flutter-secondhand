import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../application/auth_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _phone = TextEditingController(text: '13800138000');
  final _code = TextEditingController(text: '123456');
  var _loading = false;

  Future<void> _login() async {
    setState(() => _loading = true);
    try {
      await ref.read(authProvider.notifier).login(_phone.text.trim(), _code.text.trim());
      if (mounted) context.go('/home');
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('登录')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _phone, decoration: const InputDecoration(labelText: '手机号')),
            TextField(controller: _code, decoration: const InputDecoration(labelText: '验证码（演示 123456）')),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _loading ? null : _login,
                child: _loading ? const CircularProgressIndicator() : const Text('登录'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
