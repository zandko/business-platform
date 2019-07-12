import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/style/style.dart';

import 'package:shop_app/pages/shopping/cart_goods_list_widget.dart';
import 'package:shop_app/pages/shopping/recommend_title_widget.dart';
import 'package:shop_app/pages/shopping/recommend_goods_list_widget.dart';
import 'package:shop_app/pages/shopping/cart_settlement_widget.dart';

import 'package:shop_app/data/shopping.dart';
import 'package:shop_app/model/recommend_goods_entity.dart';
import 'package:shop_app/model/cart_goods_entity.dart';
import 'package:shop_app/model/entity_factory.dart';

class ShoppingPage extends StatefulWidget {
  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  List<RecommandGoodsItem> recommandGoodsItem;
  List<CartGoodsItem> cartGoodsItem;

  @override
  void initState() {
    super.initState();
    recommandGoodsItem =
        EntityFactory.generateOBJ<RecommendGoodsEntity>(recommendGoods)
            .recommendGoods;
    cartGoodsItem =
        EntityFactory.generateOBJ<CartGoodsEntity>(cartGoods).cartGoods;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBarWidget(),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                CartGoodsList(cartGoodsItem: cartGoodsItem),
                RecommendTitleWidget(),
                RecommendGoodsList(recommandGoodsItem: recommandGoodsItem),
              ],
            ),
          ),
          CartSettlementWidget(),
        ],
      ),
    );
  }

  Widget _buildActionsWidget() {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            right: ScreenUtil.getInstance().setWidth(50),
          ),
          child: Text(
            '编辑',
            style: TextStyle(
              fontSize: ScreenUtil.getInstance().setSp(36),
              color: Color.fromRGBO(80, 80, 80, 1),
            ),
          ),
        ),
        Icon(
          GZIcons.message_fill,
          size: ScreenUtil.getInstance().setSp(46),
          color: Color.fromRGBO(80, 80, 80, 1),
        ),
      ],
    );
  }

  Widget _buildAppBarWidget() {
    return AppBar(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      elevation: 2.0,
      centerTitle: true,
      title: Text(
        '购物车',
        style: TextStyle(
          fontSize: ScreenUtil.getInstance().setSp(38),
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(80, 80, 80, 1),
        ),
      ),
      actions: <Widget>[
        _buildActionsWidget(),
      ],
    );
  }
}
