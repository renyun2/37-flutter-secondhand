import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/api_config.dart';
import '../../../data/models/models.dart';
import '../../../data/repositories/secondhand_repository.dart';
import '../../auth/application/auth_provider.dart';
import '../../shared/widgets/error_view.dart';
import '../../shared/widgets/listing_tile.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  String? _region;
  var _loading = true;
  var _error = '';
  var _listings = <Listing>[];

  @override
  void initState() {
    super.initState();
    _region = ref.read(authProvider)?.user.region;
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = '';
    });
    try {
      final repo = ref.read(secondhandRepositoryProvider);
      final data = await repo.getListings(region: _region);
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
      appBar: AppBar(
        title: const Text('推荐'),
        actions: [
          IconButton(icon: const Icon(Icons.category), onPressed: () => context.push('/categories')),
          IconButton(icon: const Icon(Icons.search), onPressed: () => context.push('/listings')),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: DropdownButtonFormField<String>(
              value: _region,
              decoration: const InputDecoration(labelText: '同城区域'),
              items: ApiConfig.regions.map((r) => DropdownMenuItem(value: r, child: Text(r))).toList(),
              onChanged: (v) {
                setState(() => _region = v);
                _load();
              },
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
