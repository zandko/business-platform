import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendTitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.getInstance().setHeight(122),
      child: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil.getInstance().setHeight(76),
            child: Text(
              '为你推荐',
              style: TextStyle(
                fontSize: ScreenUtil.getInstance().setSp(36),
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(255, 112, 58, 1),
              ),
            ),
          ),
          Container(
            height: ScreenUtil.getInstance().setHeight(46),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: ScreenUtil.getInstance().setWidth(212),
                  height: ScreenUtil.getInstance().setHeight(2),
                  color: Color.fromRGBO(205, 205, 205, 1),
                ),
                Text(
                  '买了以上产品的人还买了',
                  style:
                  TextStyle(fontSize: ScreenUtil.getInstance().setSp(26)),
                ),
                Container(
                  width: ScreenUtil.getInstance().setWidth(212),
                  height: ScreenUtil.getInstance().setHeight(2),
                  color: Color.fromRGBO(205, 205, 205, 1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
