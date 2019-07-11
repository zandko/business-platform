import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shop_app/style/style.dart';
import 'package:shop_app/components/search_card.dart';

class GZTopBar extends StatelessWidget {
  TextEditingController _keywordTextEditingController = TextEditingController();

  GZTopBar({Key key}) : super(key: key);

  FocusNode _focus = new FocusNode();

  void _onFocusChange() {}

  @override
  Widget build(BuildContext context) {
    _focus.addListener(_onFocusChange);
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.only(
        top: statusBarHeight,
        left: 0,
        right: 0,
        bottom: 0,
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 6.0, left: 4),
            height: 30,
            width: 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  GZIcons.scan,
                  color: Colors.white,
                  size: 18,
                ),
                SizedBox(
                  height: 2,
                ),
                Expanded(
                  child: Text(
                    '扫一扫',
                    style: TextStyle(
                      fontSize: 8,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: GZSearchCardWidget(
              isShowLeading: true,
              elevation: 0,
              onTap: () {
                FocusScope.of(context).requestFocus(
                  FocusNode(),
                );
              },
              textEditingController: _keywordTextEditingController,
              focusNode: _focus,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 6.0, right: 4),
//            color: Colors.red,
            width: 30,
            height: 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  GZIcons.qr_code,
                  color: Colors.white,
                  size: 18,
                ),
                SizedBox(
                  height: 2,
                ),
                Expanded(
                  child: Text(
                    '会员码',
                    style: TextStyle(
                      fontSize: 8,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
