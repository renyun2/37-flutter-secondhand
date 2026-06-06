import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/secondhand_repository.dart';
import '../../shared/widgets/error_view.dart';

class ListingDetailPage extends ConsumerStatefulWidget {
  const ListingDetailPage({super.key, required this.listingId});
  final String listingId;

  @override
  ConsumerState<ListingDetailPage> createState() => _ListingDetailPageState();
}

class _ListingDetailPageState extends ConsumerState<ListingDetailPage> {
  Listing? _listing;
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
      final data = await ref.read(secondhandRepositoryProvider).getListing(widget.listingId);
      setState(() => _listing = data);
    } catch (e) {
      setState(() => _error = e.toString());
    } finally {
      setState(() => _loading = false);
    }
  }

  Future<void> _toggleFavorite() async {
    final repo = ref.read(secondhandRepositoryProvider);
    final l = _listing!;
    if (l.favorited) {
      await repo.removeFavorite(l.id);
    } else {
      await repo.addFavorite(l.id);
    }
    await _load();
  }

  Future<void> _report() async {
    final reason = await showDialog<String>(
      context: context,
      builder: (ctx) {
        final c = TextEditingController();
        return AlertDialog(
          title: const Text('举报商品'),
          content: TextField(controller: c, decoration: const InputDecoration(hintText: '举报原因')),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('取消')),
            TextButton(onPressed: () => Navigator.pop(ctx, c.text), child: const Text('提交')),
          ],
        );
      },
    );
    if (reason == null || reason.trim().isEmpty) return;
    await ref.read(secondhandRepositoryProvider).report(
          targetType: 'listing',
          targetId: widget.listingId,
          reason: reason.trim(),
        );
    if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('举报已提交')));
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) return const Scaffold(body: Center(child: CircularProgressIndicator()));
    if (_error.isNotEmpty) return Scaffold(body: ErrorView(message: _error, onRetry: _load));
    final l = _listing!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('商品详情'),
        actions: [
          IconButton(icon: const Icon(Icons.flag), onPressed: _report),
          IconButton(
            icon: Icon(l.favorited ? Icons.favorite : Icons.favorite_border),
            onPressed: _toggleFavorite,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CachedNetworkImage(imageUrl: l.imageUrl, height: 220, fit: BoxFit.cover),
          const SizedBox(height: 12),
          Text(l.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text('¥${l.price.toStringAsFixed(2)}'),
          Text('${l.region} · ${l.categoryName} · 卖家 ${l.sellerName}'),
          const SizedBox(height: 12),
          Text(l.description),
        ],
      ),
      bottomNavigationBar: l.isOwner
          ? null
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => context.push('/chat/${l.id}'),
                        child: const Text('议价聊天'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => context.push('/order/create?listingId=${l.id}'),
                        child: const Text('立即购买'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
