import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shop_app/model/menu_entity.dart';

class MenuWidget extends StatelessWidget {
  final List<ManuItems> manuItems;

  MenuWidget({Key key, this.manuItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.getInstance().setHeight(160) * 2,
      child: GridView.count(
        crossAxisCount: 5,
        crossAxisSpacing: 0,
        physics: NeverScrollableScrollPhysics(),
        children: manuItems.map((item) {
          return _buildMenuItemWidget(item);
        }).toList(),
      ),
    );
  }

  Widget _buildMenuItemWidget(ManuItems manuItems) {
    return Container(
      height: ScreenUtil.getInstance().setHeight(160),
      width: ScreenUtil.getInstance().setWidth(116),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CachedNetworkImage(
            width: ScreenUtil.getInstance().setWidth(116),
            height: ScreenUtil.getInstance().setHeight(94),
            imageUrl: manuItems.picUrl,
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Text(
            manuItems.title,
            style: TextStyle(
              fontSize: ScreenUtil.getInstance().setSp(26),
              decoration: TextDecoration.none,
              color: Color.fromRGBO(80, 80, 80, 1),
            ),
          ),
        ],
      ),
    );
  }
}
