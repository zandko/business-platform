import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/pages/shopping/recommend_goods_item_widget.dart';
import 'package:shop_app/model/recommend_goods_entity.dart';

class RecommendGoodsList extends StatelessWidget {
  final List<RecommandGoodsItem> recommandGoodsItem;

  RecommendGoodsList({Key key, this.recommandGoodsItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(32),
      ),
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Wrap(
        spacing: ScreenUtil.getInstance().setWidth(18),
        runSpacing: ScreenUtil.getInstance().setHeight(26),
        children: recommandGoodsItem.map((item) {
          return RecommendGoodsItem(recommandGoodsItem: item);
        }).toList(),
      ),
    );
  }
}
