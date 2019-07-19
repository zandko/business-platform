import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBarWidget(context),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: ScreenUtil.getInstance().setHeight(26),
          bottom: ScreenUtil.getInstance().setHeight(26),
        ),
        child: Column(
          children: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((item) {
            return Container(
              padding: EdgeInsets.all(
                ScreenUtil.getInstance().setWidth(15),
              ),
              margin: EdgeInsets.only(
                bottom: ScreenUtil.getInstance().setHeight(20),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
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
              ),
              width: MediaQuery.of(context).size.width,
              height: ScreenUtil.getInstance().setHeight(168),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '您的小米商品已出库',
                    style: TextStyle(
                      color: Color.fromRGBO(56, 56, 56, 1),
                      fontSize: ScreenUtil.getInstance().setSp(28),
                    ),
                  ),
                  Text(
                    '您的订单已出库，预计12/21送达（中通5210293232190',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color.fromRGBO(166, 166, 166, 1),
                      fontSize: ScreenUtil.getInstance().setSp(26),
                    ),
                  ),
                  Text(
                    '12月20日',
                    style: TextStyle(
                      color: Color.fromRGBO(166, 166, 166, 1),
                      fontSize: ScreenUtil.getInstance().setSp(26),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
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
          '消息通知',
          style: TextStyle(
            fontSize: ScreenUtil.getInstance().setSp(38),
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
