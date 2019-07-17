import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/components/cache_network_image.dart';

class AllOrderPge extends StatefulWidget {
  @override
  _AllOrderPgeState createState() => _AllOrderPgeState();
}

class _AllOrderPgeState extends State<AllOrderPge> with TickerProviderStateMixin {
  List<Tab> tab = <Tab>[
    Tab(
      text: '全部',
    ),
    Tab(
      text: '代付款',
    ),
    Tab(
      text: '待收货',
    ),
    Tab(
      text: '待评价',
    )
  ];
  TabController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 4);
    _controller.addListener(_handleTabSelection);
  }

  _handleTabSelection() {
    print('_handleTabSelection:${_controller.index}');
    setState(() {
      _currentIndex = _controller.index;
      print(_currentIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBarWidget(context),
      body: DefaultTabController(
        length: tab.length,
        child: Column(
          children: <Widget>[
            _buildTabBarWidget(),
            _buildBodyContextWidget(),
          ],
        ),
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
          '商品订单',
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
                child: Icon(
                  Icons.search,
                  size: ScreenUtil.getInstance().setSp(46),
                  color: Color.fromRGBO(128, 128, 128, 1),
                ),
              ),
              Icon(
                Icons.shopping_cart,
                size: ScreenUtil.getInstance().setSp(46),
                color: Color.fromRGBO(128, 128, 128, 1),
              ),
              SizedBox(
                width: ScreenUtil.getInstance().setWidth(26),
              ),
            ],
          ),
        ],
      ),
      preferredSize: Size.fromHeight(
        ScreenUtil.getInstance().setHeight(80),
      ),
    );
  }

  Widget _buildTabBarWidget() {
    return Container(
      color: Colors.white,
      constraints: BoxConstraints.expand(
        height: ScreenUtil.getInstance().setHeight(74),
      ),
      child: TabBar(
        controller: _controller,
        indicatorColor: Color.fromRGBO(255, 141, 25, 1),
        labelColor: Color.fromRGBO(255, 141, 25, 1),
        unselectedLabelColor: Color.fromRGBO(80, 80, 80, 1),
        labelStyle: TextStyle(
          fontSize: ScreenUtil.getInstance().setSp(32),
        ),
        tabs: tab.map((item) {
          return item;
        }).toList(),
      ),
    );
  }

  Widget _buildBodyContextWidget() {
    return Expanded(
      child: Container(
        child: TabBarView(
          controller: _controller,
          children: [1, 2, 3, 4].map((item) {
            return _buildOrderInfoWidget();
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildOrderInfoWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [1, 2, 3, 4].map((item) {
          return Container(
            color: Colors.white,
            margin: EdgeInsets.only(
              top: ScreenUtil.getInstance().setHeight(20),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      _buildDateAndStatusWidget(),
                      Column(
                        children: [1, 2, 3].map((item) {
                          return _buildGoodsInfoWidget();
                        }).toList(),
                      ),
                      _buildOrderStatusWidget(),
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

  Widget _buildDateAndStatusWidget() {
    return Container(
      height: ScreenUtil.getInstance().setHeight(66),
      padding: EdgeInsets.only(
        left: ScreenUtil.getInstance().setWidth(28),
        right: ScreenUtil.getInstance().setWidth(28),
      ),
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
            '2017-12-21 09:36',
            style: TextStyle(
              color: Color.fromRGBO(128, 128, 128, 1),
              fontSize: ScreenUtil.getInstance().setSp(26),
            ),
          ),
          Text(
            '已出库',
            style: TextStyle(
              color: Color.fromRGBO(128, 128, 128, 1),
              fontSize: ScreenUtil.getInstance().setSp(26),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGoodsInfoWidget() {
    return Padding(
      padding: EdgeInsets.only(
        left: ScreenUtil.getInstance().setWidth(44),
        right: ScreenUtil.getInstance().setWidth(28),
      ),
      child: Container(
        height: ScreenUtil.getInstance().setHeight(140),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: ScreenUtil.getInstance().setWidth(1),
              color: Colors.black12,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(
                  width: ScreenUtil.getInstance().setHeight(8),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    ScreenUtil.getInstance().setWidth(4),
                  ),
                  child: GZCacheNetworkImageWidget(
                    imageUrl:
                        'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=400062461,2874561526&fm=27&gp=0.jpg',
                    width: ScreenUtil.getInstance().setWidth(94),
                    height: ScreenUtil.getInstance().setHeight(94),
                  ),
                ),
                SizedBox(
                  width: ScreenUtil.getInstance().setWidth(32),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(18),
                    ),
                    Text(
                      '米家扫地机器人',
                      style: TextStyle(
                        color: Color.fromRGBO(80, 80, 80, 1),
                        fontSize: ScreenUtil.getInstance().setSp(28),
                      ),
                    ),
                    Text(
                      '白色',
                      style: TextStyle(
                        color: Color.fromRGBO(166, 166, 166, 1),
                        fontSize: ScreenUtil.getInstance().setSp(26),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(18),
                ),
                Text(
                  '￥1599',
                  style: TextStyle(
                    color: Color.fromRGBO(80, 80, 80, 1),
                    fontSize: ScreenUtil.getInstance().setSp(32),
                  ),
                ),
                Text(
                  'x1',
                  style: TextStyle(
                    color: Color.fromRGBO(166, 166, 166, 1),
                    fontSize: ScreenUtil.getInstance().setSp(26),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderStatusWidget() {
    return Container(
      padding: EdgeInsets.only(
        right: ScreenUtil.getInstance().setWidth(28),
      ),
      height: ScreenUtil.getInstance().setHeight(176),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: ScreenUtil.getInstance().setWidth(2),
            color: Colors.black12,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                '共3件商品',
                style: TextStyle(
                  color: Color.fromRGBO(56, 56, 56, 1),
                  fontSize: ScreenUtil.getInstance().setSp(26),
                ),
              ),
              SizedBox(
                width: ScreenUtil.getInstance().setWidth(20),
              ),
              Text(
                '实付金额：',
                style: TextStyle(
                  color: Color.fromRGBO(56, 56, 56, 1),
                  fontSize: ScreenUtil.getInstance().setSp(26),
                ),
              ),
              Text(
                '￥1693',
                style: TextStyle(
                  color: Color.fromRGBO(56, 56, 56, 1),
                  fontSize: ScreenUtil.getInstance().setSp(32),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            height: ScreenUtil.getInstance().setHeight(66),
            width: ScreenUtil.getInstance().setWidth(178),
            decoration: BoxDecoration(
              border: Border.all(
                width: ScreenUtil.getInstance().setWidth(1),
                color: Color.fromRGBO(128, 128, 128, 1),
              ),
            ),
            child: Text(
              '查看物流',
              style: TextStyle(
                color: Color.fromRGBO(128, 128, 128, 1),
                fontSize: ScreenUtil.getInstance().setSp(26),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
