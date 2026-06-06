import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/secondhand_repository.dart';
import '../../shared/widgets/error_view.dart';
import '../../shared/widgets/listing_tile.dart';

class ListingsPage extends ConsumerStatefulWidget {
  const ListingsPage({super.key, this.categoryId, this.categoryName});
  final String? categoryId;
  final String? categoryName;

  @override
  ConsumerState<ListingsPage> createState() => _ListingsPageState();
}

class _ListingsPageState extends ConsumerState<ListingsPage> {
  final _search = TextEditingController();
  var _loading = true;
  var _error = '';
  var _listings = <Listing>[];

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
      final data = await ref.read(secondhandRepositoryProvider).getListings(
            categoryId: widget.categoryId,
            q: _search.text.trim().isEmpty ? null : _search.text.trim(),
          );
      setState(() => _listings = data);
    } catch (e) {
      setState(() => _error = e.toString());
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.categoryName ?? '商品列表')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _search,
                    decoration: const InputDecoration(hintText: '搜索商品'),
                    onSubmitted: (_) => _load(),
                  ),
                ),
                IconButton(icon: const Icon(Icons.search), onPressed: _load),
              ],
            ),
          ),
          Expanded(
            child: _loading
                ? const Center(child: CircularProgressIndicator())
                : _error.isNotEmpty
                    ? ErrorView(message: _error, onRetry: _load)
                    : ListView.builder(
                        itemCount: _listings.length,
                        itemBuilder: (_, i) => ListingTile(listing: _listings[i]),
                      ),
          ),
        ],
      ),
    );
  }
}
