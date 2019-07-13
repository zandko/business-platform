import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        ScreenUtil.getInstance().setWidth(26),
      ),
      width: MediaQuery.of(context).size.width,
      height: ScreenUtil.getInstance().setHeight(164),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: ScreenUtil.getInstance().setWidth(2),
            color: Color.fromRGBO(229, 229, 229, 1),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildMenuItem(
            '精选手机',
            Icon(
              Icons.card_giftcard,
              size: ScreenUtil.getInstance().setSp(56),
              color: Color.fromRGBO(255, 138, 35, 1),
            ),
          ),
          _buildMenuItem(
            '限时秒杀',
            Icon(
              Icons.flash_on,
              size: ScreenUtil.getInstance().setSp(56),
              color: Color.fromRGBO(132, 99, 210, 1),
            ),
          ),
          _buildMenuItem(
            '小米众筹',
            Icon(
              Icons.local_florist,
              size: ScreenUtil.getInstance().setSp(56),
              color: Color.fromRGBO(74, 149, 233, 1),
            ),
          ),
          _buildMenuItem(
            '在线直播',
            Icon(
              Icons.videocam,
              size: ScreenUtil.getInstance().setSp(56),
              color: Color.fromRGBO(238, 100, 100, 1),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(title, Widget icon) {
    return Column(
      children: <Widget>[
        icon,
        Text(
          title,
          style: TextStyle(
            fontSize: ScreenUtil.getInstance().setSp(28),
            color: Color.fromRGBO(56, 56, 56, 1),
          ),
        ),
      ],
    );
  }
}
