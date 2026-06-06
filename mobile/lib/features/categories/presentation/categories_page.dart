import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/secondhand_repository.dart';
import '../../shared/widgets/error_view.dart';

class CategoriesPage extends ConsumerStatefulWidget {
  const CategoriesPage({super.key});

  @override
  ConsumerState<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends ConsumerState<CategoriesPage> {
  var _loading = true;
  var _error = '';
  var _categories = <CategoryItem>[];

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
      final data = await ref.read(secondhandRepositoryProvider).getCategories();
      setState(() => _categories = data);
    } catch (e) {
      setState(() => _error = e.toString());
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('分类')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error.isNotEmpty
              ? ErrorView(message: _error, onRetry: _load)
              : ListView.builder(
                  itemCount: _categories.length,
                  itemBuilder: (_, i) {
                    final c = _categories[i];
                    return ListTile(
                      title: Text(c.name),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => context.push('/listings?categoryId=${c.id}&name=${Uri.encodeComponent(c.name)}'),
                    );
                  },
                ),
    );
  }
}
