import 'package:flutter/material.dart';
import 'package:shop_app/pages/find/newspaper_item_widget.dart';
import 'package:shop_app/model/newspaper_entity.dart';

class NewspaperListWidget extends StatelessWidget {
  final List<NewspaperItem> newspaperItem;

  NewspaperListWidget({Key key, this.newspaperItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: newspaperItem.map((item) {
        return NewspaperItemWidget(newspaperItem: item);
      }).toList(),
    );
  }
}
