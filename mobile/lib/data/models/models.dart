import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    required String phone,
    required String nickname,
    @Default('北京') String region,
    @Default(80) int creditScore,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
}

@freezed
class CategoryItem with _$CategoryItem {
  const factory CategoryItem({
    required String id,
    required String name,
  }) = _CategoryItem;

  factory CategoryItem.fromJson(Map<String, dynamic> json) => _$CategoryItemFromJson(json);
}

@freezed
class Listing with _$Listing {
  const factory Listing({
    required String id,
    required String userId,
    required String title,
    @Default('') String description,
    required double price,
    required String categoryId,
    @Default('') String categoryName,
    required String region,
    required String imageUrl,
    @Default('active') String status,
    @Default('') String sellerName,
    @Default(false) bool favorited,
    @Default(false) bool isOwner,
    String? createdAt,
  }) = _Listing;

  factory Listing.fromJson(Map<String, dynamic> json) => _$ListingFromJson(json);
}

@freezed
class WantedPost with _$WantedPost {
  const factory WantedPost({
    required String id,
    required String userId,
    required String title,
    @Default('') String description,
    double? budget,
    required String region,
    String? categoryId,
    @Default('') String categoryName,
    @Default('') String authorName,
    @Default('open') String status,
    String? createdAt,
  }) = _WantedPost;

  factory WantedPost.fromJson(Map<String, dynamic> json) => _$WantedPostFromJson(json);
}

@freezed
class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String id,
    required String listingId,
    required String userId,
    required String authorName,
    required String content,
    @Default(false) bool isMine,
    String? createdAt,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) => _$ChatMessageFromJson(json);
}

@freezed
class Address with _$Address {
  const factory Address({
    required String id,
    required String name,
    required String phone,
    required String province,
    required String city,
    required String district,
    required String detail,
    @Default(false) bool isDefault,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}

@freezed
class Order with _$Order {
  const factory Order({
    required String id,
    required String listingId,
    @Default('') String listingTitle,
    @Default('') String listingImage,
    required String buyerId,
    required String sellerId,
    @Default('') String buyerName,
    @Default('') String sellerName,
    required double amount,
    required String status,
    @Default('face') String deliveryType,
    Address? address,
    String? trackingNo,
    String? disputeUntil,
    String? createdAt,
    String? paidAt,
    String? shippedAt,
    String? receivedAt,
    String? releasedAt,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

@freezed
class OrderLog with _$OrderLog {
  const factory OrderLog({
    required String status,
    required String message,
    String? createdAt,
  }) = _OrderLog;

  factory OrderLog.fromJson(Map<String, dynamic> json) => _$OrderLogFromJson(json);
}

@freezed
class CreditInfo with _$CreditInfo {
  const factory CreditInfo({
    required int score,
    required int minPublish,
    required bool canPublish,
    @Default([]) List<CreditLog> logs,
  }) = _CreditInfo;

  factory CreditInfo.fromJson(Map<String, dynamic> json) => _$CreditInfoFromJson(json);
}

@freezed
class CreditLog with _$CreditLog {
  const factory CreditLog({
    required int delta,
    required String reason,
    String? createdAt,
  }) = _CreditLog;

  factory CreditLog.fromJson(Map<String, dynamic> json) => _$CreditLogFromJson(json);
}

@freezed
class AppNotification with _$AppNotification {
  const factory AppNotification({
    required String id,
    required String title,
    required String body,
    @Default('system') String type,
    @Default(false) bool read,
    String? createdAt,
  }) = _AppNotification;

  factory AppNotification.fromJson(Map<String, dynamic> json) => _$AppNotificationFromJson(json);
}
