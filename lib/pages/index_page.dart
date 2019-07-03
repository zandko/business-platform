import 'package:flutter/material.dart';
import 'package:shop_app/style/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/pages/home/home_page.dart';
import 'package:shop_app/pages/category/category_page.dart';
import 'package:shop_app/pages/find/find_page.dart';
import 'package:shop_app/pages/shopping/shopping.dart';
import 'package:shop_app/pages/mine/mine_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<Widget> tabBodies = [
    HomePage(),
    CategoryPage(),
    FindPage(),
    ShoppingPage(),
    MinePage()
  ];

  final PageController topPageControl = new PageController();

  final _bottomNavigationColor = Color(0xFF585858);
  Color _bottomNavigationActiveColor = Colors.blue;
  int _currentIndex = 0;

  var _controller = PageController(
    initialPage: 0,
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _bottomNavigationActiveColor = Theme.of(context).primaryColor;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: tabBodies,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                GZIcons.home,
                color: _currentIndex == 0
                    ? _bottomNavigationActiveColor
                    : _bottomNavigationColor,
              ),
              activeIcon: Icon(
                GZIcons.home_active,
                color: _currentIndex == 0
                    ? _bottomNavigationActiveColor
                    : _bottomNavigationColor,
                size: 34,
              ),
              title: _currentIndex == 0
                  ? Container()
                  : _buildBarItemTitle('首页', 0),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                GZIcons.cascades,
                color: _currentIndex == 1
                    ? _bottomNavigationActiveColor
                    : _bottomNavigationColor,
              ),
              activeIcon: Icon(
                GZIcons.cascades,
                color: _currentIndex == 1
                    ? _bottomNavigationActiveColor
                    : _bottomNavigationColor,
              ),
              title: _buildBarItemTitle('分类', 1),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                GZIcons.we_tao,
                color: _currentIndex == 2
                    ? _bottomNavigationActiveColor
                    : _bottomNavigationColor,
              ),
              activeIcon: Icon(
                GZIcons.we_tao_fill,
                color: _currentIndex == 2
                    ? _bottomNavigationActiveColor
                    : _bottomNavigationColor,
              ),
              title: _buildBarItemTitle('发现', 2),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                GZIcons.cart,
                color: _currentIndex == 3
                    ? _bottomNavigationActiveColor
                    : _bottomNavigationColor,
              ),
              activeIcon: Icon(
                GZIcons.cart_fill,
                color: _currentIndex == 3
                    ? _bottomNavigationActiveColor
                    : _bottomNavigationColor,
              ),
              title: _buildBarItemTitle('购物车', 3),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                GZIcons.my,
                color: _currentIndex == 4
                    ? _bottomNavigationActiveColor
                    : _bottomNavigationColor,
              ),
              activeIcon: Icon(
                GZIcons.my_fill,
                color: _currentIndex == 4
                    ? _bottomNavigationActiveColor
                    : _bottomNavigationColor,
              ),
              title: _buildBarItemTitle('我的', 4),
            ),
          ]),
    );
  }

  Widget _buildBarItemTitle(String text, int index) {
    return Text(
      text,
      style: TextStyle(
        color: _currentIndex == index
            ? _bottomNavigationActiveColor
            : _bottomNavigationColor,
        fontSize: 12,
      ),
    );
  }
}
