// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
mixin _$UserProfile {
  String get id => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String get region => throw _privateConstructorUsedError;
  int get creditScore => throw _privateConstructorUsedError;

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) then) =
      _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
  $Res call(
      {String id,
      String phone,
      String nickname,
      String region,
      int creditScore});
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? phone = null,
    Object? nickname = null,
    Object? region = null,
    Object? creditScore = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      creditScore: null == creditScore
          ? _value.creditScore
          : creditScore // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProfileImplCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$UserProfileImplCopyWith(
          _$UserProfileImpl value, $Res Function(_$UserProfileImpl) then) =
      __$$UserProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String phone,
      String nickname,
      String region,
      int creditScore});
}

/// @nodoc
class __$$UserProfileImplCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$UserProfileImpl>
    implements _$$UserProfileImplCopyWith<$Res> {
  __$$UserProfileImplCopyWithImpl(
      _$UserProfileImpl _value, $Res Function(_$UserProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? phone = null,
    Object? nickname = null,
    Object? region = null,
    Object? creditScore = null,
  }) {
    return _then(_$UserProfileImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      creditScore: null == creditScore
          ? _value.creditScore
          : creditScore // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileImpl implements _UserProfile {
  const _$UserProfileImpl(
      {required this.id,
      required this.phone,
      required this.nickname,
      this.region = '北京',
      this.creditScore = 80});

  factory _$UserProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileImplFromJson(json);

  @override
  final String id;
  @override
  final String phone;
  @override
  final String nickname;
  @override
  @JsonKey()
  final String region;
  @override
  @JsonKey()
  final int creditScore;

  @override
  String toString() {
    return 'UserProfile(id: $id, phone: $phone, nickname: $nickname, region: $region, creditScore: $creditScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.creditScore, creditScore) ||
                other.creditScore == creditScore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, phone, nickname, region, creditScore);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      __$$UserProfileImplCopyWithImpl<_$UserProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileImplToJson(
      this,
    );
  }
}

abstract class _UserProfile implements UserProfile {
  const factory _UserProfile(
      {required final String id,
      required final String phone,
      required final String nickname,
      final String region,
      final int creditScore}) = _$UserProfileImpl;

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$UserProfileImpl.fromJson;

  @override
  String get id;
  @override
  String get phone;
  @override
  String get nickname;
  @override
  String get region;
  @override
  int get creditScore;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryItem _$CategoryItemFromJson(Map<String, dynamic> json) {
  return _CategoryItem.fromJson(json);
}

/// @nodoc
mixin _$CategoryItem {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this CategoryItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryItemCopyWith<CategoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryItemCopyWith<$Res> {
  factory $CategoryItemCopyWith(
          CategoryItem value, $Res Function(CategoryItem) then) =
      _$CategoryItemCopyWithImpl<$Res, CategoryItem>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$CategoryItemCopyWithImpl<$Res, $Val extends CategoryItem>
    implements $CategoryItemCopyWith<$Res> {
  _$CategoryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryItemImplCopyWith<$Res>
    implements $CategoryItemCopyWith<$Res> {
  factory _$$CategoryItemImplCopyWith(
          _$CategoryItemImpl value, $Res Function(_$CategoryItemImpl) then) =
      __$$CategoryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$CategoryItemImplCopyWithImpl<$Res>
    extends _$CategoryItemCopyWithImpl<$Res, _$CategoryItemImpl>
    implements _$$CategoryItemImplCopyWith<$Res> {
  __$$CategoryItemImplCopyWithImpl(
      _$CategoryItemImpl _value, $Res Function(_$CategoryItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$CategoryItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryItemImpl implements _CategoryItem {
  const _$CategoryItemImpl({required this.id, required this.name});

  factory _$CategoryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryItemImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'CategoryItem(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of CategoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryItemImplCopyWith<_$CategoryItemImpl> get copyWith =>
      __$$CategoryItemImplCopyWithImpl<_$CategoryItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryItemImplToJson(
      this,
    );
  }
}

abstract class _CategoryItem implements CategoryItem {
  const factory _CategoryItem(
      {required final String id,
      required final String name}) = _$CategoryItemImpl;

  factory _CategoryItem.fromJson(Map<String, dynamic> json) =
      _$CategoryItemImpl.fromJson;

  @override
  String get id;
  @override
  String get name;

  /// Create a copy of CategoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryItemImplCopyWith<_$CategoryItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Listing _$ListingFromJson(Map<String, dynamic> json) {
  return _Listing.fromJson(json);
}

/// @nodoc
mixin _$Listing {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  String get categoryName => throw _privateConstructorUsedError;
  String get region => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get sellerName => throw _privateConstructorUsedError;
  bool get favorited => throw _privateConstructorUsedError;
  bool get isOwner => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Listing to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Listing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListingCopyWith<Listing> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListingCopyWith<$Res> {
  factory $ListingCopyWith(Listing value, $Res Function(Listing) then) =
      _$ListingCopyWithImpl<$Res, Listing>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String title,
      String description,
      double price,
      String categoryId,
      String categoryName,
      String region,
      String imageUrl,
      String status,
      String sellerName,
      bool favorited,
      bool isOwner,
      String? createdAt});
}

/// @nodoc
class _$ListingCopyWithImpl<$Res, $Val extends Listing>
    implements $ListingCopyWith<$Res> {
  _$ListingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Listing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? description = null,
    Object? price = null,
    Object? categoryId = null,
    Object? categoryName = null,
    Object? region = null,
    Object? imageUrl = null,
    Object? status = null,
    Object? sellerName = null,
    Object? favorited = null,
    Object? isOwner = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      sellerName: null == sellerName
          ? _value.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as String,
      favorited: null == favorited
          ? _value.favorited
          : favorited // ignore: cast_nullable_to_non_nullable
              as bool,
      isOwner: null == isOwner
          ? _value.isOwner
          : isOwner // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListingImplCopyWith<$Res> implements $ListingCopyWith<$Res> {
  factory _$$ListingImplCopyWith(
          _$ListingImpl value, $Res Function(_$ListingImpl) then) =
      __$$ListingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String title,
      String description,
      double price,
      String categoryId,
      String categoryName,
      String region,
      String imageUrl,
      String status,
      String sellerName,
      bool favorited,
      bool isOwner,
      String? createdAt});
}

/// @nodoc
class __$$ListingImplCopyWithImpl<$Res>
    extends _$ListingCopyWithImpl<$Res, _$ListingImpl>
    implements _$$ListingImplCopyWith<$Res> {
  __$$ListingImplCopyWithImpl(
      _$ListingImpl _value, $Res Function(_$ListingImpl) _then)
      : super(_value, _then);

  /// Create a copy of Listing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? description = null,
    Object? price = null,
    Object? categoryId = null,
    Object? categoryName = null,
    Object? region = null,
    Object? imageUrl = null,
    Object? status = null,
    Object? sellerName = null,
    Object? favorited = null,
    Object? isOwner = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$ListingImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      sellerName: null == sellerName
          ? _value.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as String,
      favorited: null == favorited
          ? _value.favorited
          : favorited // ignore: cast_nullable_to_non_nullable
              as bool,
      isOwner: null == isOwner
          ? _value.isOwner
          : isOwner // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListingImpl implements _Listing {
  const _$ListingImpl(
      {required this.id,
      required this.userId,
      required this.title,
      this.description = '',
      required this.price,
      required this.categoryId,
      this.categoryName = '',
      required this.region,
      required this.imageUrl,
      this.status = 'active',
      this.sellerName = '',
      this.favorited = false,
      this.isOwner = false,
      this.createdAt});

  factory _$ListingImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListingImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  final double price;
  @override
  final String categoryId;
  @override
  @JsonKey()
  final String categoryName;
  @override
  final String region;
  @override
  final String imageUrl;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final String sellerName;
  @override
  @JsonKey()
  final bool favorited;
  @override
  @JsonKey()
  final bool isOwner;
  @override
  final String? createdAt;

  @override
  String toString() {
    return 'Listing(id: $id, userId: $userId, title: $title, description: $description, price: $price, categoryId: $categoryId, categoryName: $categoryName, region: $region, imageUrl: $imageUrl, status: $status, sellerName: $sellerName, favorited: $favorited, isOwner: $isOwner, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.sellerName, sellerName) ||
                other.sellerName == sellerName) &&
            (identical(other.favorited, favorited) ||
                other.favorited == favorited) &&
            (identical(other.isOwner, isOwner) || other.isOwner == isOwner) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      title,
      description,
      price,
      categoryId,
      categoryName,
      region,
      imageUrl,
      status,
      sellerName,
      favorited,
      isOwner,
      createdAt);

  /// Create a copy of Listing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListingImplCopyWith<_$ListingImpl> get copyWith =>
      __$$ListingImplCopyWithImpl<_$ListingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListingImplToJson(
      this,
    );
  }
}

abstract class _Listing implements Listing {
  const factory _Listing(
      {required final String id,
      required final String userId,
      required final String title,
      final String description,
      required final double price,
      required final String categoryId,
      final String categoryName,
      required final String region,
      required final String imageUrl,
      final String status,
      final String sellerName,
      final bool favorited,
      final bool isOwner,
      final String? createdAt}) = _$ListingImpl;

  factory _Listing.fromJson(Map<String, dynamic> json) = _$ListingImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get title;
  @override
  String get description;
  @override
  double get price;
  @override
  String get categoryId;
  @override
  String get categoryName;
  @override
  String get region;
  @override
  String get imageUrl;
  @override
  String get status;
  @override
  String get sellerName;
  @override
  bool get favorited;
  @override
  bool get isOwner;
  @override
  String? get createdAt;

  /// Create a copy of Listing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListingImplCopyWith<_$ListingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WantedPost _$WantedPostFromJson(Map<String, dynamic> json) {
  return _WantedPost.fromJson(json);
}

/// @nodoc
mixin _$WantedPost {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double? get budget => throw _privateConstructorUsedError;
  String get region => throw _privateConstructorUsedError;
  String? get categoryId => throw _privateConstructorUsedError;
  String get categoryName => throw _privateConstructorUsedError;
  String get authorName => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this WantedPost to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WantedPost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WantedPostCopyWith<WantedPost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WantedPostCopyWith<$Res> {
  factory $WantedPostCopyWith(
          WantedPost value, $Res Function(WantedPost) then) =
      _$WantedPostCopyWithImpl<$Res, WantedPost>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String title,
      String description,
      double? budget,
      String region,
      String? categoryId,
      String categoryName,
      String authorName,
      String status,
      String? createdAt});
}

/// @nodoc
class _$WantedPostCopyWithImpl<$Res, $Val extends WantedPost>
    implements $WantedPostCopyWith<$Res> {
  _$WantedPostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WantedPost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? description = null,
    Object? budget = freezed,
    Object? region = null,
    Object? categoryId = freezed,
    Object? categoryName = null,
    Object? authorName = null,
    Object? status = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      budget: freezed == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as double?,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      authorName: null == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WantedPostImplCopyWith<$Res>
    implements $WantedPostCopyWith<$Res> {
  factory _$$WantedPostImplCopyWith(
          _$WantedPostImpl value, $Res Function(_$WantedPostImpl) then) =
      __$$WantedPostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String title,
      String description,
      double? budget,
      String region,
      String? categoryId,
      String categoryName,
      String authorName,
      String status,
      String? createdAt});
}

/// @nodoc
class __$$WantedPostImplCopyWithImpl<$Res>
    extends _$WantedPostCopyWithImpl<$Res, _$WantedPostImpl>
    implements _$$WantedPostImplCopyWith<$Res> {
  __$$WantedPostImplCopyWithImpl(
      _$WantedPostImpl _value, $Res Function(_$WantedPostImpl) _then)
      : super(_value, _then);

  /// Create a copy of WantedPost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? description = null,
    Object? budget = freezed,
    Object? region = null,
    Object? categoryId = freezed,
    Object? categoryName = null,
    Object? authorName = null,
    Object? status = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$WantedPostImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      budget: freezed == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as double?,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      authorName: null == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WantedPostImpl implements _WantedPost {
  const _$WantedPostImpl(
      {required this.id,
      required this.userId,
      required this.title,
      this.description = '',
      this.budget,
      required this.region,
      this.categoryId,
      this.categoryName = '',
      this.authorName = '',
      this.status = 'open',
      this.createdAt});

  factory _$WantedPostImpl.fromJson(Map<String, dynamic> json) =>
      _$$WantedPostImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  final double? budget;
  @override
  final String region;
  @override
  final String? categoryId;
  @override
  @JsonKey()
  final String categoryName;
  @override
  @JsonKey()
  final String authorName;
  @override
  @JsonKey()
  final String status;
  @override
  final String? createdAt;

  @override
  String toString() {
    return 'WantedPost(id: $id, userId: $userId, title: $title, description: $description, budget: $budget, region: $region, categoryId: $categoryId, categoryName: $categoryName, authorName: $authorName, status: $status, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WantedPostImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.budget, budget) || other.budget == budget) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, title, description,
      budget, region, categoryId, categoryName, authorName, status, createdAt);

  /// Create a copy of WantedPost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WantedPostImplCopyWith<_$WantedPostImpl> get copyWith =>
      __$$WantedPostImplCopyWithImpl<_$WantedPostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WantedPostImplToJson(
      this,
    );
  }
}

abstract class _WantedPost implements WantedPost {
  const factory _WantedPost(
      {required final String id,
      required final String userId,
      required final String title,
      final String description,
      final double? budget,
      required final String region,
      final String? categoryId,
      final String categoryName,
      final String authorName,
      final String status,
      final String? createdAt}) = _$WantedPostImpl;

  factory _WantedPost.fromJson(Map<String, dynamic> json) =
      _$WantedPostImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get title;
  @override
  String get description;
  @override
  double? get budget;
  @override
  String get region;
  @override
  String? get categoryId;
  @override
  String get categoryName;
  @override
  String get authorName;
  @override
  String get status;
  @override
  String? get createdAt;

  /// Create a copy of WantedPost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WantedPostImplCopyWith<_$WantedPostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) {
  return _ChatMessage.fromJson(json);
}

/// @nodoc
mixin _$ChatMessage {
  String get id => throw _privateConstructorUsedError;
  String get listingId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get authorName => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  bool get isMine => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this ChatMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatMessageCopyWith<ChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageCopyWith<$Res> {
  factory $ChatMessageCopyWith(
          ChatMessage value, $Res Function(ChatMessage) then) =
      _$ChatMessageCopyWithImpl<$Res, ChatMessage>;
  @useResult
  $Res call(
      {String id,
      String listingId,
      String userId,
      String authorName,
      String content,
      bool isMine,
      String? createdAt});
}

/// @nodoc
class _$ChatMessageCopyWithImpl<$Res, $Val extends ChatMessage>
    implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? listingId = null,
    Object? userId = null,
    Object? authorName = null,
    Object? content = null,
    Object? isMine = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      listingId: null == listingId
          ? _value.listingId
          : listingId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      authorName: null == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isMine: null == isMine
          ? _value.isMine
          : isMine // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatMessageImplCopyWith<$Res>
    implements $ChatMessageCopyWith<$Res> {
  factory _$$ChatMessageImplCopyWith(
          _$ChatMessageImpl value, $Res Function(_$ChatMessageImpl) then) =
      __$$ChatMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String listingId,
      String userId,
      String authorName,
      String content,
      bool isMine,
      String? createdAt});
}

/// @nodoc
class __$$ChatMessageImplCopyWithImpl<$Res>
    extends _$ChatMessageCopyWithImpl<$Res, _$ChatMessageImpl>
    implements _$$ChatMessageImplCopyWith<$Res> {
  __$$ChatMessageImplCopyWithImpl(
      _$ChatMessageImpl _value, $Res Function(_$ChatMessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? listingId = null,
    Object? userId = null,
    Object? authorName = null,
    Object? content = null,
    Object? isMine = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$ChatMessageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      listingId: null == listingId
          ? _value.listingId
          : listingId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      authorName: null == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isMine: null == isMine
          ? _value.isMine
          : isMine // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatMessageImpl implements _ChatMessage {
  const _$ChatMessageImpl(
      {required this.id,
      required this.listingId,
      required this.userId,
      required this.authorName,
      required this.content,
      this.isMine = false,
      this.createdAt});

  factory _$ChatMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatMessageImplFromJson(json);

  @override
  final String id;
  @override
  final String listingId;
  @override
  final String userId;
  @override
  final String authorName;
  @override
  final String content;
  @override
  @JsonKey()
  final bool isMine;
  @override
  final String? createdAt;

  @override
  String toString() {
    return 'ChatMessage(id: $id, listingId: $listingId, userId: $userId, authorName: $authorName, content: $content, isMine: $isMine, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.listingId, listingId) ||
                other.listingId == listingId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.isMine, isMine) || other.isMine == isMine) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, listingId, userId,
      authorName, content, isMine, createdAt);

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMessageImplCopyWith<_$ChatMessageImpl> get copyWith =>
      __$$ChatMessageImplCopyWithImpl<_$ChatMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatMessageImplToJson(
      this,
    );
  }
}

abstract class _ChatMessage implements ChatMessage {
  const factory _ChatMessage(
      {required final String id,
      required final String listingId,
      required final String userId,
      required final String authorName,
      required final String content,
      final bool isMine,
      final String? createdAt}) = _$ChatMessageImpl;

  factory _ChatMessage.fromJson(Map<String, dynamic> json) =
      _$ChatMessageImpl.fromJson;

  @override
  String get id;
  @override
  String get listingId;
  @override
  String get userId;
  @override
  String get authorName;
  @override
  String get content;
  @override
  bool get isMine;
  @override
  String? get createdAt;

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatMessageImplCopyWith<_$ChatMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
mixin _$Address {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get province => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get district => throw _privateConstructorUsedError;
  String get detail => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;

  /// Serializes this Address to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res, Address>;
  @useResult
  $Res call(
      {String id,
      String name,
      String phone,
      String province,
      String city,
      String district,
      String detail,
      bool isDefault});
}

/// @nodoc
class _$AddressCopyWithImpl<$Res, $Val extends Address>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = null,
    Object? province = null,
    Object? city = null,
    Object? district = null,
    Object? detail = null,
    Object? isDefault = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      province: null == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String,
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressImplCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$$AddressImplCopyWith(
          _$AddressImpl value, $Res Function(_$AddressImpl) then) =
      __$$AddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String phone,
      String province,
      String city,
      String district,
      String detail,
      bool isDefault});
}

/// @nodoc
class __$$AddressImplCopyWithImpl<$Res>
    extends _$AddressCopyWithImpl<$Res, _$AddressImpl>
    implements _$$AddressImplCopyWith<$Res> {
  __$$AddressImplCopyWithImpl(
      _$AddressImpl _value, $Res Function(_$AddressImpl) _then)
      : super(_value, _then);

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = null,
    Object? province = null,
    Object? city = null,
    Object? district = null,
    Object? detail = null,
    Object? isDefault = null,
  }) {
    return _then(_$AddressImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      province: null == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String,
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressImpl implements _Address {
  const _$AddressImpl(
      {required this.id,
      required this.name,
      required this.phone,
      required this.province,
      required this.city,
      required this.district,
      required this.detail,
      this.isDefault = false});

  factory _$AddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String phone;
  @override
  final String province;
  @override
  final String city;
  @override
  final String district;
  @override
  final String detail;
  @override
  @JsonKey()
  final bool isDefault;

  @override
  String toString() {
    return 'Address(id: $id, name: $name, phone: $phone, province: $province, city: $city, district: $district, detail: $detail, isDefault: $isDefault)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.province, province) ||
                other.province == province) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, phone, province, city,
      district, detail, isDefault);

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      __$$AddressImplCopyWithImpl<_$AddressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressImplToJson(
      this,
    );
  }
}

abstract class _Address implements Address {
  const factory _Address(
      {required final String id,
      required final String name,
      required final String phone,
      required final String province,
      required final String city,
      required final String district,
      required final String detail,
      final bool isDefault}) = _$AddressImpl;

  factory _Address.fromJson(Map<String, dynamic> json) = _$AddressImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get phone;
  @override
  String get province;
  @override
  String get city;
  @override
  String get district;
  @override
  String get detail;
  @override
  bool get isDefault;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  String get id => throw _privateConstructorUsedError;
  String get listingId => throw _privateConstructorUsedError;
  String get listingTitle => throw _privateConstructorUsedError;
  String get listingImage => throw _privateConstructorUsedError;
  String get buyerId => throw _privateConstructorUsedError;
  String get sellerId => throw _privateConstructorUsedError;
  String get buyerName => throw _privateConstructorUsedError;
  String get sellerName => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get deliveryType => throw _privateConstructorUsedError;
  Address? get address => throw _privateConstructorUsedError;
  String? get trackingNo => throw _privateConstructorUsedError;
  String? get disputeUntil => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get paidAt => throw _privateConstructorUsedError;
  String? get shippedAt => throw _privateConstructorUsedError;
  String? get receivedAt => throw _privateConstructorUsedError;
  String? get releasedAt => throw _privateConstructorUsedError;

  /// Serializes this Order to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {String id,
      String listingId,
      String listingTitle,
      String listingImage,
      String buyerId,
      String sellerId,
      String buyerName,
      String sellerName,
      double amount,
      String status,
      String deliveryType,
      Address? address,
      String? trackingNo,
      String? disputeUntil,
      String? createdAt,
      String? paidAt,
      String? shippedAt,
      String? receivedAt,
      String? releasedAt});

  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? listingId = null,
    Object? listingTitle = null,
    Object? listingImage = null,
    Object? buyerId = null,
    Object? sellerId = null,
    Object? buyerName = null,
    Object? sellerName = null,
    Object? amount = null,
    Object? status = null,
    Object? deliveryType = null,
    Object? address = freezed,
    Object? trackingNo = freezed,
    Object? disputeUntil = freezed,
    Object? createdAt = freezed,
    Object? paidAt = freezed,
    Object? shippedAt = freezed,
    Object? receivedAt = freezed,
    Object? releasedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      listingId: null == listingId
          ? _value.listingId
          : listingId // ignore: cast_nullable_to_non_nullable
              as String,
      listingTitle: null == listingTitle
          ? _value.listingTitle
          : listingTitle // ignore: cast_nullable_to_non_nullable
              as String,
      listingImage: null == listingImage
          ? _value.listingImage
          : listingImage // ignore: cast_nullable_to_non_nullable
              as String,
      buyerId: null == buyerId
          ? _value.buyerId
          : buyerId // ignore: cast_nullable_to_non_nullable
              as String,
      sellerId: null == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String,
      buyerName: null == buyerName
          ? _value.buyerName
          : buyerName // ignore: cast_nullable_to_non_nullable
              as String,
      sellerName: null == sellerName
          ? _value.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryType: null == deliveryType
          ? _value.deliveryType
          : deliveryType // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      trackingNo: freezed == trackingNo
          ? _value.trackingNo
          : trackingNo // ignore: cast_nullable_to_non_nullable
              as String?,
      disputeUntil: freezed == disputeUntil
          ? _value.disputeUntil
          : disputeUntil // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      paidAt: freezed == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as String?,
      shippedAt: freezed == shippedAt
          ? _value.shippedAt
          : shippedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      receivedAt: freezed == receivedAt
          ? _value.receivedAt
          : receivedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      releasedAt: freezed == releasedAt
          ? _value.releasedAt
          : releasedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderImplCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
          _$OrderImpl value, $Res Function(_$OrderImpl) then) =
      __$$OrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String listingId,
      String listingTitle,
      String listingImage,
      String buyerId,
      String sellerId,
      String buyerName,
      String sellerName,
      double amount,
      String status,
      String deliveryType,
      Address? address,
      String? trackingNo,
      String? disputeUntil,
      String? createdAt,
      String? paidAt,
      String? shippedAt,
      String? receivedAt,
      String? releasedAt});

  @override
  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$OrderCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
      _$OrderImpl _value, $Res Function(_$OrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? listingId = null,
    Object? listingTitle = null,
    Object? listingImage = null,
    Object? buyerId = null,
    Object? sellerId = null,
    Object? buyerName = null,
    Object? sellerName = null,
    Object? amount = null,
    Object? status = null,
    Object? deliveryType = null,
    Object? address = freezed,
    Object? trackingNo = freezed,
    Object? disputeUntil = freezed,
    Object? createdAt = freezed,
    Object? paidAt = freezed,
    Object? shippedAt = freezed,
    Object? receivedAt = freezed,
    Object? releasedAt = freezed,
  }) {
    return _then(_$OrderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      listingId: null == listingId
          ? _value.listingId
          : listingId // ignore: cast_nullable_to_non_nullable
              as String,
      listingTitle: null == listingTitle
          ? _value.listingTitle
          : listingTitle // ignore: cast_nullable_to_non_nullable
              as String,
      listingImage: null == listingImage
          ? _value.listingImage
          : listingImage // ignore: cast_nullable_to_non_nullable
              as String,
      buyerId: null == buyerId
          ? _value.buyerId
          : buyerId // ignore: cast_nullable_to_non_nullable
              as String,
      sellerId: null == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String,
      buyerName: null == buyerName
          ? _value.buyerName
          : buyerName // ignore: cast_nullable_to_non_nullable
              as String,
      sellerName: null == sellerName
          ? _value.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryType: null == deliveryType
          ? _value.deliveryType
          : deliveryType // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      trackingNo: freezed == trackingNo
          ? _value.trackingNo
          : trackingNo // ignore: cast_nullable_to_non_nullable
              as String?,
      disputeUntil: freezed == disputeUntil
          ? _value.disputeUntil
          : disputeUntil // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      paidAt: freezed == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as String?,
      shippedAt: freezed == shippedAt
          ? _value.shippedAt
          : shippedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      receivedAt: freezed == receivedAt
          ? _value.receivedAt
          : receivedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      releasedAt: freezed == releasedAt
          ? _value.releasedAt
          : releasedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderImpl implements _Order {
  const _$OrderImpl(
      {required this.id,
      required this.listingId,
      this.listingTitle = '',
      this.listingImage = '',
      required this.buyerId,
      required this.sellerId,
      this.buyerName = '',
      this.sellerName = '',
      required this.amount,
      required this.status,
      this.deliveryType = 'face',
      this.address,
      this.trackingNo,
      this.disputeUntil,
      this.createdAt,
      this.paidAt,
      this.shippedAt,
      this.receivedAt,
      this.releasedAt});

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  final String id;
  @override
  final String listingId;
  @override
  @JsonKey()
  final String listingTitle;
  @override
  @JsonKey()
  final String listingImage;
  @override
  final String buyerId;
  @override
  final String sellerId;
  @override
  @JsonKey()
  final String buyerName;
  @override
  @JsonKey()
  final String sellerName;
  @override
  final double amount;
  @override
  final String status;
  @override
  @JsonKey()
  final String deliveryType;
  @override
  final Address? address;
  @override
  final String? trackingNo;
  @override
  final String? disputeUntil;
  @override
  final String? createdAt;
  @override
  final String? paidAt;
  @override
  final String? shippedAt;
  @override
  final String? receivedAt;
  @override
  final String? releasedAt;

  @override
  String toString() {
    return 'Order(id: $id, listingId: $listingId, listingTitle: $listingTitle, listingImage: $listingImage, buyerId: $buyerId, sellerId: $sellerId, buyerName: $buyerName, sellerName: $sellerName, amount: $amount, status: $status, deliveryType: $deliveryType, address: $address, trackingNo: $trackingNo, disputeUntil: $disputeUntil, createdAt: $createdAt, paidAt: $paidAt, shippedAt: $shippedAt, receivedAt: $receivedAt, releasedAt: $releasedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.listingId, listingId) ||
                other.listingId == listingId) &&
            (identical(other.listingTitle, listingTitle) ||
                other.listingTitle == listingTitle) &&
            (identical(other.listingImage, listingImage) ||
                other.listingImage == listingImage) &&
            (identical(other.buyerId, buyerId) || other.buyerId == buyerId) &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId) &&
            (identical(other.buyerName, buyerName) ||
                other.buyerName == buyerName) &&
            (identical(other.sellerName, sellerName) ||
                other.sellerName == sellerName) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.deliveryType, deliveryType) ||
                other.deliveryType == deliveryType) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.trackingNo, trackingNo) ||
                other.trackingNo == trackingNo) &&
            (identical(other.disputeUntil, disputeUntil) ||
                other.disputeUntil == disputeUntil) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.paidAt, paidAt) || other.paidAt == paidAt) &&
            (identical(other.shippedAt, shippedAt) ||
                other.shippedAt == shippedAt) &&
            (identical(other.receivedAt, receivedAt) ||
                other.receivedAt == receivedAt) &&
            (identical(other.releasedAt, releasedAt) ||
                other.releasedAt == releasedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        listingId,
        listingTitle,
        listingImage,
        buyerId,
        sellerId,
        buyerName,
        sellerName,
        amount,
        status,
        deliveryType,
        address,
        trackingNo,
        disputeUntil,
        createdAt,
        paidAt,
        shippedAt,
        receivedAt,
        releasedAt
      ]);

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderImplToJson(
      this,
    );
  }
}

abstract class _Order implements Order {
  const factory _Order(
      {required final String id,
      required final String listingId,
      final String listingTitle,
      final String listingImage,
      required final String buyerId,
      required final String sellerId,
      final String buyerName,
      final String sellerName,
      required final double amount,
      required final String status,
      final String deliveryType,
      final Address? address,
      final String? trackingNo,
      final String? disputeUntil,
      final String? createdAt,
      final String? paidAt,
      final String? shippedAt,
      final String? receivedAt,
      final String? releasedAt}) = _$OrderImpl;

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  String get id;
  @override
  String get listingId;
  @override
  String get listingTitle;
  @override
  String get listingImage;
  @override
  String get buyerId;
  @override
  String get sellerId;
  @override
  String get buyerName;
  @override
  String get sellerName;
  @override
  double get amount;
  @override
  String get status;
  @override
  String get deliveryType;
  @override
  Address? get address;
  @override
  String? get trackingNo;
  @override
  String? get disputeUntil;
  @override
  String? get createdAt;
  @override
  String? get paidAt;
  @override
  String? get shippedAt;
  @override
  String? get receivedAt;
  @override
  String? get releasedAt;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderLog _$OrderLogFromJson(Map<String, dynamic> json) {
  return _OrderLog.fromJson(json);
}

/// @nodoc
mixin _$OrderLog {
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this OrderLog to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderLogCopyWith<OrderLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderLogCopyWith<$Res> {
  factory $OrderLogCopyWith(OrderLog value, $Res Function(OrderLog) then) =
      _$OrderLogCopyWithImpl<$Res, OrderLog>;
  @useResult
  $Res call({String status, String message, String? createdAt});
}

/// @nodoc
class _$OrderLogCopyWithImpl<$Res, $Val extends OrderLog>
    implements $OrderLogCopyWith<$Res> {
  _$OrderLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderLogImplCopyWith<$Res>
    implements $OrderLogCopyWith<$Res> {
  factory _$$OrderLogImplCopyWith(
          _$OrderLogImpl value, $Res Function(_$OrderLogImpl) then) =
      __$$OrderLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String message, String? createdAt});
}

/// @nodoc
class __$$OrderLogImplCopyWithImpl<$Res>
    extends _$OrderLogCopyWithImpl<$Res, _$OrderLogImpl>
    implements _$$OrderLogImplCopyWith<$Res> {
  __$$OrderLogImplCopyWithImpl(
      _$OrderLogImpl _value, $Res Function(_$OrderLogImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$OrderLogImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderLogImpl implements _OrderLog {
  const _$OrderLogImpl(
      {required this.status, required this.message, this.createdAt});

  factory _$OrderLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderLogImplFromJson(json);

  @override
  final String status;
  @override
  final String message;
  @override
  final String? createdAt;

  @override
  String toString() {
    return 'OrderLog(status: $status, message: $message, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderLogImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, createdAt);

  /// Create a copy of OrderLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderLogImplCopyWith<_$OrderLogImpl> get copyWith =>
      __$$OrderLogImplCopyWithImpl<_$OrderLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderLogImplToJson(
      this,
    );
  }
}

abstract class _OrderLog implements OrderLog {
  const factory _OrderLog(
      {required final String status,
      required final String message,
      final String? createdAt}) = _$OrderLogImpl;

  factory _OrderLog.fromJson(Map<String, dynamic> json) =
      _$OrderLogImpl.fromJson;

  @override
  String get status;
  @override
  String get message;
  @override
  String? get createdAt;

  /// Create a copy of OrderLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderLogImplCopyWith<_$OrderLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreditInfo _$CreditInfoFromJson(Map<String, dynamic> json) {
  return _CreditInfo.fromJson(json);
}

/// @nodoc
mixin _$CreditInfo {
  int get score => throw _privateConstructorUsedError;
  int get minPublish => throw _privateConstructorUsedError;
  bool get canPublish => throw _privateConstructorUsedError;
  List<CreditLog> get logs => throw _privateConstructorUsedError;

  /// Serializes this CreditInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreditInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreditInfoCopyWith<CreditInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditInfoCopyWith<$Res> {
  factory $CreditInfoCopyWith(
          CreditInfo value, $Res Function(CreditInfo) then) =
      _$CreditInfoCopyWithImpl<$Res, CreditInfo>;
  @useResult
  $Res call({int score, int minPublish, bool canPublish, List<CreditLog> logs});
}

/// @nodoc
class _$CreditInfoCopyWithImpl<$Res, $Val extends CreditInfo>
    implements $CreditInfoCopyWith<$Res> {
  _$CreditInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreditInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = null,
    Object? minPublish = null,
    Object? canPublish = null,
    Object? logs = null,
  }) {
    return _then(_value.copyWith(
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      minPublish: null == minPublish
          ? _value.minPublish
          : minPublish // ignore: cast_nullable_to_non_nullable
              as int,
      canPublish: null == canPublish
          ? _value.canPublish
          : canPublish // ignore: cast_nullable_to_non_nullable
              as bool,
      logs: null == logs
          ? _value.logs
          : logs // ignore: cast_nullable_to_non_nullable
              as List<CreditLog>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreditInfoImplCopyWith<$Res>
    implements $CreditInfoCopyWith<$Res> {
  factory _$$CreditInfoImplCopyWith(
          _$CreditInfoImpl value, $Res Function(_$CreditInfoImpl) then) =
      __$$CreditInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int score, int minPublish, bool canPublish, List<CreditLog> logs});
}

/// @nodoc
class __$$CreditInfoImplCopyWithImpl<$Res>
    extends _$CreditInfoCopyWithImpl<$Res, _$CreditInfoImpl>
    implements _$$CreditInfoImplCopyWith<$Res> {
  __$$CreditInfoImplCopyWithImpl(
      _$CreditInfoImpl _value, $Res Function(_$CreditInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreditInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = null,
    Object? minPublish = null,
    Object? canPublish = null,
    Object? logs = null,
  }) {
    return _then(_$CreditInfoImpl(
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      minPublish: null == minPublish
          ? _value.minPublish
          : minPublish // ignore: cast_nullable_to_non_nullable
              as int,
      canPublish: null == canPublish
          ? _value.canPublish
          : canPublish // ignore: cast_nullable_to_non_nullable
              as bool,
      logs: null == logs
          ? _value._logs
          : logs // ignore: cast_nullable_to_non_nullable
              as List<CreditLog>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreditInfoImpl implements _CreditInfo {
  const _$CreditInfoImpl(
      {required this.score,
      required this.minPublish,
      required this.canPublish,
      final List<CreditLog> logs = const []})
      : _logs = logs;

  factory _$CreditInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreditInfoImplFromJson(json);

  @override
  final int score;
  @override
  final int minPublish;
  @override
  final bool canPublish;
  final List<CreditLog> _logs;
  @override
  @JsonKey()
  List<CreditLog> get logs {
    if (_logs is EqualUnmodifiableListView) return _logs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_logs);
  }

  @override
  String toString() {
    return 'CreditInfo(score: $score, minPublish: $minPublish, canPublish: $canPublish, logs: $logs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreditInfoImpl &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.minPublish, minPublish) ||
                other.minPublish == minPublish) &&
            (identical(other.canPublish, canPublish) ||
                other.canPublish == canPublish) &&
            const DeepCollectionEquality().equals(other._logs, _logs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, score, minPublish, canPublish,
      const DeepCollectionEquality().hash(_logs));

  /// Create a copy of CreditInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreditInfoImplCopyWith<_$CreditInfoImpl> get copyWith =>
      __$$CreditInfoImplCopyWithImpl<_$CreditInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreditInfoImplToJson(
      this,
    );
  }
}

abstract class _CreditInfo implements CreditInfo {
  const factory _CreditInfo(
      {required final int score,
      required final int minPublish,
      required final bool canPublish,
      final List<CreditLog> logs}) = _$CreditInfoImpl;

  factory _CreditInfo.fromJson(Map<String, dynamic> json) =
      _$CreditInfoImpl.fromJson;

  @override
  int get score;
  @override
  int get minPublish;
  @override
  bool get canPublish;
  @override
  List<CreditLog> get logs;

  /// Create a copy of CreditInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreditInfoImplCopyWith<_$CreditInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreditLog _$CreditLogFromJson(Map<String, dynamic> json) {
  return _CreditLog.fromJson(json);
}

/// @nodoc
mixin _$CreditLog {
  int get delta => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this CreditLog to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreditLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreditLogCopyWith<CreditLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditLogCopyWith<$Res> {
  factory $CreditLogCopyWith(CreditLog value, $Res Function(CreditLog) then) =
      _$CreditLogCopyWithImpl<$Res, CreditLog>;
  @useResult
  $Res call({int delta, String reason, String? createdAt});
}

/// @nodoc
class _$CreditLogCopyWithImpl<$Res, $Val extends CreditLog>
    implements $CreditLogCopyWith<$Res> {
  _$CreditLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreditLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? delta = null,
    Object? reason = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      delta: null == delta
          ? _value.delta
          : delta // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreditLogImplCopyWith<$Res>
    implements $CreditLogCopyWith<$Res> {
  factory _$$CreditLogImplCopyWith(
          _$CreditLogImpl value, $Res Function(_$CreditLogImpl) then) =
      __$$CreditLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int delta, String reason, String? createdAt});
}

/// @nodoc
class __$$CreditLogImplCopyWithImpl<$Res>
    extends _$CreditLogCopyWithImpl<$Res, _$CreditLogImpl>
    implements _$$CreditLogImplCopyWith<$Res> {
  __$$CreditLogImplCopyWithImpl(
      _$CreditLogImpl _value, $Res Function(_$CreditLogImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreditLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? delta = null,
    Object? reason = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$CreditLogImpl(
      delta: null == delta
          ? _value.delta
          : delta // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreditLogImpl implements _CreditLog {
  const _$CreditLogImpl(
      {required this.delta, required this.reason, this.createdAt});

  factory _$CreditLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreditLogImplFromJson(json);

  @override
  final int delta;
  @override
  final String reason;
  @override
  final String? createdAt;

  @override
  String toString() {
    return 'CreditLog(delta: $delta, reason: $reason, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreditLogImpl &&
            (identical(other.delta, delta) || other.delta == delta) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, delta, reason, createdAt);

  /// Create a copy of CreditLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreditLogImplCopyWith<_$CreditLogImpl> get copyWith =>
      __$$CreditLogImplCopyWithImpl<_$CreditLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreditLogImplToJson(
      this,
    );
  }
}

abstract class _CreditLog implements CreditLog {
  const factory _CreditLog(
      {required final int delta,
      required final String reason,
      final String? createdAt}) = _$CreditLogImpl;

  factory _CreditLog.fromJson(Map<String, dynamic> json) =
      _$CreditLogImpl.fromJson;

  @override
  int get delta;
  @override
  String get reason;
  @override
  String? get createdAt;

  /// Create a copy of CreditLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreditLogImplCopyWith<_$CreditLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AppNotification _$AppNotificationFromJson(Map<String, dynamic> json) {
  return _AppNotification.fromJson(json);
}

/// @nodoc
mixin _$AppNotification {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  bool get read => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this AppNotification to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppNotificationCopyWith<AppNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppNotificationCopyWith<$Res> {
  factory $AppNotificationCopyWith(
          AppNotification value, $Res Function(AppNotification) then) =
      _$AppNotificationCopyWithImpl<$Res, AppNotification>;
  @useResult
  $Res call(
      {String id,
      String title,
      String body,
      String type,
      bool read,
      String? createdAt});
}

/// @nodoc
class _$AppNotificationCopyWithImpl<$Res, $Val extends AppNotification>
    implements $AppNotificationCopyWith<$Res> {
  _$AppNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? body = null,
    Object? type = null,
    Object? read = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      read: null == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppNotificationImplCopyWith<$Res>
    implements $AppNotificationCopyWith<$Res> {
  factory _$$AppNotificationImplCopyWith(_$AppNotificationImpl value,
          $Res Function(_$AppNotificationImpl) then) =
      __$$AppNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String body,
      String type,
      bool read,
      String? createdAt});
}

/// @nodoc
class __$$AppNotificationImplCopyWithImpl<$Res>
    extends _$AppNotificationCopyWithImpl<$Res, _$AppNotificationImpl>
    implements _$$AppNotificationImplCopyWith<$Res> {
  __$$AppNotificationImplCopyWithImpl(
      _$AppNotificationImpl _value, $Res Function(_$AppNotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? body = null,
    Object? type = null,
    Object? read = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$AppNotificationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      read: null == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppNotificationImpl implements _AppNotification {
  const _$AppNotificationImpl(
      {required this.id,
      required this.title,
      required this.body,
      this.type = 'system',
      this.read = false,
      this.createdAt});

  factory _$AppNotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppNotificationImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String body;
  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final bool read;
  @override
  final String? createdAt;

  @override
  String toString() {
    return 'AppNotification(id: $id, title: $title, body: $body, type: $type, read: $read, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppNotificationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.read, read) || other.read == read) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, body, type, read, createdAt);

  /// Create a copy of AppNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppNotificationImplCopyWith<_$AppNotificationImpl> get copyWith =>
      __$$AppNotificationImplCopyWithImpl<_$AppNotificationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppNotificationImplToJson(
      this,
    );
  }
}

abstract class _AppNotification implements AppNotification {
  const factory _AppNotification(
      {required final String id,
      required final String title,
      required final String body,
      final String type,
      final bool read,
      final String? createdAt}) = _$AppNotificationImpl;

  factory _AppNotification.fromJson(Map<String, dynamic> json) =
      _$AppNotificationImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get body;
  @override
  String get type;
  @override
  bool get read;
  @override
  String? get createdAt;

  /// Create a copy of AppNotification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppNotificationImplCopyWith<_$AppNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
