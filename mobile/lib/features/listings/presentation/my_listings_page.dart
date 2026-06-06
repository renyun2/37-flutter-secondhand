import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/secondhand_repository.dart';
import '../../shared/widgets/error_view.dart';
import '../../shared/widgets/listing_tile.dart';

class MyListingsPage extends ConsumerStatefulWidget {
  const MyListingsPage({super.key});

  @override
  ConsumerState<MyListingsPage> createState() => _MyListingsPageState();
}

class _MyListingsPageState extends ConsumerState<MyListingsPage> {
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
      final data = await ref.read(secondhandRepositoryProvider).getListings(mine: true);
      setState(() => _listings = data);
    } catch (e) {
      setState(() => _error = e.toString());
    } finally {
      setState(() => _loading = false);
    }
  }

  Future<void> _deactivate(String id) async {
    await ref.read(secondhandRepositoryProvider).deactivateListing(id);
    await _load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('我的发布')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error.isNotEmpty
              ? ErrorView(message: _error, onRetry: _load)
              : ListView.builder(
                  itemCount: _listings.length,
                  itemBuilder: (_, i) {
                    final l = _listings[i];
                    return Column(
                      children: [
                        ListingTile(listing: l),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () => context.push('/listing/${l.id}/edit'),
                              child: const Text('编辑'),
                            ),
                            if (l.status == 'active')
                              TextButton(
                                onPressed: () => _deactivate(l.id),
                                child: const Text('下架'),
                              ),
                          ],
                        ),
                        const Divider(height: 1),
                      ],
                    );
                  },
                ),
    );
  }
}
