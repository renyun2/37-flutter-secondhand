import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/secondhand_repository.dart';
import '../../auth/application/auth_provider.dart';
import '../../shared/widgets/error_view.dart';

class OrderDetailPage extends ConsumerStatefulWidget {
  const OrderDetailPage({super.key, required this.orderId});
  final String orderId;

  @override
  ConsumerState<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends ConsumerState<OrderDetailPage> {
  Order? _order;
  var _logs = <OrderLog>[];
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
      final data = await ref.read(secondhandRepositoryProvider).getOrder(widget.orderId);
      setState(() {
        _order = data.order;
        _logs = data.logs;
      });
    } catch (e) {
      setState(() => _error = e.toString());
    } finally {
      setState(() => _loading = false);
    }
  }

  Future<void> _ship() async {
    await ref.read(secondhandRepositoryProvider).shipOrder(widget.orderId);
    await _load();
  }

  Future<void> _confirm() async {
    await ref.read(secondhandRepositoryProvider).confirmOrder(widget.orderId);
    await _load();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) return const Scaffold(body: Center(child: CircularProgressIndicator()));
    if (_error.isNotEmpty) return Scaffold(body: ErrorView(message: _error, onRetry: _load));
    final o = _order!;
    final me = ref.read(authProvider)!.user.id;
    final isBuyer = o.buyerId == me;
    final isSeller = o.sellerId == me;

    return Scaffold(
      appBar: AppBar(
        title: const Text('订单详情'),
        actions: [
          if (isBuyer && ['paid', 'shipped'].contains(o.status))
            TextButton(
              onPressed: () => context.push('/order/${o.id}/dispute'),
              child: const Text('纠纷'),
            ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(o.listingTitle, style: const TextStyle(fontSize: 18)),
          Text('状态：${o.status}'),
          Text('金额 ¥${o.amount.toStringAsFixed(2)}'),
          Text('方式：${o.deliveryType == 'mail' ? '邮寄' : '面交'}'),
          if (o.trackingNo != null) Text('物流：${o.trackingNo}'),
          if (o.disputeUntil != null) Text('纠纷冻结至：${o.disputeUntil}'),
          const SizedBox(height: 16),
          const Text('状态轴', style: TextStyle(fontWeight: FontWeight.bold)),
          ..._logs.map((l) => ListTile(
                dense: true,
                title: Text(l.message),
                subtitle: Text(l.createdAt ?? ''),
              )),
          if (o.status == 'pending_payment' && isBuyer)
            ElevatedButton(onPressed: () => context.push('/order/${o.id}/pay'), child: const Text('去支付')),
          if (o.status == 'paid' && isSeller && o.deliveryType == 'mail')
            ElevatedButton(onPressed: _ship, child: const Text('标记发货')),
          if (isBuyer &&
              ((o.deliveryType == 'face' && o.status == 'paid') ||
                  (o.deliveryType == 'mail' && o.status == 'shipped')))
            ElevatedButton(onPressed: _confirm, child: const Text('确认收货')),
        ],
      ),
    );
  }
}
