import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop_app/data/home.dart';
import 'package:shop_app/style/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GZSearchCardWidget extends StatefulWidget {
  final FocusNode focusNode;
  final color;
  TextEditingController textEditingController;
  final VoidCallback onTap;
  final bool isShowLeading;
  final String hintText;
  final ValueChanged<String> onSubmitted;
  final ValueChanged<String> onChanged;
  final bool autofocus;
  final bool isShowSuffixIcon;
  final double elevation;
  final Widget rightWidget;

  GZSearchCardWidget({
    Key key,
    this.focusNode,
    this.color,
    this.textEditingController,
    this.onTap,
    this.isShowLeading = true,
    this.onSubmitted,
    this.onChanged,
    this.autofocus = false,
    this.isShowSuffixIcon = true,
    this.hintText,
    this.elevation = 2.0,
    this.rightWidget,
  }) : super(key: key);

  @override
  _GZSearchCardWidgetState createState() => _GZSearchCardWidgetState();
}

class _GZSearchCardWidgetState extends State<GZSearchCardWidget> {
  String _hintText;
  Widget _rightWidget;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _rightWidget = widget.rightWidget;
    _rightWidget ??= Icon(
      GZIcons.camera,
      color: Colors.grey,
      size: ScreenUtil.getInstance().setSp(40),
    );
    _hintText = widget.hintText;
    _hintText ??= searchHintTexts[Random().nextInt(searchHintTexts.length)];
    if (widget.textEditingController == null) {
      widget.textEditingController = TextEditingController();
    }
    return searchCard();
  }

  Widget searchCard() => Padding(
        padding: const EdgeInsets.only(top: 0, right: 0),
        child: Card(
          color: widget.color,
          elevation: widget.elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                ScreenUtil.getInstance().setWidth(40),
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                widget.isShowLeading
                    ? Padding(
                        padding: EdgeInsets.only(
                          right: ScreenUtil.getInstance().setWidth(10),
                          top: 0,
                          left: ScreenUtil.getInstance().setWidth(10),
                        ),
                        child: Icon(
                          GZIcons.search_light,
                          color: Colors.grey,
                          size: ScreenUtil.getInstance().setSp(40),
                        ),
                      )
                    : SizedBox(
                        width: ScreenUtil.getInstance().setWidth(20),
                      ),
                Expanded(
                  child: Container(
                    height: ScreenUtil.getInstance().setHeight(64),
                    child: TextField(
                      autofocus: widget.autofocus,
                      onTap: widget.onTap,
                      focusNode: widget.focusNode,
                      style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(26),
                      ),
                      controller: widget.textEditingController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          top: ScreenUtil.getInstance().setHeight(12),
                        ),
                        border: InputBorder.none,
                        hintText: _hintText,
                        suffixIcon: widget.textEditingController.text.length ==
                                    0 ||
                                !widget.isShowSuffixIcon
                            ? SizedBox()
                            : Container(
                                width: ScreenUtil.getInstance().setWidth(40),
                                height: ScreenUtil.getInstance().setHeight(40),
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.only(
                                    right:
                                        ScreenUtil.getInstance().setWidth(12),
                                  ),
                                  iconSize: ScreenUtil.getInstance().setSp(36),
                                  icon: Icon(
                                    Icons.cancel,
                                    color: Colors.grey[500],
                                    size: ScreenUtil.getInstance().setSp(32),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      widget.textEditingController.text = '';
                                      widget.onChanged('');
                                    });
                                  },
                                ),
                              ),
                      ),
                      onSubmitted: widget.onSubmitted,
                      onChanged: widget.onChanged,
                    ),
                  ),
                ),
                widget.textEditingController.text.length == 0 ||
                        !widget.isShowSuffixIcon
                    ? Padding(
                        padding: EdgeInsets.only(
                          right: ScreenUtil.getInstance().setWidth(10),
                        ),
                        child: _rightWidget)
                    : SizedBox(),
              ],
            ),
          ),
        ),
      );
}
