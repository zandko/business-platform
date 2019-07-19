import 'package:flutter/material.dart';
import 'package:shop_app/pages/category/left_menu_widget.dart';
import 'package:shop_app/pages/category/menu_content_widget.dart';
import 'package:shop_app/data/category.dart';
import 'package:shop_app/model/category_entity.dart';
import 'package:shop_app/model/category_data_entity.dart';
import 'package:shop_app/model/entity_factory.dart';
import 'package:shop_app/components/topbar.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<CategoryItem> categoryItem;
  CategoryDataEntity categoryDataEntity;

  @override
  void initState() {
    super.initState();
    categoryItem = EntityFactory.generateOBJ<CategoryEntity>(category).items;
    categoryDataEntity =
        EntityFactory.generateOBJ<CategoryDataEntity>(categoryData);
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SingleChildScrollView(
                  child: LeftMenuWidget(categoryItem: categoryItem),
                ),
                SingleChildScrollView(
                  child:
                      MenuContentWidget(categoryDataEntity: categoryDataEntity),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
