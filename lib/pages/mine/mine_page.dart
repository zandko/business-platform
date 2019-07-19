import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/style/style.dart';

import 'package:shop_app/pages/mine/information_widget.dart';
import 'package:shop_app/pages/mine/order_status_widget.dart';
import 'package:shop_app/pages/mine/my_option_list_widget.dart';
import 'package:shop_app/pages/mine/my_option_setting_widget.dart';

import 'package:shop_app/data/mine.dart';
import 'package:shop_app/model/order_menu_status_entity.dart';
import 'package:shop_app/model/optins_set_entity.dart';
import 'package:shop_app/model/entity_factory.dart';

import 'package:shop_app/components/notification.dart';
import 'package:shop_app/components/swipper.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage>
    with AutomaticKeepAliveClientMixin<MinePage> {
  String avatar;
  String name;
  String introduction;
  List<OrderMenuStatusItem> orderMenuStatusItem;
  List<OptinsSetItem> optinsSetItem;
  OptinsSetSettings optinsSetSettings;

  @override
  void initState() {
    super.initState();
    avatar =
        'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3024387196,1621670548&fm=27&gp=0.jpg';
    name = '我的小淼酱';
    introduction = '祝你面试顺利！';
    orderMenuStatusItem =
        EntityFactory.generateOBJ<OrderMenuStatusEntity>(orderMenuStatus)
            .menustatus;
    optinsSetItem = EntityFactory.generateOBJ<OptinsSetEntity>(optionSet).items;
    optinsSetSettings =
        EntityFactory.generateOBJ<OptinsSetEntity>(optionSet).settings;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildHeaderWidget(),
            InformationWidget(
                avatar: avatar, name: name, introduction: introduction),
            OrderStatusWidget(orderMenuStatusItem: orderMenuStatusItem),
            SwipperWidget(
              height: ScreenUtil.getInstance().setHeight(208),
            ),
            MyOptionListWidget(optinsSetItem: optinsSetItem),
            MyOptionSettingWidget(
                picUrl: optinsSetSettings.picUrl,
                title: optinsSetSettings.title),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderWidget() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: ScreenUtil.getInstance().setHeight(110),
      padding: EdgeInsets.only(
        right: ScreenUtil.getInstance().setWidth(28),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        image: DecorationImage(
            image: AssetImage('static/images/mybg.png'), fit: BoxFit.fill),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationPage(),
                ),
              );
            },
            child: Icon(
              GZIcons.message,
              size: ScreenUtil.getInstance().setSp(46),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
