import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettlementPage extends StatefulWidget {
  @override
  _SettlementPageState createState() => _SettlementPageState();
}

class _SettlementPageState extends State<SettlementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBarWidget(context),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildDeliveryInfoWidget(),
            _buildPaymentMethodWidget(),
          ],
        ),
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
                  value: 1,
                  groupValue: 1,
                  activeColor: Color.fromRGBO(255, 112, 58, 1),
                  onChanged: (T) {},
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
                  value: 1,
                  groupValue: 0,
                  activeColor: Color.fromRGBO(255, 112, 58, 1),
                  onChanged: (T) {},
                ),
              ],
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
