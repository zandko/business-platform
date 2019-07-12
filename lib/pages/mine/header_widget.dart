import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/style/style.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: ScreenUtil.getInstance().setHeight(90),
      padding: EdgeInsets.only(
        right: ScreenUtil.getInstance().setWidth(28),
      ),
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(
            GZIcons.message_fill,
            size: ScreenUtil.getInstance().setSp(46),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
