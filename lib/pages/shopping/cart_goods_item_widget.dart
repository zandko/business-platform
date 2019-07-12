import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/components/cache_network_image.dart';
import 'package:shop_app/model/cart_goods_entity.dart';

class CartGoodItem extends StatefulWidget {
  final CartGoodsItem cartGoodsItem;

  CartGoodItem({Key key, this.cartGoodsItem}) : super(key: key);

  @override
  _CartGoodItemState createState() => _CartGoodItemState();
}

class _CartGoodItemState extends State<CartGoodItem> {
  bool _checkboxSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: ScreenUtil.getInstance().setHeight(20),
      ),
      padding: EdgeInsets.only(
        left: ScreenUtil.getInstance().setWidth(12),
      ),
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: ScreenUtil.getInstance().setHeight(188),
      child: Row(
        children: <Widget>[
          _buildSelectGoodsWidget(),
          _buildGoodsPlanWidget(),
          _buildGoodsDescriptionWidget(),
          _buildGoodsQuantity(),
        ],
      ),
    );
  }

  Widget _buildSelectGoodsWidget() {
    return InkWell(
      onTap: () {
        setState(() {
          _checkboxSelected = !_checkboxSelected;
        });
      },
      child: Container(
        margin: EdgeInsets.only(
          right: ScreenUtil.getInstance().setWidth(28),
        ),
        child: _checkboxSelected
            ? Icon(
                Icons.check_circle,
                size: ScreenUtil.getInstance().setSp(42),
                color: Color.fromRGBO(255, 112, 58, 1),
              )
            : Icon(
                Icons.radio_button_unchecked,
                size: ScreenUtil.getInstance().setSp(42),
                color: Color.fromRGBO(153, 153, 153, 1),
              ),
      ),
    );
  }

  Widget _buildGoodsPlanWidget() {
    return GZCacheNetworkImageWidget(
      width: ScreenUtil.getInstance().setWidth(150),
      height: ScreenUtil.getInstance().setHeight(150),
      imageUrl: widget.cartGoodsItem.picUrl,
    );
  }

  Widget _buildGoodsDescriptionWidget() {
    return Container(
      padding: EdgeInsets.only(
        left: ScreenUtil.getInstance().setWidth(18),
      ),
      width: ScreenUtil.getInstance().setWidth(340),
      height: ScreenUtil.getInstance().setHeight(150),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.cartGoodsItem.title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: ScreenUtil.getInstance().setSp(28),
              color: Color.fromRGBO(80, 80, 80, 1),
            ),
          ),
          Text(
            widget.cartGoodsItem.model,
            style: TextStyle(
              fontSize: ScreenUtil.getInstance().setSp(26),
              color: Color.fromRGBO(166, 166, 166, 1),
            ),
          ),
          Row(
            children: <Widget>[
              Text(
                '￥${widget.cartGoodsItem.price}',
                style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(32),
                  color: Color.fromRGBO(255, 112, 58, 1),
                ),
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                '￥${widget.cartGoodsItem.market_price}',
                style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(26),
                  color: Color.fromRGBO(166, 166, 166, 1),
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Color.fromRGBO(166, 166, 166, 1),
                  decorationStyle: TextDecorationStyle.solid,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGoodsQuantity() {
    return Container(
      width: ScreenUtil.getInstance().setWidth(138),
      height: ScreenUtil.getInstance().setHeight(46),
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil.getInstance().setWidth(46),
            height: ScreenUtil.getInstance().setHeight(46),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                width: ScreenUtil.getInstance().setWidth(1),
                color: Color.fromRGBO(229, 229, 229, 1),
              ),
            ),
            child: Text(
              '-',
              style: TextStyle(
                fontSize: ScreenUtil.getInstance().setSp(24),
                color: Color.fromRGBO(166, 166, 166, 0.5),
              ),
            ),
          ),
          Container(
            width: ScreenUtil.getInstance().setWidth(46),
            height: ScreenUtil.getInstance().setHeight(46),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: ScreenUtil.getInstance().setWidth(1),
                  color: Color.fromRGBO(229, 229, 229, 1),
                ),
                bottom: BorderSide(
                  width: ScreenUtil.getInstance().setWidth(1),
                  color: Color.fromRGBO(229, 229, 229, 1),
                ),
              ),
            ),
            child: Text(
              '${widget.cartGoodsItem.quantity}',
              style: TextStyle(
                fontSize: ScreenUtil.getInstance().setSp(24),
                color: Color.fromRGBO(80, 80, 80, 1),
              ),
            ),
          ),
          Container(
            width: ScreenUtil.getInstance().setWidth(46),
            height: ScreenUtil.getInstance().setHeight(46),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                width: ScreenUtil.getInstance().setWidth(1),
                color: Color.fromRGBO(229, 229, 229, 1),
              ),
            ),
            child: Text(
              '+',
              style: TextStyle(
                fontSize: ScreenUtil.getInstance().setSp(24),
                color: Color.fromRGBO(166, 166, 166, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
