import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/components/cache_network_image.dart';

class ShoppingPage extends StatefulWidget {
  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  bool _checkboxSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          Row(
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
                Icons.message,
                size: ScreenUtil.getInstance().setSp(46),
                color: Color.fromRGBO(80, 80, 80, 1),
              ),
            ],
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _buildCartGoods(),
                _buildRecommendTitleWidget(),
                _buildRecommendGoodsWidget(),
              ],
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            left: 0,
            bottom: 0,
            child: _buildCartSettlementWidget(),
          ),
        ],
      ),
    );
  }

  Widget _buildCartGoods() {
    return Container(
      child: Column(
        children: [1, 2, 3].map((item) {
          return Container(
            margin: EdgeInsets.only(bottom: 10.0),
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: ScreenUtil.getInstance().setHeight(188),
            child: Row(
              children: <Widget>[
                Checkbox(
                  value: _checkboxSelected,
                  activeColor: Color.fromRGBO(255, 112, 58, 1),
                  onChanged: (value) {
                    setState(() {
                      _checkboxSelected = value;
                    });
                  },
                ),
                GZCacheNetworkImageWidget(
                  width: ScreenUtil.getInstance().setWidth(150),
                  height: ScreenUtil.getInstance().setHeight(150),
                  imageUrl:
                      'https://img.alicdn.com/tfscom/i1/2610856926/TB2JAdPhwRkpuFjy1zeXXc.6FXa_!!2610856926.jpg_360x360xzq90.jpg_.webp',
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: ScreenUtil.getInstance().setWidth(18),
                  ),
                  width: ScreenUtil.getInstance().setWidth(340),
                  height: ScreenUtil.getInstance().setHeight(150),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '米家扫地机器人',
                        style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(28),
                          color: Color.fromRGBO(80, 80, 80, 1),
                        ),
                      ),
                      Text(
                        '白色',
                        style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(26),
                          color: Color.fromRGBO(166, 166, 166, 1),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            '￥1599',
                            style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(32),
                              color: Color.fromRGBO(255, 112, 58, 1),
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '￥1699',
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
                ),
                Container(
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
                          '1',
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
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildRecommendTitleWidget() {
    return Container(
      height: ScreenUtil.getInstance().setHeight(122),
      child: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil.getInstance().setHeight(76),
            child: Text(
              '为你推荐',
              style: TextStyle(
                fontSize: ScreenUtil.getInstance().setSp(36),
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(255, 112, 58, 1),
              ),
            ),
          ),
          Container(
            height: ScreenUtil.getInstance().setHeight(46),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: ScreenUtil.getInstance().setWidth(212),
                  height: ScreenUtil.getInstance().setHeight(2),
                  color: Color.fromRGBO(205, 205, 205, 1),
                ),
                Text(
                  '买了以上产品的人还买了',
                  style:
                      TextStyle(fontSize: ScreenUtil.getInstance().setSp(26)),
                ),
                Container(
                  width: ScreenUtil.getInstance().setWidth(212),
                  height: ScreenUtil.getInstance().setHeight(2),
                  color: Color.fromRGBO(205, 205, 205, 1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendGoodsWidget() {
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(32),
        bottom: ScreenUtil.getInstance().setHeight(124),
      ),
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        spacing: ScreenUtil.getInstance().setWidth(18),
        runSpacing: ScreenUtil.getInstance().setHeight(26),
        children: [1, 2, 3, 4, 5].map((item) {
          return Container(
            width: ScreenUtil.getInstance().setWidth(366),
            height: ScreenUtil.getInstance().setHeight(526),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    GZCacheNetworkImageWidget(
                      width: ScreenUtil.getInstance().setWidth(366),
                      height: ScreenUtil.getInstance().setHeight(366),
                      imageUrl:
                          'https://img.alicdn.com/tfscom/i1/2610856926/TB2JAdPhwRkpuFjy1zeXXc.6FXa_!!2610856926.jpg_360x360xzq90.jpg_.webp',
                    ),
                    Positioned(
                      right: 8.0,
                      bottom: 8.0,
                      child: Text(
                        '5324人好评',
                        style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(28),
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: ScreenUtil.getInstance().setWidth(366),
                  padding: EdgeInsets.only(
                    top: ScreenUtil.getInstance().setHeight(7),
                    left: ScreenUtil.getInstance().setWidth(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '红米Note 5A 标准版',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(32),
                          color: Color.fromRGBO(80, 80, 80, 1),
                        ),
                      ),
                      Text(
                        '5.5"超值高清大屏',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(26),
                          color: Color.fromRGBO(80, 80, 80, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: ScreenUtil.getInstance().setHeight(10),
                    left: ScreenUtil.getInstance().setWidth(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '￥699',
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
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCartSettlementWidget() {
    return Container(
      color: Colors.white,
      height: ScreenUtil.getInstance().setHeight(104),
      child: Row(
        children: <Widget>[
          Checkbox(
              value: true,
              activeColor: Theme.of(context).primaryColor,
              onChanged: (bool) {}),
          Text(
            '全选',
            style: TextStyle(
              fontSize: ScreenUtil.getInstance().setSp(32),
              color: Color.fromRGBO(80, 80, 80, 1),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  '合计:',
                  style: TextStyle(
                    color: Color.fromRGBO(80, 80, 80, 1),
                    fontSize: ScreenUtil.getInstance().setSp(32),
                  ),
                ),
                SizedBox(
                  width: 2.0,
                ),
                Text(
                  '￥999',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil.getInstance().setSp(32),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    left: ScreenUtil.getInstance().setWidth(20),
                  ),
                  child: new Text(
                    '结算(3)',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil.getInstance().setSp(32),
                    ),
                  ),
                  width: ScreenUtil.getInstance().setWidth(206),
                  height: ScreenUtil.getInstance().setHeight(104),
                  color: Theme.of(context).primaryColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
