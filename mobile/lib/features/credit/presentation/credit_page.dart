import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/secondhand_repository.dart';
import '../../shared/widgets/error_view.dart';

class CreditPage extends ConsumerStatefulWidget {
  const CreditPage({super.key});

  @override
  ConsumerState<CreditPage> createState() => _CreditPageState();
}

class _CreditPageState extends ConsumerState<CreditPage> {
  CreditInfo? _credit;
  var _loading = true;
  var _error = '';

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = '';
    });
    try {
      final data = await ref.read(secondhandRepositoryProvider).getCredit();
      setState(() => _credit = data);
    } catch (e) {
      setState(() => _error = e.toString());
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('信用中心')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error.isNotEmpty
              ? ErrorView(message: _error, onRetry: _load)
              : ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Text('信用分：${_credit!.score}', style: const TextStyle(fontSize: 32)),
                    Text(_credit!.canPublish ? '可正常发布商品' : '信用分不足 ${_credit!.minPublish}，暂不可发布'),
                    const SizedBox(height: 8),
                    const Text('规则：成交 +2，纠纷 -10'),
                    const Divider(),
                    const Text('信用记录', style: TextStyle(fontWeight: FontWeight.bold)),
                    ..._credit!.logs.map(
                      (l) => ListTile(
                        title: Text(l.reason),
                        trailing: Text(l.delta >= 0 ? '+${l.delta}' : '${l.delta}'),
                        subtitle: Text(l.createdAt ?? ''),
                      ),
                    ),
                  ],
                ),
    );
  }
}
