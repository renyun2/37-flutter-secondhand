import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/secondhand_repository.dart';
import '../../shared/widgets/error_view.dart';

class OrdersListPage extends ConsumerStatefulWidget {
  const OrdersListPage({super.key, required this.role});
  final String role;

  @override
  ConsumerState<OrdersListPage> createState() => _OrdersListPageState();
}

class _OrdersListPageState extends ConsumerState<OrdersListPage> {
  var _loading = true;
  var _error = '';
  var _orders = <Order>[];

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
      final data = await ref.read(secondhandRepositoryProvider).getOrders(role: widget.role);
      setState(() => _orders = data);
    } catch (e) {
      setState(() => _error = e.toString());
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.role == 'sell' ? '卖出订单' : '买入订单';
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error.isNotEmpty
              ? ErrorView(message: _error, onRetry: _load)
              : ListView.builder(
                  itemCount: _orders.length,
                  itemBuilder: (_, i) {
                    final o = _orders[i];
                    return ListTile(
                      title: Text(o.listingTitle),
                      subtitle: Text('¥${o.amount.toStringAsFixed(0)} · ${o.status}'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => context.push('/order/${o.id}'),
                    );
                  },
                ),
    );
  }
}
