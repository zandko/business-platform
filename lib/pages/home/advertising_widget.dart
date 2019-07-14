import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/components/cache_network_image.dart';

class AdvertisingWidget extends StatelessWidget {
  final String imageUrl;

  AdvertisingWidget({Key key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(26),
      ),
      height: ScreenUtil.getInstance().setHeight(288),
      child: GZCacheNetworkImageWidget(
        height: ScreenUtil.getInstance().setHeight(288),
        imageUrl: imageUrl,
      ),
    );
  }
}
