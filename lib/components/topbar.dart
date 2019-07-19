import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shop_app/style/style.dart';
import 'package:shop_app/components/search_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GZTopBar extends StatelessWidget {
  String color;

  GZTopBar({Key key, this.color}) : super(key: key);

  TextEditingController _keywordTextEditingController = TextEditingController();
  FocusNode _focus = new FocusNode();

  void _onFocusChange() {}

  @override
  Widget build(BuildContext context) {
    _focus.addListener(_onFocusChange);
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.only(
        top: statusBarHeight,
        left: 0,
        right: 0,
        bottom: 0,
      ),
      decoration: BoxDecoration(
        color: color == 'white' ? Colors.white : Theme.of(context).primaryColor,
        border: Border(
          bottom: BorderSide(
            width: color == 'white' ? 1 : 0,
            color: Color.fromRGBO(229, 229, 229, 1),
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          color == 'white'
              ? SizedBox(
                  width: ScreenUtil.getInstance().setWidth(28),
                )
              : _buildActionWidget(GZIcons.scan, '扫一扫'),
          Expanded(
            flex: 1,
            child: GZSearchCardWidget(
              isShowLeading: true,
              color: color == 'white'
                  ? Color.fromRGBO(229, 229, 229, 0.6)
                  : Colors.white,
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
          color == 'white'
              ? _buildMessageWidget()
              : _buildActionWidget(GZIcons.qr_code, '会员码'),
        ],
      ),
    );
  }

  Widget _buildMessageWidget() {
    return Row(
      children: <Widget>[
        Icon(
          GZIcons.message,
          size: ScreenUtil.getInstance().setSp(46),
          color: Color.fromRGBO(166, 166, 166, 1),
        ),
        SizedBox(
          width: ScreenUtil.getInstance().setWidth(28),
        ),
      ],
    );
  }

  Widget _buildActionWidget(icon, String title) {
    return Container(
      margin: EdgeInsets.only(
        right: ScreenUtil.getInstance().setWidth(12),
        left: ScreenUtil.getInstance().setWidth(8),
      ),
      height: ScreenUtil.getInstance().setHeight(60),
      width: ScreenUtil.getInstance().setWidth(60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
            size: ScreenUtil.getInstance().setSp(36),
          ),
          SizedBox(
            height: 2,
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: ScreenUtil.getInstance().setSp(14),
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
