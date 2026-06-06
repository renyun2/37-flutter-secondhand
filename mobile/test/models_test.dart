import 'package:flutter_test/flutter_test.dart';
import 'package:secondhand_app/data/models/models.dart';

void main() {
  test('UserProfile fromJson', () {
    final user = UserProfile.fromJson({
      'id': 'u1',
      'phone': '13800138000',
      'nickname': '测试',
      'region': '北京',
      'creditScore': 85,
    });
    expect(user.id, 'u1');
    expect(user.creditScore, 85);
  });

  test('Listing fromJson with defaults', () {
    final listing = Listing.fromJson({
      'id': 'l1',
      'userId': 'u1',
      'title': '二手手机',
      'price': 999,
      'categoryId': 'c1',
      'region': '上海',
      'imageUrl': 'https://example.com/a.jpg',
    });
    expect(listing.favorited, false);
    expect(listing.status, 'active');
  });

  test('Order status fields', () {
    final order = Order.fromJson({
      'id': 'o1',
      'listingId': 'l1',
      'buyerId': 'b1',
      'sellerId': 's1',
      'amount': 100,
      'status': 'paid',
      'deliveryType': 'face',
    });
    expect(order.status, 'paid');
    expect(order.deliveryType, 'face');
  });
}
