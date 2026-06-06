// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      id: json['id'] as String,
      phone: json['phone'] as String,
      nickname: json['nickname'] as String,
      region: json['region'] as String? ?? '北京',
      creditScore: (json['creditScore'] as num?)?.toInt() ?? 80,
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'nickname': instance.nickname,
      'region': instance.region,
      'creditScore': instance.creditScore,
    };

_$CategoryItemImpl _$$CategoryItemImplFromJson(Map<String, dynamic> json) =>
    _$CategoryItemImpl(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$CategoryItemImplToJson(_$CategoryItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$ListingImpl _$$ListingImplFromJson(Map<String, dynamic> json) =>
    _$ListingImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      price: (json['price'] as num).toDouble(),
      categoryId: json['categoryId'] as String,
      categoryName: json['categoryName'] as String? ?? '',
      region: json['region'] as String,
      imageUrl: json['imageUrl'] as String,
      status: json['status'] as String? ?? 'active',
      sellerName: json['sellerName'] as String? ?? '',
      favorited: json['favorited'] as bool? ?? false,
      isOwner: json['isOwner'] as bool? ?? false,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$ListingImplToJson(_$ListingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'region': instance.region,
      'imageUrl': instance.imageUrl,
      'status': instance.status,
      'sellerName': instance.sellerName,
      'favorited': instance.favorited,
      'isOwner': instance.isOwner,
      'createdAt': instance.createdAt,
    };

_$WantedPostImpl _$$WantedPostImplFromJson(Map<String, dynamic> json) =>
    _$WantedPostImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      budget: (json['budget'] as num?)?.toDouble(),
      region: json['region'] as String,
      categoryId: json['categoryId'] as String?,
      categoryName: json['categoryName'] as String? ?? '',
      authorName: json['authorName'] as String? ?? '',
      status: json['status'] as String? ?? 'open',
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$WantedPostImplToJson(_$WantedPostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'budget': instance.budget,
      'region': instance.region,
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'authorName': instance.authorName,
      'status': instance.status,
      'createdAt': instance.createdAt,
    };

_$ChatMessageImpl _$$ChatMessageImplFromJson(Map<String, dynamic> json) =>
    _$ChatMessageImpl(
      id: json['id'] as String,
      listingId: json['listingId'] as String,
      userId: json['userId'] as String,
      authorName: json['authorName'] as String,
      content: json['content'] as String,
      isMine: json['isMine'] as bool? ?? false,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$ChatMessageImplToJson(_$ChatMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'listingId': instance.listingId,
      'userId': instance.userId,
      'authorName': instance.authorName,
      'content': instance.content,
      'isMine': instance.isMine,
      'createdAt': instance.createdAt,
    };

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      province: json['province'] as String,
      city: json['city'] as String,
      district: json['district'] as String,
      detail: json['detail'] as String,
      isDefault: json['isDefault'] as bool? ?? false,
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'province': instance.province,
      'city': instance.city,
      'district': instance.district,
      'detail': instance.detail,
      'isDefault': instance.isDefault,
    };

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      id: json['id'] as String,
      listingId: json['listingId'] as String,
      listingTitle: json['listingTitle'] as String? ?? '',
      listingImage: json['listingImage'] as String? ?? '',
      buyerId: json['buyerId'] as String,
      sellerId: json['sellerId'] as String,
      buyerName: json['buyerName'] as String? ?? '',
      sellerName: json['sellerName'] as String? ?? '',
      amount: (json['amount'] as num).toDouble(),
      status: json['status'] as String,
      deliveryType: json['deliveryType'] as String? ?? 'face',
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      trackingNo: json['trackingNo'] as String?,
      disputeUntil: json['disputeUntil'] as String?,
      createdAt: json['createdAt'] as String?,
      paidAt: json['paidAt'] as String?,
      shippedAt: json['shippedAt'] as String?,
      receivedAt: json['receivedAt'] as String?,
      releasedAt: json['releasedAt'] as String?,
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'listingId': instance.listingId,
      'listingTitle': instance.listingTitle,
      'listingImage': instance.listingImage,
      'buyerId': instance.buyerId,
      'sellerId': instance.sellerId,
      'buyerName': instance.buyerName,
      'sellerName': instance.sellerName,
      'amount': instance.amount,
      'status': instance.status,
      'deliveryType': instance.deliveryType,
      'address': instance.address,
      'trackingNo': instance.trackingNo,
      'disputeUntil': instance.disputeUntil,
      'createdAt': instance.createdAt,
      'paidAt': instance.paidAt,
      'shippedAt': instance.shippedAt,
      'receivedAt': instance.receivedAt,
      'releasedAt': instance.releasedAt,
    };

_$OrderLogImpl _$$OrderLogImplFromJson(Map<String, dynamic> json) =>
    _$OrderLogImpl(
      status: json['status'] as String,
      message: json['message'] as String,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$OrderLogImplToJson(_$OrderLogImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'createdAt': instance.createdAt,
    };

_$CreditInfoImpl _$$CreditInfoImplFromJson(Map<String, dynamic> json) =>
    _$CreditInfoImpl(
      score: (json['score'] as num).toInt(),
      minPublish: (json['minPublish'] as num).toInt(),
      canPublish: json['canPublish'] as bool,
      logs: (json['logs'] as List<dynamic>?)
              ?.map((e) => CreditLog.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CreditInfoImplToJson(_$CreditInfoImpl instance) =>
    <String, dynamic>{
      'score': instance.score,
      'minPublish': instance.minPublish,
      'canPublish': instance.canPublish,
      'logs': instance.logs,
    };

_$CreditLogImpl _$$CreditLogImplFromJson(Map<String, dynamic> json) =>
    _$CreditLogImpl(
      delta: (json['delta'] as num).toInt(),
      reason: json['reason'] as String,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$CreditLogImplToJson(_$CreditLogImpl instance) =>
    <String, dynamic>{
      'delta': instance.delta,
      'reason': instance.reason,
      'createdAt': instance.createdAt,
    };

_$AppNotificationImpl _$$AppNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$AppNotificationImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      type: json['type'] as String? ?? 'system',
      read: json['read'] as bool? ?? false,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$AppNotificationImplToJson(
        _$AppNotificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'type': instance.type,
      'read': instance.read,
      'createdAt': instance.createdAt,
    };
