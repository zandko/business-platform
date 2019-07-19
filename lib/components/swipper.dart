import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shop_app/data/home.dart';
import 'package:shop_app/utils/log_util.dart';
import 'package:shop_app/tools/arc_clipper.dart';
import 'package:shop_app/components/cache_network_image.dart';

class SwipperWidget extends StatelessWidget {
  final double height;
  final bool clipPath;
  final bool loop;
  final bool autoplay;

  SwipperWidget(
      {Key key,
      this.height,
      this.clipPath = false,
      this.loop = true,
      this.autoplay = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: height,
      child: Swiper(
        index: 0,
        loop: true,
        autoplay: true,
        duration: 300,
        pagination: SwiperPagination(),
        scrollDirection: Axis.horizontal,
        itemCount: banner_images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              LogUtil.v("你点击了第$index个");
            },
            child: clipPath
                ? ClipPath(
                    clipper: ArcClipper(),
                    child: GZCacheNetworkImageWidget(
                      height: height,
                      imageUrl: banner_images[index],
                    ),
                  )
                : GZCacheNetworkImageWidget(
                    height: height,
                    imageUrl: banner_images[index],
                  ),
          );
        },
      ),
    );
  }
}
