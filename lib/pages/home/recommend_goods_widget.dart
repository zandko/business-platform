import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/components/cache_network_image.dart';

class RecommendGoodsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: ScreenUtil.getInstance().setHeight(534),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GZCacheNetworkImageWidget(
            width: ScreenUtil.getInstance().setWidth(373),
            height: ScreenUtil.getInstance().setHeight(534),
            imageUrl: 'https://i1.mifile.cn/a4/xmad_15592788710155_nYAat.jpg',
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GZCacheNetworkImageWidget(
                width: ScreenUtil.getInstance().setWidth(367),
                height: ScreenUtil.getInstance().setHeight(258),
                imageUrl:
                'https://i1.mifile.cn/a4/xmad_15621496532895_qtPax.jpg',
              ),
              GZCacheNetworkImageWidget(
                width: ScreenUtil.getInstance().setWidth(367),
                height: ScreenUtil.getInstance().setHeight(264),
                imageUrl:
                'https://i1.mifile.cn/a4/xmad_15622932130351_aJFEP.jpg',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
