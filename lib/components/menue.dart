import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeKingKongWidget extends StatelessWidget {
  final data;
  final String fontColor;
  HomeKingKongWidget({this.data, this.fontColor});
  @override
  Widget build(BuildContext context) {
    var colorInt = int.parse(fontColor.replaceAll('#', '0x'));
    Color color = Color(colorInt).withOpacity(1.0);
    return Container(
      height: ScreenUtil.getInstance().setHeight(160),
      width: ScreenUtil.getInstance().setWidth(116),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CachedNetworkImage(
            width: ScreenUtil.getInstance().setWidth(116),
            height: ScreenUtil.getInstance().setHeight(94),
            imageUrl: data.picUrl,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Text(
            data.title,
            style: TextStyle(
              fontSize: 13.0,
              height: 1.5,
              decoration: TextDecoration.none,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
