import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/components/cache_network_image.dart';

class SettlementPage extends StatefulWidget {
  @override
  _SettlementPageState createState() => _SettlementPageState();
}

class _SettlementPageState extends State<SettlementPage> {
  String radio = 'WeChat';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBarWidget(context),
      body: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.only(
              bottom: ScreenUtil.getInstance().setHeight(160),
            ),
            children: <Widget>[
              _buildDeliveryInfoWidget(),
              _buildPaymentMethodWidget(),
              _buildBillWidget(),
              _buildPurchaseGoodsWidget(),
            ],
          ),
          _buildGoToPayWidget(),
          _buildAddressWidget(),
        ],
      ),
    );
  }

  Widget _buildDeliveryInfoWidget() {
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(20),
      ),
      padding: EdgeInsets.fromLTRB(
        ScreenUtil.getInstance().setWidth(28),
        ScreenUtil.getInstance().setHeight(26),
        ScreenUtil.getInstance().setWidth(16),
        ScreenUtil.getInstance().setHeight(32),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: ScreenUtil.getInstance().setWidth(1),
            color: Colors.black12,
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      '张三',
                      style: TextStyle(
                        color: Color.fromRGBO(80, 80, 80, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil.getInstance().setSp(32),
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil.getInstance().setWidth(20),
                    ),
                    Text(
                      '17805202450',
                      style: TextStyle(
                        color: Color.fromRGBO(80, 80, 80, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil.getInstance().setSp(32),
                      ),
                    ),
                  ],
                ),
                Text(
                  '北京 北京市 朝阳区 xiaopiu秘密研究基地 xiaopiu大楼 (000000)',
                  style: TextStyle(
                    color: Color.fromRGBO(128, 128, 128, 1),
                    fontSize: ScreenUtil.getInstance().setSp(26),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            width: ScreenUtil.getInstance().setWidth(130),
            child: Icon(
              Icons.chevron_right,
              color: Color.fromRGBO(153, 153, 153, 1),
              size: ScreenUtil.getInstance().setSp(56),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodWidget() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(20),
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: ScreenUtil.getInstance().setWidth(22),
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1, color: Colors.black12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset(
                      'static/images/WeChat.png',
                      width: ScreenUtil.getInstance().setWidth(70),
                    ),
                    SizedBox(
                      width: ScreenUtil.getInstance().setWidth(20),
                    ),
                    Text(
                      '微信支付',
                      style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(30),
                        color: Color.fromRGBO(80, 80, 80, 1),
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil.getInstance().setWidth(30),
                    ),
                    Text(
                      '工行信用卡支付，享随机立减',
                      style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(26),
                        color: Color.fromRGBO(80, 80, 80, 1),
                      ),
                    ),
                  ],
                ),
                Radio(
                  value: 'WeChat',
                  groupValue: radio,
                  activeColor: Color.fromRGBO(255, 112, 58, 1),
                  onChanged: (String T) {
                    setState(() {
                      radio = T;
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: ScreenUtil.getInstance().setWidth(22),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset(
                      'static/images/Alipay.png',
                      width: ScreenUtil.getInstance().setWidth(70),
                    ),
                    SizedBox(
                      width: ScreenUtil.getInstance().setWidth(20),
                    ),
                    Text(
                      '支付宝',
                      style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(30),
                        color: Color.fromRGBO(80, 80, 80, 1),
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil.getInstance().setWidth(30),
                    ),
                    Text(
                      '支付订单，赢1999元红包',
                      style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(26),
                        color: Color.fromRGBO(80, 80, 80, 1),
                      ),
                    ),
                  ],
                ),
                Radio(
                  value: 'Alipay',
                  groupValue: radio,
                  activeColor: Color.fromRGBO(255, 112, 58, 1),
                  onChanged: (String T) {
                    setState(() {
                      radio = T;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBillWidget() {
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(20),
      ),
      color: Colors.white,
      padding: EdgeInsets.only(
        left: ScreenUtil.getInstance().setWidth(28),
      ),
      child: Column(
        children: <Widget>[
          _buildBillItemWidget('快速配送（免运费）', '不限送货时间', true),
          _buildBillItemWidget('电子发票', '', true),
          _buildBillItemWidget('优惠卷', '无可用', false),
        ],
      ),
    );
  }

  Widget _buildBillItemWidget(String title, String subtitle, bool border) {
    return Container(
      height: ScreenUtil.getInstance().setHeight(70),
      padding: EdgeInsets.only(
        right: ScreenUtil.getInstance().setWidth(16),
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: border ? Colors.black12 : Colors.white,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: Color.fromRGBO(51, 51, 51, 1),
              fontSize: ScreenUtil.getInstance().setSp(26),
            ),
          ),
          Row(
            children: <Widget>[
              Text(
                subtitle,
                style: TextStyle(
                  color: Color.fromRGBO(166, 166, 166, 1),
                  fontSize: ScreenUtil.getInstance().setSp(26),
                ),
              ),
              Icon(
                Icons.chevron_right,
                size: ScreenUtil.getInstance().setSp(46),
                color: Color.fromRGBO(153, 153, 153, 1),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildPurchaseGoodsWidget() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(20),
      ),
      child: Column(
        children: [1, 2, 3].map((item) {
          return Container(
            padding: EdgeInsets.only(
              left: ScreenUtil.getInstance().setWidth(28),
              right: ScreenUtil.getInstance().setWidth(28),
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: ScreenUtil.getInstance().setWidth(1),
                  color: item == 3 ? Colors.white : Colors.black12,
                ),
              ),
            ),
            height: ScreenUtil.getInstance().setHeight(118),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    GZCacheNetworkImageWidget(
                      width: ScreenUtil.getInstance().setWidth(74),
                      height: ScreenUtil.getInstance().setHeight(74),
                      imageUrl:
                          'http://cdn.cnbj1.fds.api.mi-img.com/mi-mall/477b561ea6b00e77e041ea73c881974e.jpg?thumb=1&w=360&h=360',
                    ),
                    SizedBox(
                      width: ScreenUtil.getInstance().setWidth(18),
                    ),
                    Text(
                      '米家扫地机器人',
                      style: TextStyle(
                        color: Color.fromRGBO(80, 80, 80, 1),
                        fontSize: ScreenUtil.getInstance().setSp(30),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'x1',
                      style: TextStyle(
                        color: Color.fromRGBO(80, 80, 80, 1),
                        fontSize: ScreenUtil.getInstance().setSp(30),
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil.getInstance().setWidth(60),
                    ),
                    Text(
                      '1599元',
                      style: TextStyle(
                        color: Color.fromRGBO(80, 80, 80, 1),
                        fontSize: ScreenUtil.getInstance().setSp(30),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildAddressWidget() {
    return Positioned(
      bottom: ScreenUtil.getInstance().setHeight(104),
      left: 0,
      child: Container(
        alignment: Alignment.centerLeft,
        width: MediaQuery.of(context).size.width,
        height: ScreenUtil.getInstance().setHeight(58),
        padding: EdgeInsets.only(
          left: ScreenUtil.getInstance().setWidth(15),
          right: ScreenUtil.getInstance().setWidth(15),
        ),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: ScreenUtil.getInstance().setWidth(1),
              color: Colors.black12,
            ),
            bottom: BorderSide(
              width: ScreenUtil.getInstance().setWidth(1),
              color: Colors.black12,
            ),
          ),
          color: Color.fromRGBO(255, 244, 208, 1),
        ),
        child: Text(
          '北京市 朝阳区 xiaopiu秘密研究基地 xiaopiu大楼',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Color.fromRGBO(169, 120, 50, 1),
            fontSize: ScreenUtil.getInstance().setSp(24),
          ),
        ),
      ),
    );
  }

  Widget _buildGoToPayWidget() {
    return Positioned(
      width: MediaQuery.of(context).size.width,
      left: 0,
      bottom: 0,
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil.getInstance().setWidth(450),
            height: ScreenUtil.getInstance().setHeight(104),
            alignment: Alignment.centerLeft,
            color: Colors.white,
            padding: EdgeInsets.only(
              left: ScreenUtil.getInstance().setWidth(28),
            ),
            child: Text(
              '应付金额：1693元',
              style: TextStyle(
                color: Color.fromRGBO(255, 112, 58, 1),
                fontSize: ScreenUtil.getInstance().setSp(28),
              ),
            ),
          ),
          Container(
            width: ScreenUtil.getInstance().setWidth(300),
            height: ScreenUtil.getInstance().setHeight(104),
            alignment: Alignment.center,
            color: Color.fromRGBO(255, 112, 58, 1),
            child: Text(
              '去付款',
              style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil.getInstance().setSp(30),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _navigatePop(BuildContext context) async {
    await Navigator.pop(context);
  }

  Widget _buildAppBarWidget(context) {
    return PreferredSize(
      child: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 1.0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            _navigatePop(context);
          },
          child: Icon(
            Icons.chevron_left,
            size: ScreenUtil.getInstance().setSp(46),
            color: Color.fromRGBO(128, 128, 128, 1),
          ),
        ),
        title: Text(
          '结算',
          style: TextStyle(
            fontSize: ScreenUtil.getInstance().setSp(36),
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(80, 80, 80, 1),
          ),
        ),
      ),
      preferredSize: Size.fromHeight(
        ScreenUtil.getInstance().setHeight(80),
      ),
    );
  }
}
