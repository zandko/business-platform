import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GZCacheNetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  GZCacheNetworkImageWidget({Key key, this.imageUrl, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return CachedNetworkImage(
      width: width ?? screenWidth,
      height: height,
      fadeOutDuration: const Duration(milliseconds: 300),
      fadeInDuration: const Duration(milliseconds: 700),
      fit: BoxFit.fill,
      imageUrl: imageUrl,
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
