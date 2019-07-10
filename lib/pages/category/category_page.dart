import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/components/topbar.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List _category = [];

  @override
  void initState() {
    super.initState();
    _category.add('新品');
    _category.add('手机');
    _category.add('电视');
    _category.add('电脑');
    _category.add('家电');
    _category.add('路由');
    _category.add('智能');
    _category.add('电源');
    _category.add('耳机');
    _category.add('音响');
    _category.add('礼品');
    _category.add('家电');
    _category.add('路由');
    _category.add('智能');
    _category.add('电源');
    _category.add('耳机');
    _category.add('音响');
    _category.add('礼品');
  }

  @override
  Widget build(BuildContext context) {
    Widget v = Column(
      children: <Widget>[_buildLeftMenu()],
    );
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GZTopBar(),
          Expanded(
            child: SingleChildScrollView(child: v),
          ),
        ],
      ),
    );
  }

  Widget _buildLeftMenu() {
    return Column(
      children: _category.map((item) {
        return Container(
          alignment: Alignment.center,
          width: ScreenUtil.getInstance().setWidth(168),
          height: ScreenUtil.getInstance().setHeight(74),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1.0,
                color: Color.fromRGBO(80, 80, 80, 0.1),
              ),
              right: BorderSide(
                width: 1.0,
                color: Color.fromRGBO(80, 80, 80, 0.1),
              ),
            ),
          ),
          child: Text(
            item,
            style: TextStyle(
              color: Color.fromRGBO(80, 80, 80, 1),
            ),
          ),
        );
      }).toList(),
    );
  }
}
