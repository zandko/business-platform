import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/components/cache_network_image.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shop_app/data/home.dart';
import 'package:shop_app/utils/log_util.dart';

class SwiperImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.getInstance().setHeight(348),
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
            child: GZCacheNetworkImageWidget(
              height: ScreenUtil.getInstance().setHeight(348),
              imageUrl: banner_images[index],
            ),
          );
        },
      ),
    );
  }
}
