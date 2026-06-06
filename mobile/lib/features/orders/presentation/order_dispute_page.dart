import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../data/repositories/secondhand_repository.dart';

class OrderDisputePage extends ConsumerStatefulWidget {
  const OrderDisputePage({super.key, required this.orderId});
  final String orderId;

  @override
  ConsumerState<OrderDisputePage> createState() => _OrderDisputePageState();
}

class _OrderDisputePageState extends ConsumerState<OrderDisputePage> {
  final _reason = TextEditingController();
  var _loading = false;

  Future<void> _submit() async {
    if (_reason.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('请填写纠纷原因')));
      return;
    }
    setState(() => _loading = true);
    try {
      await ref.read(secondhandRepositoryProvider).disputeOrder(widget.orderId, _reason.text.trim());
      if (mounted) context.go('/order/${widget.orderId}');
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('申请纠纷')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('提交后资金将冻结 7 天，卖家信用 -10'),
            const SizedBox(height: 12),
            TextField(
              controller: _reason,
              decoration: const InputDecoration(labelText: '纠纷原因'),
              maxLines: 4,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _loading ? null : _submit,
                child: _loading ? const CircularProgressIndicator() : const Text('提交纠纷'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
