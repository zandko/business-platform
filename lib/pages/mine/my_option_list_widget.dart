import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/model/optins_set_entity.dart';
import 'package:shop_app/pages/mine/my_option_item_widget.dart';

class MyOptionListWidget extends StatelessWidget {
  final List<OptinsSetItem> optinsSetItem;

  MyOptionListWidget({Key key, this.optinsSetItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        left: ScreenUtil.getInstance().setWidth(30),
      ),
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(16),
      ),
      child: Column(
        children: optinsSetItem.map((item) {
          return MyOptioinItemWidget(
              picUrl: item.picUrl,
              title: item.title,
              border:
                  item.title == '设置' || item.title == '更多功能' ? true : false);
        }).toList(),
      ),
    );
  }
}
