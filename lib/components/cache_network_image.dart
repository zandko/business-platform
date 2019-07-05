import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GZCacheNetworkImageWidget extends StatelessWidget {
  final String imageUrl;

  GZCacheNetworkImageWidget({Key key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fadeOutDuration: const Duration(milliseconds: 300),
      fadeInDuration: const Duration(milliseconds: 700),
      fit: BoxFit.fill,
      imageUrl: imageUrl,
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
