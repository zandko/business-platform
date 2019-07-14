import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewspaperWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(24),
        bottom: ScreenUtil.getInstance().setHeight(24),
      ),
      width: MediaQuery.of(context).size.width,
      height: ScreenUtil.getInstance().setHeight(96),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Divider(
            height: ScreenUtil.getInstance().setHeight(1),
            indent: 0.0,
            color: Color.fromRGBO(80, 80, 80, 1),
          ),
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: ScreenUtil.getInstance().setWidth(164),
                child: Text(
                  '商城早报',
                  style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(28),
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(245, 89, 89, 1),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: ScreenUtil.getInstance().setHeight(13),
                  right: ScreenUtil.getInstance().setWidth(25),
                ),
                width: ScreenUtil.getInstance().setWidth(1),
                height: ScreenUtil.getInstance().setHeight(70),
                color: Color.fromRGBO(80, 80, 80, 0.8),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: ScreenUtil.getInstance().setWidth(558),
                child: Text(
                  '小米8 青春版全面配色：梦幻蓝全面来袭！',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(28),
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(80, 80, 80, 1),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
