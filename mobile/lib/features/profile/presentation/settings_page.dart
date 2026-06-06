import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/config/api_config.dart';
import '../../../data/repositories/secondhand_repository.dart';
import '../../auth/application/auth_provider.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  String _region = '北京';

  @override
  void initState() {
    super.initState();
    _region = ref.read(authProvider)?.user.region ?? '北京';
  }

  Future<void> _saveRegion(String region) async {
    await ref.read(secondhandRepositoryProvider).updateRegion(region);
    await ref.read(authProvider.notifier).refreshUser();
    setState(() => _region = region);
    if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('区域已更新')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('设置')),
      body: ListView(
        children: [
          const ListTile(title: Text('同城区域（手动选择，Web 兼容）')),
          ...ApiConfig.regions.map(
            (r) => RadioListTile(
              title: Text(r),
              value: r,
              groupValue: _region,
              onChanged: (v) {
                if (v != null) _saveRegion(v);
              },
            ),
          ),
          const Divider(),
          const ListTile(
            title: Text('关于'),
            subtitle: Text('二手闲置 C2C · 担保交易 Mock · 聊天 HTTP 轮询'),
          ),
        ],
      ),
    );
  }
}
