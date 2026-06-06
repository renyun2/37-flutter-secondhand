import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/secondhand_repository.dart';
import '../../auth/application/auth_provider.dart';
import '../../shared/widgets/error_view.dart';

class MessagesPage extends ConsumerStatefulWidget {
  const MessagesPage({super.key});

  @override
  ConsumerState<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends ConsumerState<MessagesPage> {
  var _loading = true;
  var _error = '';
  var _notifications = <AppNotification>[];

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
      final data = await ref.read(secondhandRepositoryProvider).getNotifications();
      setState(() => _notifications = data.notifications);
      ref.invalidate(notificationBadgeProvider);
    } catch (e) {
      setState(() => _error = e.toString());
    } finally {
      setState(() => _loading = false);
    }
  }

  Future<void> _readAll() async {
    await ref.read(secondhandRepositoryProvider).readAllNotifications();
    await _load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('消息'),
        actions: [
          TextButton(onPressed: _readAll, child: const Text('全部已读')),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error.isNotEmpty
              ? ErrorView(message: _error, onRetry: _load)
              : ListView.builder(
                  itemCount: _notifications.length,
                  itemBuilder: (_, i) {
                    final n = _notifications[i];
                    return ListTile(
                      leading: Icon(n.read ? Icons.mark_email_read : Icons.mark_email_unread),
                      title: Text(n.title),
                      subtitle: Text(n.body),
                    );
                  },
                ),
    );
  }
}
