import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllOrderPge extends StatefulWidget {
  @override
  _AllOrderPgeState createState() => _AllOrderPgeState();
}

class _AllOrderPgeState extends State<AllOrderPge> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBarWidget(context),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              constraints: BoxConstraints.expand(
                height: ScreenUtil.getInstance().setHeight(74),
              ),
              child: TabBar(
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
            ),
            Expanded(
              child: Container(
                child: TabBarView(
                  children: <Widget>[
                    Center(
                      child: Text('全部'),
                    ),
                    Center(
                      child: Text('代付款'),
                    ),
                    Center(
                      child: Text('待收货'),
                    ),
                    Center(
                      child: Text('待评价'),
                    )
                  ],
                ),
              ),
            ),
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
}
