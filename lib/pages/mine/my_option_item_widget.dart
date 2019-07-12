import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOptioinItemWidget extends StatelessWidget {
  final String picUrl;
  final String title;
  final bool border;

  MyOptioinItemWidget({Key key, this.picUrl, this.title, this.border = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.asset(
          picUrl,
          width: ScreenUtil.getInstance().setWidth(56),
          height: ScreenUtil.getInstance().setHeight(56),
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.only(
              left: ScreenUtil.getInstance().setWidth(10),
              right: ScreenUtil.getInstance().setWidth(24),
            ),
            height: ScreenUtil.getInstance().setHeight(94),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: ScreenUtil.getInstance().setWidth(1),
                  color: border ? Colors.white : Colors.black12,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(30),
                    color: Color.fromRGBO(56, 56, 56, 1),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: ScreenUtil.getInstance().setSp(35),
                  color: Color.fromRGBO(153, 153, 153, 1),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
