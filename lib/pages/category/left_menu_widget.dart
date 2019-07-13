import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/model/category_entity.dart';

class LeftMenuWidget extends StatefulWidget {
  final List<CategoryItem> categoryItem;

  LeftMenuWidget({Key key, this.categoryItem}) : super(key: key);

  @override
  _LeftMenuWidgetState createState() => _LeftMenuWidgetState();
}

class _LeftMenuWidgetState extends State<LeftMenuWidget> {
  String key = '新品';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: widget.categoryItem.map((item) {
          return _buildLeftMenuItemWidget(item);
        }).toList(),
      ),
    );
  }

  Widget _buildLeftMenuItemWidget(CategoryItem item) {
    return Container(
      alignment: Alignment.center,
      width: ScreenUtil.getInstance().setWidth(168),
      height: ScreenUtil.getInstance().setHeight(74),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            width: ScreenUtil.getInstance().setWidth(1),
            color: Color.fromRGBO(80, 80, 80, 0.1),
          ),
        ),
      ),
      child: Text(
        item.title,
        style: TextStyle(
          fontSize: ScreenUtil.getInstance().setSp(key == item.title ? 30 : 28),
          color: key == item.title ? Theme.of(context).primaryColor : Color.fromRGBO(80, 80, 80, 1),
        ),
      ),
    );
  }
}
