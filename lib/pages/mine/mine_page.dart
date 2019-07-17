import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/components/cache_network_image.dart';

import 'package:shop_app/pages/mine/header_widget.dart';
import 'package:shop_app/pages/mine/information_widget.dart';
import 'package:shop_app/pages/mine/order_status_widget.dart';
import 'package:shop_app/pages/mine/my_option_list_widget.dart';
import 'package:shop_app/pages/mine/my_option_setting_widget.dart';

import 'package:shop_app/data/mine.dart';
import 'package:shop_app/model/order_menu_status_entity.dart';
import 'package:shop_app/model/optins_set_entity.dart';
import 'package:shop_app/model/entity_factory.dart';

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
            HeaderWidget(),
            InformationWidget(
                avatar: avatar, name: name, introduction: introduction),
            OrderStatusWidget(orderMenuStatusItem: orderMenuStatusItem),
            _buildAdvertisingWidget(
                'https://i1.mifile.cn/a4/xmad_15621639904412_QuMpy.jpg'),
            MyOptionListWidget(optinsSetItem: optinsSetItem),
            MyOptionSettingWidget(
                picUrl: optinsSetSettings.picUrl,
                title: optinsSetSettings.title),
          ],
        ),
      ),
    );
  }

  Widget _buildAdvertisingWidget(imageUrl) {
    return GZCacheNetworkImageWidget(
      height: ScreenUtil.getInstance().setHeight(208),
      imageUrl: imageUrl,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
