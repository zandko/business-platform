import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/components/cache_network_image.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          brightness: Brightness.dark,
          elevation: 0,
        ),
        preferredSize: Size.fromHeight(0),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildHeaderWidget(),
            _buildInformationWidget(),
            _buildOrderWidget(),
            _buildAdvertisingWidget(
                'https://i1.mifile.cn/a4/xmad_15621639904412_QuMpy.jpg'),
            _buildPropertyWidget(),
            _buildServiceWidget(),
            _buildSettingWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderWidget() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: ScreenUtil.getInstance().setHeight(90),
      padding: EdgeInsets.only(
        right: ScreenUtil.getInstance().setWidth(28),
      ),
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(
            Icons.message,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildInformationWidget() {
    return Container(
      padding: EdgeInsets.only(
        left: ScreenUtil.getInstance().setWidth(28),
      ),
      width: MediaQuery.of(context).size.width,
      height: ScreenUtil.getInstance().setHeight(168),
      color: Theme.of(context).primaryColor,
      child: Stack(
        children: <Widget>[
          Positioned(
            width: ScreenUtil.getInstance().setWidth(112),
            height: ScreenUtil.getInstance().setHeight(112),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                ScreenUtil.getInstance().setWidth(56),
              ),
              child: GZCacheNetworkImageWidget(
                imageUrl:
                    'https://img.alicdn.com/tfscom/i1/2610856926/TB2JAdPhwRkpuFjy1zeXXc.6FXa_!!2610856926.jpg_360x360xzq90.jpg_.webp',
              ),
            ),
          ),
          Positioned(
            top: ScreenUtil.getInstance().setHeight(10),
            left: ScreenUtil.getInstance().setWidth(126),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '大淼淼',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil.getInstance().setSp(32),
                  ),
                ),
                Text(
                  '6666666',
                  style: TextStyle(
                    color: Colors.white30,
                    fontSize: ScreenUtil.getInstance().setSp(28),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0.0,
            bottom: ScreenUtil.getInstance().setHeight(54),
            child: Container(
              alignment: Alignment.center,
              width: ScreenUtil.getInstance().setWidth(164),
              height: ScreenUtil.getInstance().setHeight(62),
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 190, 0, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    ScreenUtil.getInstance().setWidth(32),
                  ),
                  bottomLeft: Radius.circular(
                    ScreenUtil.getInstance().setWidth(32),
                  ),
                ),
              ),
              child: Text(
                '积分兑换',
                style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(26),
                  color: Color.fromRGBO(126, 77, 29, 1),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildOrderWidget() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: ScreenUtil.getInstance().setHeight(234),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
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
                Text(
                  '全部订单',
                  style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(26),
                    color: Color.fromRGBO(166, 166, 166, 1),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: ScreenUtil.getInstance().setHeight(20),
            ),
            height: ScreenUtil.getInstance().setHeight(150),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Icon(
                      Icons.payment,
                      color: Color.fromRGBO(110, 110, 110, 1),
                      size: ScreenUtil.getInstance().setSp(56),
                    ),
                    Text(
                      '已付款',
                      style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(26),
                        color: Color.fromRGBO(110, 110, 110, 1),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(
                      Icons.receipt,
                      color: Color.fromRGBO(110, 110, 110, 1),
                      size: ScreenUtil.getInstance().setSp(56),
                    ),
                    Text(
                      '待收货',
                      style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(26),
                        color: Color.fromRGBO(110, 110, 110, 1),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(
                      Icons.folder_open,
                      color: Color.fromRGBO(110, 110, 110, 1),
                      size: ScreenUtil.getInstance().setSp(56),
                    ),
                    Text(
                      '待付款',
                      style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(26),
                        color: Color.fromRGBO(110, 110, 110, 1),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(
                      Icons.repeat,
                      color: Color.fromRGBO(110, 110, 110, 1),
                      size: ScreenUtil.getInstance().setSp(56),
                    ),
                    Text(
                      '退换修',
                      style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(26),
                        color: Color.fromRGBO(110, 110, 110, 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdvertisingWidget(imageUrl) {
    return GZCacheNetworkImageWidget(
      height: ScreenUtil.getInstance().setHeight(208),
      imageUrl: imageUrl,
    );
  }

  Widget _buildPropertyWidget() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        left: ScreenUtil.getInstance().setWidth(30),
      ),
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(16),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              GZCacheNetworkImageWidget(
                width: ScreenUtil.getInstance().setWidth(56),
                height: ScreenUtil.getInstance().setHeight(56),
                imageUrl:
                    'https://img.alicdn.com/tfscom/i1/2610856926/TB2JAdPhwRkpuFjy1zeXXc.6FXa_!!2610856926.jpg_360x360xzq90.jpg_.webp',
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(left: 3.0),
                  height: ScreenUtil.getInstance().setHeight(94),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: ScreenUtil.getInstance().setWidth(2),
                        color: Colors.black12,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '优惠卷',
                        style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(30),
                          color: Color.fromRGBO(56, 56, 56, 1),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: ScreenUtil.getInstance().setSp(35),
                        color: Color.fromRGBO(153, 153, 153, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              GZCacheNetworkImageWidget(
                width: ScreenUtil.getInstance().setWidth(56),
                height: ScreenUtil.getInstance().setHeight(56),
                imageUrl:
                    'https://img.alicdn.com/tfscom/i1/2610856926/TB2JAdPhwRkpuFjy1zeXXc.6FXa_!!2610856926.jpg_360x360xzq90.jpg_.webp',
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(left: 3.0),
                  height: ScreenUtil.getInstance().setHeight(94),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: ScreenUtil.getInstance().setWidth(2),
                        color: Colors.black12,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '会员福利',
                        style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(30),
                          color: Color.fromRGBO(56, 56, 56, 1),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: ScreenUtil.getInstance().setSp(35),
                        color: Color.fromRGBO(153, 153, 153, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              GZCacheNetworkImageWidget(
                width: ScreenUtil.getInstance().setWidth(56),
                height: ScreenUtil.getInstance().setHeight(56),
                imageUrl:
                    'https://img.alicdn.com/tfscom/i1/2610856926/TB2JAdPhwRkpuFjy1zeXXc.6FXa_!!2610856926.jpg_360x360xzq90.jpg_.webp',
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(left: 3.0),
                  height: ScreenUtil.getInstance().setHeight(94),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '我的钱包',
                        style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(30),
                          color: Color.fromRGBO(56, 56, 56, 1),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: ScreenUtil.getInstance().setSp(35),
                        color: Color.fromRGBO(153, 153, 153, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServiceWidget() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        left: ScreenUtil.getInstance().setWidth(30),
      ),
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(16),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              GZCacheNetworkImageWidget(
                width: ScreenUtil.getInstance().setWidth(56),
                height: ScreenUtil.getInstance().setHeight(56),
                imageUrl:
                    'https://img.alicdn.com/tfscom/i1/2610856926/TB2JAdPhwRkpuFjy1zeXXc.6FXa_!!2610856926.jpg_360x360xzq90.jpg_.webp',
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(left: 3.0),
                  height: ScreenUtil.getInstance().setHeight(94),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: ScreenUtil.getInstance().setWidth(2),
                        color: Colors.black12,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '服务中心',
                        style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(30),
                          color: Color.fromRGBO(56, 56, 56, 1),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: ScreenUtil.getInstance().setSp(35),
                        color: Color.fromRGBO(153, 153, 153, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              GZCacheNetworkImageWidget(
                width: ScreenUtil.getInstance().setWidth(56),
                height: ScreenUtil.getInstance().setHeight(56),
                imageUrl:
                    'https://img.alicdn.com/tfscom/i1/2610856926/TB2JAdPhwRkpuFjy1zeXXc.6FXa_!!2610856926.jpg_360x360xzq90.jpg_.webp',
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(left: 3.0),
                  height: ScreenUtil.getInstance().setHeight(94),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: ScreenUtil.getInstance().setWidth(2),
                        color: Colors.black12,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '小米之家',
                        style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(30),
                          color: Color.fromRGBO(56, 56, 56, 1),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: ScreenUtil.getInstance().setSp(35),
                        color: Color.fromRGBO(153, 153, 153, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              GZCacheNetworkImageWidget(
                width: ScreenUtil.getInstance().setWidth(56),
                height: ScreenUtil.getInstance().setHeight(56),
                imageUrl:
                    'https://img.alicdn.com/tfscom/i1/2610856926/TB2JAdPhwRkpuFjy1zeXXc.6FXa_!!2610856926.jpg_360x360xzq90.jpg_.webp',
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(left: 3.0),
                  height: ScreenUtil.getInstance().setHeight(94),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '更多功能',
                        style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(30),
                          color: Color.fromRGBO(56, 56, 56, 1),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: ScreenUtil.getInstance().setSp(35),
                        color: Color.fromRGBO(153, 153, 153, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingWidget() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        left: ScreenUtil.getInstance().setWidth(30),
      ),
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(16),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              GZCacheNetworkImageWidget(
                width: ScreenUtil.getInstance().setWidth(56),
                height: ScreenUtil.getInstance().setHeight(56),
                imageUrl:
                    'https://img.alicdn.com/tfscom/i1/2610856926/TB2JAdPhwRkpuFjy1zeXXc.6FXa_!!2610856926.jpg_360x360xzq90.jpg_.webp',
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(left: 3.0),
                  height: ScreenUtil.getInstance().setHeight(94),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '设置',
                        style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(30),
                          color: Color.fromRGBO(56, 56, 56, 1),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: ScreenUtil.getInstance().setSp(35),
                        color: Color.fromRGBO(153, 153, 153, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
