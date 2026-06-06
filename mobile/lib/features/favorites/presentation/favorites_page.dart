import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/secondhand_repository.dart';
import '../../shared/widgets/error_view.dart';
import '../../shared/widgets/listing_tile.dart';

class FavoritesPage extends ConsumerStatefulWidget {
  const FavoritesPage({super.key});

  @override
  ConsumerState<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends ConsumerState<FavoritesPage> {
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
      final data = await ref.read(secondhandRepositoryProvider).getFavorites();
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
      appBar: AppBar(title: const Text('收藏')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error.isNotEmpty
              ? ErrorView(message: _error, onRetry: _load)
              : _listings.isEmpty
                  ? const Center(child: Text('暂无收藏'))
                  : ListView.builder(
                      itemCount: _listings.length,
                      itemBuilder: (_, i) => ListingTile(listing: _listings[i].copyWith(favorited: true)),
                    ),
    );
  }
}
