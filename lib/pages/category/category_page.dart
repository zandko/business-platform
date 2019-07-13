import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/components/search_card.dart';
import 'package:shop_app/style/style.dart';
import 'package:shop_app/pages/category/left_menu_widget.dart';
import 'package:shop_app/pages/category/menu_content_widget.dart';
import 'package:shop_app/data/category.dart';
import 'package:shop_app/model/category_entity.dart';
import 'package:shop_app/model/category_data_entity.dart';
import 'package:shop_app/model/entity_factory.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  TextEditingController _keywordTextEditingController = TextEditingController();
  FocusNode _focus = new FocusNode();
  List<CategoryItem> categoryItem;
  CategoryDataEntity categoryDataEntity;

  @override
  void initState() {
    super.initState();
    categoryItem = EntityFactory.generateOBJ<CategoryEntity>(category).items;
    categoryDataEntity = EntityFactory.generateOBJ<CategoryDataEntity>(categoryData);
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SingleChildScrollView(
                  child: LeftMenuWidget(categoryItem: categoryItem),
                ),
                SingleChildScrollView(
                  child: MenuContentWidget(
                      categoryDataEntity: categoryDataEntity),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
