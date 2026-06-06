import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_client.dart';
import '../models/models.dart';

class SecondhandRepository {
  SecondhandRepository(this._dio);
  final Dio _dio;

  Future<({String token, UserProfile user})> login(String phone, String code) async {
    final res = await _dio.post('/api/auth/login', data: {'phone': phone, 'code': code});
    return (
      token: res.data['token'] as String,
      user: UserProfile.fromJson(res.data['user'] as Map<String, dynamic>),
    );
  }

  Future<void> logout() async => _dio.post('/api/auth/logout');

  Future<UserProfile> me() async {
    final res = await _dio.get('/api/auth/me');
    return UserProfile.fromJson(res.data['user'] as Map<String, dynamic>);
  }

  Future<void> updateRegion(String region) async {
    await _dio.patch('/api/auth/region', data: {'region': region});
  }

  Future<List<CategoryItem>> getCategories() async {
    final res = await _dio.get('/api/listings/categories');
    return (res.data['categories'] as List)
        .map((e) => CategoryItem.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<Listing>> getListings({
    String? categoryId,
    String? region,
    String? q,
    bool mine = false,
  }) async {
    final res = await _dio.get('/api/listings', queryParameters: {
      if (categoryId != null) 'categoryId': categoryId,
      if (region != null) 'region': region,
      if (q != null) 'q': q,
      if (mine) 'mine': '1',
    });
    return (res.data['listings'] as List)
        .map((e) => Listing.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<Listing> getListing(String id) async {
    final res = await _dio.get('/api/listings/$id');
    return Listing.fromJson(res.data['listing'] as Map<String, dynamic>);
  }

  Future<String> createListing(Map<String, dynamic> data) async {
    final res = await _dio.post('/api/listings', data: data);
    return res.data['id'] as String;
  }

  Future<void> updateListing(String id, Map<String, dynamic> data) async {
    await _dio.patch('/api/listings/$id', data: data);
  }

  Future<void> deactivateListing(String id) async {
    await _dio.patch('/api/listings/$id', data: {'status': 'inactive'});
  }

  Future<List<WantedPost>> getWanted({String? region}) async {
    final res = await _dio.get('/api/wanted', queryParameters: {if (region != null) 'region': region});
    return (res.data['wanted'] as List)
        .map((e) => WantedPost.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<String> createWanted(Map<String, dynamic> data) async {
    final res = await _dio.post('/api/wanted', data: data);
    return res.data['id'] as String;
  }

  Future<List<ChatMessage>> getChatMessages(String listingId) async {
    final res = await _dio.get('/api/chats/$listingId/messages');
    return (res.data['messages'] as List)
        .map((e) => ChatMessage.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> sendChatMessage(String listingId, String content) async {
    await _dio.post('/api/chats/$listingId/messages', data: {'content': content});
  }

  Future<String> createOrder({
    required String listingId,
    required String deliveryType,
    String? addressId,
  }) async {
    final res = await _dio.post('/api/orders', data: {
      'listingId': listingId,
      'deliveryType': deliveryType,
      if (addressId != null) 'addressId': addressId,
    });
    return res.data['id'] as String;
  }

  Future<List<Order>> getOrders({required String role}) async {
    final res = await _dio.get('/api/orders', queryParameters: {'role': role});
    return (res.data['orders'] as List)
        .map((e) => Order.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<({Order order, List<OrderLog> logs})> getOrder(String id) async {
    final res = await _dio.get('/api/orders/$id');
    return (
      order: Order.fromJson(res.data['order'] as Map<String, dynamic>),
      logs: (res.data['logs'] as List)
          .map((e) => OrderLog.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Future<void> payOrder(String id) async => _dio.post('/api/orders/$id/pay');
  Future<void> shipOrder(String id, {String? trackingNo}) async {
    await _dio.post('/api/orders/$id/ship', data: {if (trackingNo != null) 'trackingNo': trackingNo});
  }

  Future<void> confirmOrder(String id) async => _dio.post('/api/orders/$id/confirm');
  Future<void> disputeOrder(String id, String reason) async {
    await _dio.post('/api/orders/$id/dispute', data: {'reason': reason});
  }

  Future<CreditInfo> getCredit() async {
    final res = await _dio.get('/api/credit');
    return CreditInfo.fromJson(res.data as Map<String, dynamic>);
  }

  Future<void> report({required String targetType, required String targetId, required String reason}) async {
    await _dio.post('/api/reports', data: {
      'targetType': targetType,
      'targetId': targetId,
      'reason': reason,
    });
  }

  Future<List<Listing>> getFavorites() async {
    final res = await _dio.get('/api/favorites');
    return (res.data['listings'] as List)
        .map((e) => Listing.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> addFavorite(String listingId) async => _dio.post('/api/favorites', data: {'listingId': listingId});
  Future<void> removeFavorite(String listingId) async => _dio.delete('/api/favorites/$listingId');

  Future<List<Address>> getAddresses() async {
    final res = await _dio.get('/api/addresses');
    return (res.data['addresses'] as List)
        .map((e) => Address.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<Address> createAddress(Map<String, dynamic> data) async {
    final res = await _dio.post('/api/addresses', data: data);
    return Address.fromJson(res.data['address'] as Map<String, dynamic>);
  }

  Future<({List<AppNotification> notifications, int unreadCount})> getNotifications() async {
    final res = await _dio.get('/api/notifications');
    return (
      notifications: (res.data['notifications'] as List)
          .map((e) => AppNotification.fromJson(e as Map<String, dynamic>))
          .toList(),
      unreadCount: res.data['unreadCount'] as int,
    );
  }

  Future<void> readAllNotifications() async => _dio.post('/api/notifications/read-all');
}

final secondhandRepositoryProvider = Provider<SecondhandRepository>((ref) {
  return SecondhandRepository(ref.watch(dioProvider));
});
