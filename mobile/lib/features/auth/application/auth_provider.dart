import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/dio_client.dart';
import '../../../data/models/models.dart';
import '../../../data/repositories/secondhand_repository.dart';

@immutable
class AuthState {
  const AuthState({required this.token, required this.user});
  final String token;
  final UserProfile user;
}

class AuthNotifier extends Notifier<AuthState?> {
  @override
  AuthState? build() => null;

  Future<void> restore() async {
    final storage = ref.read(tokenStorageProvider);
    final token = await storage.getToken();
    if (token == null) return;
    try {
      final user = await ref.read(secondhandRepositoryProvider).me();
      state = AuthState(token: token, user: user);
    } catch (_) {
      await storage.clearToken();
    }
  }

  Future<void> login(String phone, String code) async {
    final result = await ref.read(secondhandRepositoryProvider).login(phone, code);
    await ref.read(tokenStorageProvider).saveToken(result.token);
    state = AuthState(token: result.token, user: result.user);
  }

  Future<void> logout() async {
    try {
      await ref.read(secondhandRepositoryProvider).logout();
    } catch (_) {}
    await ref.read(tokenStorageProvider).clearToken();
    state = null;
  }

  Future<void> refreshUser() async {
    if (state == null) return;
    final user = await ref.read(secondhandRepositoryProvider).me();
    state = AuthState(token: state!.token, user: user);
  }
}

final authProvider = NotifierProvider<AuthNotifier, AuthState?>(AuthNotifier.new);

final notificationBadgeProvider = FutureProvider<int>((ref) async {
  if (ref.watch(authProvider) == null) return 0;
  final data = await ref.watch(secondhandRepositoryProvider).getNotifications();
  return data.unreadCount;
});
