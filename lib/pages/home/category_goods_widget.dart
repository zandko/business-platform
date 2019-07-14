import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/components/cache_network_image.dart';

class CategoryGoodsWidget extends StatelessWidget {
  final TabController controller;

  CategoryGoodsWidget({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
     controller: controller,
      children: [8, 7, 6, 5, 4, 3, 2, 1].map((item) {
        return SingleChildScrollView(
          padding: EdgeInsets.all(
            ScreenUtil.getInstance().setWidth(15),
          ),
          child: Wrap(
            spacing: ScreenUtil.getInstance().setWidth(12),
            runSpacing: ScreenUtil.getInstance().setHeight(20),
            children: [1, 2, 3, 4, 5, 6, 7, 8].map((item1) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: ScreenUtil.getInstance().setWidth(354),
                  height: ScreenUtil.getInstance().setHeight(528),
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      GZCacheNetworkImageWidget(
                        width: ScreenUtil.getInstance().setWidth(354),
                        height: ScreenUtil.getInstance().setHeight(262),
                        imageUrl:
                            'https://img.alicdn.com/tfscom/i1/2610856926/TB2JAdPhwRkpuFjy1zeXXc.6FXa_!!2610856926.jpg_360x360xzq90.jpg_.webp',
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(10),
                      ),
                      Text(
                        '红米5 Plus',
                        style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(32),
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(80, 80, 80, 1),
                        ),
                      ),
                      Text(
                        '千元全面屏，前置柔光自拍',
                        style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(24),
                          color: Color.fromRGBO(80, 80, 80, 1),
                        ),
                      ),
                      Text(
                        '999起',
                        style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(32),
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(134, 134, 134, 1),
                        ),
                      ),
                      MaterialButton(
                        height: ScreenUtil.getInstance().setHeight(58),
                        minWidth: ScreenUtil.getInstance().setWidth(192),
                        color: Colors.red,
                        textColor: Colors.white,
                        child: new Text('立即购买'),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        );
      }).toList(),
    );
  }
}
