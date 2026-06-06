import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/application/auth_provider.dart';
import '../features/auth/presentation/login_page.dart';
import '../features/categories/presentation/categories_page.dart';
import '../features/chat/presentation/chat_page.dart';
import '../features/credit/presentation/credit_page.dart';
import '../features/favorites/presentation/favorites_page.dart';
import '../features/home/presentation/home_page.dart';
import '../features/home/presentation/home_shell.dart';
import '../features/listings/presentation/create_tab_page.dart';
import '../features/listings/presentation/listing_detail_page.dart';
import '../features/listings/presentation/listing_form_page.dart';
import '../features/listings/presentation/listings_page.dart';
import '../features/listings/presentation/my_listings_page.dart';
import '../features/messages/presentation/messages_page.dart';
import '../features/orders/presentation/order_create_page.dart';
import '../features/orders/presentation/order_detail_page.dart';
import '../features/orders/presentation/order_dispute_page.dart';
import '../features/orders/presentation/order_pay_page.dart';
import '../features/orders/presentation/orders_list_page.dart';
import '../features/profile/presentation/profile_page.dart';
import '../features/profile/presentation/settings_page.dart';
import '../features/splash/presentation/splash_page.dart';
import '../features/wanted/presentation/wanted_create_page.dart';
import '../features/wanted/presentation/wanted_page.dart';
import 'router_refresh.dart';

final _rootKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final routerProvider = Provider<GoRouter>((ref) {
  final refresh = RouterRefreshNotifier(ref);
  ref.onDispose(refresh.dispose);

  return GoRouter(
    navigatorKey: _rootKey,
    initialLocation: '/splash',
    refreshListenable: refresh,
    redirect: (context, state) {
      final authed = ref.read(authProvider) != null;
      final loc = state.matchedLocation;
      const public = ['/splash', '/login'];
      if (public.contains(loc)) {
        if (authed && loc == '/login') return '/home';
        return null;
      }
      if (!authed) return '/login';
      return null;
    },
    routes: [
      GoRoute(path: '/splash', builder: (_, __) => const SplashPage()),
      GoRoute(path: '/login', builder: (_, __) => const LoginPage()),
      StatefulShellRoute.indexedStack(
        builder: (_, __, shell) => HomeShell(navigationShell: shell),
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(path: '/home', builder: (_, __) => const HomePage()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: '/publish', builder: (_, __) => const CreateTabPage()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: '/messages', builder: (_, __) => const MessagesPage()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: '/profile', builder: (_, __) => const ProfilePage()),
          ]),
        ],
      ),
      GoRoute(parentNavigatorKey: _rootKey, path: '/categories', builder: (_, __) => const CategoriesPage()),
      GoRoute(
        parentNavigatorKey: _rootKey,
        path: '/listings',
        builder: (_, s) => ListingsPage(
          categoryId: s.uri.queryParameters['categoryId'],
          categoryName: s.uri.queryParameters['name'],
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootKey,
        path: '/listing/:id',
        builder: (_, s) => ListingDetailPage(listingId: s.pathParameters['id']!),
      ),
      GoRoute(parentNavigatorKey: _rootKey, path: '/listing/create', builder: (_, __) => const ListingFormPage()),
      GoRoute(
        parentNavigatorKey: _rootKey,
        path: '/listing/:id/edit',
        builder: (_, s) => ListingFormPage(listingId: s.pathParameters['id']),
      ),
      GoRoute(
        parentNavigatorKey: _rootKey,
        path: '/chat/:listingId',
        builder: (_, s) => ChatPage(listingId: s.pathParameters['listingId']!),
      ),
      GoRoute(
        parentNavigatorKey: _rootKey,
        path: '/order/create',
        builder: (_, s) => OrderCreatePage(listingId: s.uri.queryParameters['listingId']!),
      ),
      GoRoute(
        parentNavigatorKey: _rootKey,
        path: '/order/:id/pay',
        builder: (_, s) => OrderPayPage(orderId: s.pathParameters['id']!),
      ),
      GoRoute(parentNavigatorKey: _rootKey, path: '/orders/buy', builder: (_, __) => const OrdersListPage(role: 'buy')),
      GoRoute(parentNavigatorKey: _rootKey, path: '/orders/sell', builder: (_, __) => const OrdersListPage(role: 'sell')),
      GoRoute(
        parentNavigatorKey: _rootKey,
        path: '/order/:id',
        builder: (_, s) => OrderDetailPage(orderId: s.pathParameters['id']!),
      ),
      GoRoute(
        parentNavigatorKey: _rootKey,
        path: '/order/:id/dispute',
        builder: (_, s) => OrderDisputePage(orderId: s.pathParameters['id']!),
      ),
      GoRoute(parentNavigatorKey: _rootKey, path: '/wanted', builder: (_, __) => const WantedPage()),
      GoRoute(parentNavigatorKey: _rootKey, path: '/wanted/create', builder: (_, __) => const WantedCreatePage()),
      GoRoute(parentNavigatorKey: _rootKey, path: '/credit', builder: (_, __) => const CreditPage()),
      GoRoute(parentNavigatorKey: _rootKey, path: '/favorites', builder: (_, __) => const FavoritesPage()),
      GoRoute(parentNavigatorKey: _rootKey, path: '/my-listings', builder: (_, __) => const MyListingsPage()),
      GoRoute(parentNavigatorKey: _rootKey, path: '/settings', builder: (_, __) => const SettingsPage()),
    ],
  );
});
