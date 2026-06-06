import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/secondhand_repository.dart';
import '../../shared/widgets/error_view.dart';

class WantedPage extends ConsumerStatefulWidget {
  const WantedPage({super.key});

  @override
  ConsumerState<WantedPage> createState() => _WantedPageState();
}

class _WantedPageState extends ConsumerState<WantedPage> {
  var _loading = true;
  var _error = '';
  var _posts = <WantedPost>[];

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
      final data = await ref.read(secondhandRepositoryProvider).getWanted();
      setState(() => _posts = data);
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
        title: const Text('求购广场'),
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: () => context.push('/wanted/create')),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error.isNotEmpty
              ? ErrorView(message: _error, onRetry: _load)
              : ListView.builder(
                  itemCount: _posts.length,
                  itemBuilder: (_, i) {
                    final p = _posts[i];
                    return ListTile(
                      title: Text(p.title),
                      subtitle: Text('${p.region} · 预算 ${p.budget?.toStringAsFixed(0) ?? '面议'} · ${p.authorName}'),
                    );
                  },
                ),
    );
  }
}
