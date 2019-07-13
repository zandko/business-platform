import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/components/cache_network_image.dart';

class MiHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        ScreenUtil.getInstance().setWidth(28),
      ),
      width: MediaQuery.of(context).size.width,
      height: ScreenUtil.getInstance().setHeight(160),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.black12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GZCacheNetworkImageWidget(
            width: ScreenUtil.getInstance().setWidth(144),
            height: ScreenUtil.getInstance().setHeight(104),
            imageUrl:
            'https://img.alicdn.com/tfscom/i1/2610856926/TB2JAdPhwRkpuFjy1zeXXc.6FXa_!!2610856926.jpg_360x360xzq90.jpg_.webp',
          ),
          Container(
            width: ScreenUtil.getInstance().setWidth(374),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '小米之家北京朝阳合生汇店',
                  style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(28),
                    color: Color.fromRGBO(56, 56, 56, 1),
                  ),
                ),
                Text(
                  '距离1公里',
                  style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(26),
                    color: Color.fromRGBO(128, 128, 128, 1),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                '其他零售店',
                style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(24),
                  color: Color.fromRGBO(128, 128, 128, 1),
                ),
              ),
              Icon(
                Icons.chevron_right,
                size: ScreenUtil.getInstance().setWidth(25),
                color: Color.fromRGBO(153, 153, 153, 1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
