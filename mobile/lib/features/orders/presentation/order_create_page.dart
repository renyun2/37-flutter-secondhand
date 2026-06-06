import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/secondhand_repository.dart';

class OrderCreatePage extends ConsumerStatefulWidget {
  const OrderCreatePage({super.key, required this.listingId});
  final String listingId;

  @override
  ConsumerState<OrderCreatePage> createState() => _OrderCreatePageState();
}

class _OrderCreatePageState extends ConsumerState<OrderCreatePage> {
  Listing? _listing;
  var _deliveryType = 'face';
  String? _addressId;
  var _addresses = <Address>[];
  var _loading = true;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final repo = ref.read(secondhandRepositoryProvider);
    final listing = await repo.getListing(widget.listingId);
    final addresses = await repo.getAddresses();
    setState(() {
      _listing = listing;
      _addresses = addresses;
      _addressId = addresses.where((a) => a.isDefault).firstOrNull?.id ?? addresses.firstOrNull?.id;
      _loading = false;
    });
  }

  Future<void> _submit() async {
    if (_deliveryType == 'mail' && _addressId == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('请选择邮寄地址')));
      return;
    }
    final id = await ref.read(secondhandRepositoryProvider).createOrder(
          listingId: widget.listingId,
          deliveryType: _deliveryType,
          addressId: _deliveryType == 'mail' ? _addressId : null,
        );
    if (mounted) context.go('/order/$id/pay');
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) return const Scaffold(body: Center(child: CircularProgressIndicator()));
    final l = _listing!;
    return Scaffold(
      appBar: AppBar(title: const Text('下单')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(l.title, style: const TextStyle(fontSize: 18)),
          Text('¥${l.price.toStringAsFixed(2)}'),
          const SizedBox(height: 16),
          const Text('交易方式'),
          RadioListTile(
            title: const Text('同城面交'),
            value: 'face',
            groupValue: _deliveryType,
            onChanged: (v) => setState(() => _deliveryType = v!),
          ),
          RadioListTile(
            title: const Text('邮寄'),
            value: 'mail',
            groupValue: _deliveryType,
            onChanged: (v) => setState(() => _deliveryType = v!),
          ),
          if (_deliveryType == 'mail') ...[
            const Text('收货地址'),
            ..._addresses.map(
              (a) => RadioListTile(
                title: Text('${a.name} ${a.phone}'),
                subtitle: Text('${a.province}${a.city}${a.district}${a.detail}'),
                value: a.id,
                groupValue: _addressId,
                onChanged: (v) => setState(() => _addressId = v),
              ),
            ),
          ],
          const SizedBox(height: 24),
          ElevatedButton(onPressed: _submit, child: const Text('提交订单')),
        ],
      ),
    );
  }
}
