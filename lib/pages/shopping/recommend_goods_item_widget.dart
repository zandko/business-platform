import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/components/cache_network_image.dart';
import 'package:shop_app/model/recommend_goods_entity.dart';

class RecommendGoodsItem extends StatelessWidget {
  final RecommandGoodsItem recommandGoodsItem;

  RecommendGoodsItem({Key key, this.recommandGoodsItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.getInstance().setWidth(366),
      height: ScreenUtil.getInstance().setHeight(526),
      child: Column(
        children: <Widget>[
          _buildGoodsPictureWidget(),
          _buildDescriptionWidget(),
          _buildPriceWidget(),
        ],
      ),
    );
  }

  Widget _buildGoodsPictureWidget() {
    return Stack(
      children: <Widget>[
        GZCacheNetworkImageWidget(
          width: ScreenUtil.getInstance().setWidth(366),
          height: ScreenUtil.getInstance().setHeight(366),
          imageUrl: recommandGoodsItem.picUrl,
        ),
//        Positioned(
//          right: 8.0,
//          bottom: 8.0,
//          child: Text(
//            '${recommandGoodsItem.praise} 人好评',
//            style: TextStyle(
//              fontSize: ScreenUtil.getInstance().setSp(28),
//              fontWeight: FontWeight.bold,
//              color: Colors.white,
//            ),
//          ),
//        ),
      ],
    );
  }

  Widget _buildDescriptionWidget() {
    return Container(
      width: ScreenUtil.getInstance().setWidth(366),
      padding: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(7),
        left: ScreenUtil.getInstance().setWidth(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            recommandGoodsItem.title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: ScreenUtil.getInstance().setSp(32),
              color: Color.fromRGBO(80, 80, 80, 1),
            ),
          ),
          Text(
            recommandGoodsItem.highlight,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: ScreenUtil.getInstance().setSp(26),
              color: Color.fromRGBO(80, 80, 80, 1),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceWidget() {
    return Container(
      padding: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(10),
        left: ScreenUtil.getInstance().setWidth(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '￥ ${recommandGoodsItem.price}',
            style: TextStyle(
              fontSize: ScreenUtil.getInstance().setSp(32),
              color: Color.fromRGBO(245, 87, 78, 1),
            ),
          ),
          Icon(
            Icons.add_shopping_cart,
            size: ScreenUtil.getInstance().setSp(46),
            color: Color.fromRGBO(153, 153, 153, 1),
          ),
        ],
      ),
    );
  }
}
