import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/api_config.dart';
import '../../../data/models/models.dart';
import '../../../data/repositories/secondhand_repository.dart';
import '../../auth/application/auth_provider.dart';

class ListingFormPage extends ConsumerStatefulWidget {
  const ListingFormPage({super.key, this.listingId});
  final String? listingId;

  @override
  ConsumerState<ListingFormPage> createState() => _ListingFormPageState();
}

class _ListingFormPageState extends ConsumerState<ListingFormPage> {
  final _title = TextEditingController();
  final _desc = TextEditingController();
  final _price = TextEditingController();
  final _imageUrl = TextEditingController();
  String? _categoryId;
  String _region = '北京';
  var _categories = <CategoryItem>[];
  var _loading = false;

  @override
  void initState() {
    super.initState();
    _region = ref.read(authProvider)?.user.region ?? '北京';
    _init();
  }

  Future<void> _init() async {
    final repo = ref.read(secondhandRepositoryProvider);
    _categories = await repo.getCategories();
    if (widget.listingId != null) {
      final l = await repo.getListing(widget.listingId!);
      _title.text = l.title;
      _desc.text = l.description;
      _price.text = l.price.toString();
      _imageUrl.text = l.imageUrl;
      _categoryId = l.categoryId;
      _region = l.region;
    } else if (_categories.isNotEmpty) {
      _categoryId = _categories.first.id;
    }
    if (mounted) setState(() {});
  }

  Future<void> _submit() async {
    if (_title.text.trim().isEmpty || _price.text.trim().isEmpty || _categoryId == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('请填写完整信息')));
      return;
    }
    setState(() => _loading = true);
    try {
      final repo = ref.read(secondhandRepositoryProvider);
      final data = {
        'title': _title.text.trim(),
        'description': _desc.text.trim(),
        'price': double.parse(_price.text.trim()),
        'categoryId': _categoryId,
        'region': _region,
        if (_imageUrl.text.trim().isNotEmpty) 'imageUrl': _imageUrl.text.trim(),
      };
      if (widget.listingId != null) {
        await repo.updateListing(widget.listingId!, data);
      } else {
        await repo.createListing(data);
      }
      if (mounted) context.pop();
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.listingId != null;
    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? '编辑商品' : '发布闲置')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(controller: _title, decoration: const InputDecoration(labelText: '标题')),
          TextField(controller: _desc, decoration: const InputDecoration(labelText: '描述'), maxLines: 3),
          TextField(controller: _price, decoration: const InputDecoration(labelText: '价格'), keyboardType: TextInputType.number),
          TextField(controller: _imageUrl, decoration: const InputDecoration(labelText: '图片 URL（可选）')),
          DropdownButtonFormField<String>(
            value: _categoryId,
            decoration: const InputDecoration(labelText: '分类'),
            items: _categories.map((c) => DropdownMenuItem(value: c.id, child: Text(c.name))).toList(),
            onChanged: (v) => setState(() => _categoryId = v),
          ),
          DropdownButtonFormField<String>(
            value: _region,
            decoration: const InputDecoration(labelText: '区域'),
            items: ApiConfig.regions.map((r) => DropdownMenuItem(value: r, child: Text(r))).toList(),
            onChanged: (v) => setState(() => _region = v ?? _region),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _loading ? null : _submit,
            child: _loading ? const CircularProgressIndicator() : Text(isEdit ? '保存' : '发布'),
          ),
        ],
      ),
    );
  }
}
