import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shop_app/data/home.dart';
import 'package:shop_app/utils/log_util.dart';
import 'package:shop_app/tools/arc_clipper.dart';
import 'package:shop_app/components/cache_network_image.dart';

class SwiperImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: Swiper(
        index: 0,
        loop: true,
        autoplay: true,
        duration: 300,
        pagination: SwiperPagination(),
        scrollDirection: Axis.horizontal,
        itemCount: banner_images.length,
        onTap: (index) {
          LogUtil.v("你点击了第$index个");
        },
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              height: 150,
              child: ClipPath(
                clipper: ArcClipper(),
                child: Stack(
                  children: <Widget>[
                    GZCacheNetworkImageWidget(
                      height: ScreenUtil.getInstance().setHeight(300),
                      imageUrl: banner_images[index],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
