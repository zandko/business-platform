import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/components/cache_network_image.dart';

import 'package:shop_app/pages/find/menu_widget.dart';
import 'package:shop_app/pages/find/newspaper_widget.dart';

import 'package:shop_app/data/find.dart';
import 'package:shop_app/model/newspaper_entity.dart';
import 'package:shop_app/model/entity_factory.dart';
import 'package:shop_app/components/topbar.dart';
import 'package:shop_app/components/swipper.dart';

class FindPage extends StatefulWidget {
  @override
  _FindPageState createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  List<NewspaperItem> newspaperItem;

  @override
  void initState() {
    super.initState();

    newspaperItem =
        EntityFactory.generateOBJ<NewspaperEntity>(newspaper).newspaper;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          brightness: Brightness.light,
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        preferredSize: Size.fromHeight(0),
      ),
      body: Column(
        children: <Widget>[
          GZTopBar(color: 'white'),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SwipperWidget(
                    height: ScreenUtil.getInstance().setHeight(348),
                  ),
                  MenuWidget(),
                  _buildMiHomeWidget(),
                  _buildNewspaperWidget(),
                  NewspaperListWidget(newspaperItem: newspaperItem),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewspaperWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(16),
      ),
      padding: EdgeInsets.only(
        left: ScreenUtil.getInstance().setWidth(28),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(width: 1, color: Colors.black12),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      height: ScreenUtil.getInstance().setHeight(74),
      child: Text(
        '商城早报',
        style: TextStyle(
          fontSize: ScreenUtil.getInstance().setSp(28),
          color: Color.fromRGBO(80, 80, 80, 1),
        ),
      ),
    );
  }

  Widget _buildMiHomeWidget() {
    return Container(
      padding: EdgeInsets.all(
        ScreenUtil.getInstance().setWidth(28),
      ),
      width: MediaQuery.of(context).size.width,
      height: ScreenUtil.getInstance().setHeight(160),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.black12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GZCacheNetworkImageWidget(
            width: ScreenUtil.getInstance().setWidth(144),
            height: ScreenUtil.getInstance().setHeight(104),
            imageUrl:
                'https://img.alicdn.com/tfscom/i1/2610856926/TB2JAdPhwRkpuFjy1zeXXc.6FXa_!!2610856926.jpg_360x360xzq90.jpg_.webp',
          ),
          Container(
            width: ScreenUtil.getInstance().setWidth(374),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '小米之家北京朝阳合生汇店',
                  style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(28),
                    color: Color.fromRGBO(56, 56, 56, 1),
                  ),
                ),
                Text(
                  '距离1公里',
                  style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(26),
                    color: Color.fromRGBO(128, 128, 128, 1),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                '其他零售店',
                style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(24),
                  color: Color.fromRGBO(128, 128, 128, 1),
                ),
              ),
              Icon(
                Icons.chevron_right,
                size: ScreenUtil.getInstance().setWidth(25),
                color: Color.fromRGBO(153, 153, 153, 1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
