import 'package:flutter/material.dart';
import 'package:shop_app/pages/shopping/cart_goods_item_widget.dart';
import 'package:shop_app/model/cart_goods_entity.dart';

class CartGoodsList extends StatefulWidget {
  final List<CartGoodsItem> cartGoodsItem;

  CartGoodsList({Key key, this.cartGoodsItem}) : super(key: key);

  @override
  _CartGoodsListState createState() => _CartGoodsListState();
}

class _CartGoodsListState extends State<CartGoodsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: widget.cartGoodsItem.map((item) {
          return CartGoodItem(cartGoodsItem: item);
        }).toList(),
      ),
    );
  }
}
