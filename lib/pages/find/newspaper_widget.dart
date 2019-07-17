import 'package:flutter/material.dart';
import 'package:shop_app/model/newspaper_entity.dart';
import 'package:shop_app/components/cache_network_image.dart';
import 'package:shop_app/pages/find/newspaper_detail_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewspaperListWidget extends StatelessWidget {
  final List<NewspaperItem> newspaperItem;

  NewspaperListWidget({Key key, this.newspaperItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: newspaperItem.map((item) {
        return _buildNewspaperItemWidget(item, context);
      }).toList(),
    );
  }

  Widget _buildNewspaperItemWidget(NewspaperItem newspaperItem, context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewspaperDetailPage(),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: ScreenUtil.getInstance().setHeight(596),
        child: Column(
          children: <Widget>[
            GZCacheNetworkImageWidget(
              height: ScreenUtil.getInstance().setHeight(374),
              imageUrl: newspaperItem.picUrl,
            ),
            Container(
              padding: EdgeInsets.all(
                ScreenUtil.getInstance().setWidth(26),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    newspaperItem.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(30),
                      color: Color.fromRGBO(56, 56, 56, 1),
                    ),
                  ),
                  Text(
                    newspaperItem.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(26),
                      color: Color.fromRGBO(128, 128, 128, 1),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        newspaperItem.createdAt,
                        style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(24),
                          color: Color.fromRGBO(128, 128, 128, 1),
                        ),
                      ),
                      Text(
                        '${newspaperItem.browse} 阅读',
                        style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(24),
                          color: Color.fromRGBO(128, 128, 128, 1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
