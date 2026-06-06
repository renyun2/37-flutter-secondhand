import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/secondhand_repository.dart';

class ChatPage extends ConsumerStatefulWidget {
  const ChatPage({super.key, required this.listingId});
  final String listingId;

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  final _input = TextEditingController();
  var _messages = <ChatMessage>[];
  Timer? _timer;
  var _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
    _timer = Timer.periodic(const Duration(seconds: 3), (_) => _load(silent: true));
  }

  @override
  void dispose() {
    _timer?.cancel();
    _input.dispose();
    super.dispose();
  }

  Future<void> _load({bool silent = false}) async {
    if (!silent) setState(() => _loading = true);
    try {
      final data = await ref.read(secondhandRepositoryProvider).getChatMessages(widget.listingId);
      if (mounted) setState(() => _messages = data);
    } finally {
      if (!silent && mounted) setState(() => _loading = false);
    }
  }

  Future<void> _send() async {
    final text = _input.text.trim();
    if (text.isEmpty) return;
    await ref.read(secondhandRepositoryProvider).sendChatMessage(widget.listingId, text);
    _input.clear();
    await _load(silent: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('议价聊天')),
      body: Column(
        children: [
          Expanded(
            child: _loading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: _messages.length,
                    itemBuilder: (_, i) {
                      final m = _messages[i];
                      return Align(
                        alignment: m.isMine ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: m.isMine ? Colors.blue.shade100 : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(m.authorName, style: const TextStyle(fontSize: 12)),
                              Text(m.content),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
          SafeArea(
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _input,
                    decoration: const InputDecoration(hintText: '输入议价消息'),
                  ),
                ),
                IconButton(icon: const Icon(Icons.send), onPressed: _send),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
