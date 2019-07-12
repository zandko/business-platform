import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/model/order_menu_status_entity.dart';

class OrderStatusWidget extends StatelessWidget {
  final List<OrderMenuStatusItem> orderMenuStatusItem;

  OrderStatusWidget({Key key, this.orderMenuStatusItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: ScreenUtil.getInstance().setHeight(234),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          _buildMyAllOrderWidget(),
          _buildMenuStatusWidget(),
        ],
      ),
    );
  }

  Widget _buildMyAllOrderWidget() {
    return Container(
      padding: EdgeInsets.only(
        left: ScreenUtil.getInstance().setWidth(28),
        right: ScreenUtil.getInstance().setWidth(24),
      ),
      height: ScreenUtil.getInstance().setHeight(82),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: Color.fromRGBO(80, 80, 80, 0.1),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '我的订单',
            style: TextStyle(
              fontSize: ScreenUtil.getInstance().setSp(32),
              color: Color.fromRGBO(80, 80, 80, 1),
            ),
          ),
          Row(
            children: <Widget>[
              Text(
                '全部订单',
                style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(26),
                  color: Color.fromRGBO(166, 166, 166, 1),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: ScreenUtil.getInstance().setSp(35),
                color: Color.fromRGBO(153, 153, 153, 1),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuStatusWidget() {
    return Container(
      padding: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(20),
      ),
      height: ScreenUtil.getInstance().setHeight(150),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: orderMenuStatusItem.map((item) {
          return Column(
            children: <Widget>[
              Image.asset(
                item.picUrl,
                width: ScreenUtil.getInstance().setWidth(56),
                height: ScreenUtil.getInstance().setHeight(56),
              ),
              Text(
                item.title,
                style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(26),
                  color: Color.fromRGBO(110, 110, 110, 1),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
