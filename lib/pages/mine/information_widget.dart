import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/components/cache_network_image.dart';

class InformationWidget extends StatelessWidget {
  final String avatar;
  final String name;
  final String introduction;

  InformationWidget({Key key, this.avatar, this.name, this.introduction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: ScreenUtil.getInstance().setWidth(28),
      ),
      width: MediaQuery.of(context).size.width,
      height: ScreenUtil.getInstance().setHeight(168),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        image: DecorationImage(
            image: AssetImage('static/images/mybg.png'),
            fit: BoxFit.fill
        ),
      ),
      child: Stack(
        children: <Widget>[
          _buildAvatarWidget(),
          _buildNameWidget(),
          _buildExchangeWidget(),
        ],
      ),
    );
  }

  Widget _buildAvatarWidget() {
    return Positioned(
      left: 0.0,
      width: ScreenUtil.getInstance().setWidth(112),
      height: ScreenUtil.getInstance().setHeight(112),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          ScreenUtil.getInstance().setWidth(56),
        ),
        child: GZCacheNetworkImageWidget(
          imageUrl: avatar,
        ),
      ),
    );
  }

  Widget _buildNameWidget() {
    return Positioned(
      top: ScreenUtil.getInstance().setHeight(10),
      left: ScreenUtil.getInstance().setWidth(126),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: ScreenUtil.getInstance().setSp(32),
            ),
          ),
          Text(
            introduction,
            style: TextStyle(
              color: Colors.white30,
              fontSize: ScreenUtil.getInstance().setSp(28),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExchangeWidget() {
    return Positioned(
      right: 0.0,
      bottom: ScreenUtil.getInstance().setHeight(54),
      child: Container(
        alignment: Alignment.center,
        width: ScreenUtil.getInstance().setWidth(164),
        height: ScreenUtil.getInstance().setHeight(62),
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 190, 0, 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              ScreenUtil.getInstance().setWidth(32),
            ),
            bottomLeft: Radius.circular(
              ScreenUtil.getInstance().setWidth(32),
            ),
          ),
        ),
        child: Text(
          '积分兑换',
          style: TextStyle(
            fontSize: ScreenUtil.getInstance().setSp(26),
            color: Color.fromRGBO(126, 77, 29, 1),
          ),
        ),
      ),
    );
  }
}
