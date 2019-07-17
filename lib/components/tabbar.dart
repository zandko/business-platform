import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/model/tab.dart';

class GZTabBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final List<TabModel> tabModels;
  final TabController tabController;
  final int currentIndex;

  const GZTabBarWidget(
      {Key key, this.tabModels, this.tabController, this.currentIndex})
      : super(key: key);

  @override
  _GZTabBarWidgetState createState() => _GZTabBarWidgetState();

  @override
  Size get preferredSize =>
      Size.fromHeight(ScreenUtil.getInstance().setHeight(60));
}

class _GZTabBarWidgetState extends State<GZTabBarWidget> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TabBar(
        controller: widget.tabController,
        indicatorColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.label,
        isScrollable: true,
        labelColor: Color(0xFFfe5100),
        unselectedLabelColor: Colors.black,
        labelPadding: EdgeInsets.only(
          right: ScreenUtil.getInstance().setWidth(10),
          left: ScreenUtil.getInstance().setWidth(10),
        ),
        onTap: (i) {
          _selectedIndex = i;
          setState(() {});
        },
        tabs: widget.tabModels
            .map(
              (i) => Container(
                    height: ScreenUtil.getInstance().setHeight(88),
                    child: Tab(
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              SizedBox(
                                height: ScreenUtil.getInstance().setHeight(6),
                              ),
                              Text(
                                i.title,
                                style: TextStyle(
                                  fontSize: ScreenUtil.getInstance().setSp(28),
                                ),
                              ),
                              SizedBox(
                                height: ScreenUtil.getInstance().setHeight(6),
                              ),
                              widget.tabModels.indexOf(i) == widget.currentIndex
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        ScreenUtil.getInstance().setWidth(14),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(
                                          ScreenUtil.getInstance().setWidth(1),
                                        ),
                                        color: Color(0xFFfe5100),
                                        child: Text(
                                          i.subtitle,
                                          style: TextStyle(
                                            fontSize: ScreenUtil.getInstance()
                                                .setSp(18),
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Expanded(
                                      child: Text(
                                        i.subtitle,
                                        style: TextStyle(
                                          fontSize: ScreenUtil.getInstance()
                                              .setSp(18),
                                          color: Color(0xFFb5b6b5),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                          SizedBox(
                            width: ScreenUtil.getInstance().setWidth(20),
                          ),
                          Container(
                            width: ScreenUtil.getInstance().setWidth(1),
                            height: ScreenUtil.getInstance().setHeight(50),
                            color: Color(0xFFc9c9ca),
                          ),
                        ],
                      ),
                    ),
                  ),
            )
            .toList(),
      ),
    );
  }
}
