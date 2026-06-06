import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/models.dart';

class ListingTile extends StatelessWidget {
  const ListingTile({super.key, required this.listing});
  final Listing listing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 56,
        height: 56,
        child: CachedNetworkImage(imageUrl: listing.imageUrl, fit: BoxFit.cover),
      ),
      title: Text(listing.title, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Text('¥${listing.price.toStringAsFixed(0)} · ${listing.region}'),
      trailing: listing.favorited ? const Icon(Icons.favorite, color: Colors.red) : null,
      onTap: () => context.push('/listing/${listing.id}'),
    );
  }
}
