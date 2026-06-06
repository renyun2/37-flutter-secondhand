import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/api_config.dart';
import '../../../data/models/models.dart';
import '../../../data/repositories/secondhand_repository.dart';
import '../../auth/application/auth_provider.dart';

class WantedCreatePage extends ConsumerStatefulWidget {
  const WantedCreatePage({super.key});

  @override
  ConsumerState<WantedCreatePage> createState() => _WantedCreatePageState();
}

class _WantedCreatePageState extends ConsumerState<WantedCreatePage> {
  final _title = TextEditingController();
  final _desc = TextEditingController();
  final _budget = TextEditingController();
  String _region = '北京';
  String? _categoryId;
  var _categories = <CategoryItem>[];
  var _loading = false;

  @override
  void initState() {
    super.initState();
    _region = ref.read(authProvider)?.user.region ?? '北京';
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    final cats = await ref.read(secondhandRepositoryProvider).getCategories();
    setState(() {
      _categories = cats;
      _categoryId = cats.firstOrNull?.id;
    });
  }

  Future<void> _submit() async {
    if (_title.text.trim().isEmpty) return;
    setState(() => _loading = true);
    try {
      await ref.read(secondhandRepositoryProvider).createWanted({
        'title': _title.text.trim(),
        'description': _desc.text.trim(),
        if (_budget.text.trim().isNotEmpty) 'budget': double.parse(_budget.text.trim()),
        'region': _region,
        if (_categoryId != null) 'categoryId': _categoryId,
      });
      if (mounted) context.pop();
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('发求购')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(controller: _title, decoration: const InputDecoration(labelText: '求购标题')),
          TextField(controller: _desc, decoration: const InputDecoration(labelText: '描述'), maxLines: 3),
          TextField(controller: _budget, decoration: const InputDecoration(labelText: '预算（可选）'), keyboardType: TextInputType.number),
          DropdownButtonFormField<String>(
            value: _region,
            decoration: const InputDecoration(labelText: '区域'),
            items: ApiConfig.regions.map((r) => DropdownMenuItem(value: r, child: Text(r))).toList(),
            onChanged: (v) => setState(() => _region = v ?? _region),
          ),
          DropdownButtonFormField<String>(
            value: _categoryId,
            decoration: const InputDecoration(labelText: '分类'),
            items: _categories.map((c) => DropdownMenuItem(value: c.id, child: Text(c.name))).toList(),
            onChanged: (v) => setState(() => _categoryId = v),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _loading ? null : _submit,
            child: _loading ? const CircularProgressIndicator() : const Text('发布'),
          ),
        ],
      ),
    );
  }
}
