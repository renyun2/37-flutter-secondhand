import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/secondhand_repository.dart';

class OrderPayPage extends ConsumerStatefulWidget {
  const OrderPayPage({super.key, required this.orderId});
  final String orderId;

  @override
  ConsumerState<OrderPayPage> createState() => _OrderPayPageState();
}

class _OrderPayPageState extends ConsumerState<OrderPayPage> {
  Order? _order;
  var _loading = true;
  var _paying = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final data = await ref.read(secondhandRepositoryProvider).getOrder(widget.orderId);
    setState(() {
      _order = data.order;
      _loading = false;
    });
  }

  Future<void> _pay() async {
    setState(() => _paying = true);
    try {
      await ref.read(secondhandRepositoryProvider).payOrder(widget.orderId);
      if (mounted) context.go('/order/${widget.orderId}');
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      if (mounted) setState(() => _paying = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) return const Scaffold(body: Center(child: CircularProgressIndicator()));
    final o = _order!;
    return Scaffold(
      appBar: AppBar(title: const Text('支付托管')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(o.listingTitle, style: const TextStyle(fontSize: 18)),
            Text('金额 ¥${o.amount.toStringAsFixed(2)}'),
            const SizedBox(height: 12),
            const Text('Mock 担保交易：支付后资金进入平台托管，确认收货后放款给卖家。'),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _paying ? null : _pay,
                child: _paying ? const CircularProgressIndicator() : const Text('Mock 支付'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
