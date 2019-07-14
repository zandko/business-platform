import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/components/search_card.dart';
import 'package:shop_app/style/style.dart';

import 'package:shop_app/pages/find/swiper_image_widget.dart';
import 'package:shop_app/pages/find/menu_widget.dart';
import 'package:shop_app/pages/find/mi_home_widget.dart';
import 'package:shop_app/pages/find/newspaper_list_widget.dart';

import 'package:shop_app/data/find.dart';
import 'package:shop_app/model/newspaper_entity.dart';
import 'package:shop_app/model/entity_factory.dart';

class FindPage extends StatefulWidget {
  @override
  _FindPageState createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  TextEditingController _keywordTextEditingController = TextEditingController();
  FocusNode _focus = new FocusNode();

  List<NewspaperItem> newspaperItem;

  @override
  void initState() {
    super.initState();

    newspaperItem = EntityFactory.generateOBJ<NewspaperEntity>(newspaper).newspaper;
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
          Container(
            padding: EdgeInsets.only(
              left: ScreenUtil.getInstance().setWidth(28),
              right: ScreenUtil.getInstance().setWidth(28),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Color.fromRGBO(229, 229, 229, 1),
                ),
              ),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: GZSearchCardWidget(
                    isShowLeading: true,
                    elevation: 0,
                    color: Color.fromRGBO(229, 229, 229, 0.6),
                    onTap: () {
                      FocusScope.of(context).requestFocus(
                        FocusNode(),
                      );
                    },
                    textEditingController: _keywordTextEditingController,
                    focusNode: _focus,
                  ),
                ),
                Icon(
                  GZIcons.message,
                  size: ScreenUtil.getInstance().setSp(46),
                  color: Color.fromRGBO(166, 166, 166, 1),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SwiperImageWidget(),
                  MenuWidget(),
                  MiHomeWidget(),
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
}
