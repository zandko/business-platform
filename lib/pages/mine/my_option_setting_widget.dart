import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/pages/mine/my_option_item_widget.dart';

class MyOptionSettingWidget extends StatelessWidget {
  final String picUrl;
  final String title;

  MyOptionSettingWidget({Key key, this.picUrl, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        left: ScreenUtil.getInstance().setWidth(30),
      ),
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(16),
        bottom: ScreenUtil.getInstance().setHeight(16),
      ),
      child: MyOptioinItemWidget(picUrl: picUrl, title: title),
    );
  }
}
