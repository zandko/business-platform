import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/style/style.dart';
import 'package:shop_app/data/home.dart';
import 'package:shop_app/model/tab.dart';
import 'package:shop_app/components/topbar.dart';
import 'package:shop_app/components/tabbar.dart';

import 'package:shop_app/pages/home/advertising_widget.dart';
import 'package:shop_app/pages/home/category_goods_widget.dart';
import 'package:shop_app/pages/home/newspaper_widget.dart';
import 'package:shop_app/pages/home/swiper_image_widget.dart';
import 'package:shop_app/pages/home/recommend_goods_widget.dart';
import 'package:shop_app/pages/home/spik_widget.dart';
import 'package:shop_app/pages/home/menu_widget.dart';

import 'package:shop_app/model/menu_entity.dart';
import 'package:shop_app/model/entity_factory.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<HomePage> {
  @override
  AnimationController _animationController;

  List<ManuItems> manuItems;

  GlobalKey _keyFilter = GlobalKey();
  Size _sizeRed;
  TabController _controller;
  List<TabModel> _tabModels = [];
  int _currentIndex = 0;
  List _hotWords = [];

  _afterLayout(_) {
    _getPositions('_keyFilter', _keyFilter);
    _getSizes('_keyFilter', _keyFilter);
  }

  _getPositions(log, GlobalKey globalKey) {
    RenderBox renderBoxRed = globalKey.currentContext.findRenderObject();
    var positionRed = renderBoxRed.localToGlobal(Offset.zero);
    print("POSITION of $log: $positionRed ");
  }

  _getSizes(log, GlobalKey globalKey) {
    RenderBox renderBoxRed = globalKey.currentContext.findRenderObject();
    _sizeRed = renderBoxRed.size;
    setState(() {});
    print("SIZE of $log: $_sizeRed");
  }

  @override
  void initState() {
    super.initState();

    manuItems = EntityFactory.generateOBJ<MenuEntity>(menueDataJson).items;

    _animationController = AnimationController(
        vsync: this, duration: Duration(hours: 10, minutes: 30, seconds: 0));
    _animationController.reverse(
        from: _animationController.value == 0.0
            ? 1.0
            : _animationController.value);

    _tabModels.add(TabModel(title: '全部', subtitle: '猜你喜欢'));
    _tabModels.add(TabModel(title: '直播', subtitle: '网红推荐'));
    _tabModels.add(TabModel(title: '便宜好货', subtitle: '低价抢购'));
    _tabModels.add(TabModel(title: '买家秀', subtitle: '购后分享'));
    _tabModels.add(TabModel(title: '全球', subtitle: '进口好货'));
    _tabModels.add(TabModel(title: '生活', subtitle: '享受生活'));
    _tabModels.add(TabModel(title: '母婴', subtitle: '母婴大赏'));
    _tabModels.add(TabModel(title: '时尚', subtitle: '时尚好货'));
    _controller = TabController(vsync: this, length: 8);
    _controller.addListener(_handleTabSelection);

    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _controller.dispose();
    super.dispose();
  }

  _handleTabSelection() {
    print('_handleTabSelection:${_controller.index}');
    setState(() {
      _currentIndex = _controller.index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GZColors.mainBackgroundColor,
      appBar: PreferredSize(
        child: AppBar(
          brightness: Brightness.dark,
          elevation: 0,
        ),
        preferredSize: Size.fromHeight(0),
      ),
      body: Column(
        children: <Widget>[
          // 当offstage为true控件隐藏 当offstage为false显示
          Offstage(
            offstage: true,
            child: Container(
              child: _buildHomeContentWidget(),
              key: _keyFilter,
            ),
          ),
          GZTopBar(),
          Expanded(
            child: _buildHomeBodyWidget(),
          ),
        ],
      ),
    );
  }

  Widget _buildHomeContentWidget() {
    return Column(
      children: <Widget>[
        SwiperImageWidget(),
        MenuWidget(manuItems: manuItems),
        NewspaperWidget(),
        RecommendGoodsWidget(),
        AdvertisingWidget(
            imageUrl:
                "https://cdn.pixabay.com/photo/2019/07/10/22/41/zinnowitz-4329714__480.jpg"),
        SpikWidget(animationController: _animationController),
        AdvertisingWidget(
            imageUrl:
                "https://cdn.pixabay.com/photo/2019/07/10/22/41/zinnowitz-4329714__480.jpg"),
      ],
    );
  }

  Widget _buildHomeBodyWidget() {
    return NestedScrollView(
        controller: ScrollController(),
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              floating: true,
              forceElevated: boxIsScrolled,
              backgroundColor: GZColors.mainBackgroundColor,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildHomeContentWidget(),
                  ],
                ),
              ),
              expandedHeight: (_sizeRed == null
                  ? MediaQuery.of(context).size.height
                  : _sizeRed.height + ScreenUtil.getInstance().setHeight(96)),
              bottom: PreferredSize(
                preferredSize: Size(
                  double.infinity,
                  ScreenUtil.getInstance().setHeight(96),
                ),
                child: GZTabBarWidget(
                  tabController: _controller,
                  tabModels: _tabModels,
                  currentIndex: _currentIndex,
                ),
              ),
            ),
          ];
        },
        body: _hotWords.length == 1
            ? Center(
                child: CircularProgressIndicator(),
              )
            : CategoryGoodsWidget(controller: _controller));
  }

  @override
  bool get wantKeepAlive => true;
}
