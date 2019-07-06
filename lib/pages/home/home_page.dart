import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shop_app/style/style.dart';
import 'package:shop_app/data/home.dart';
import 'package:shop_app/utils/log_util.dart';
import 'package:shop_app/tools/arc_clipper.dart';
import 'package:shop_app/model/kingkong.dart';
import 'package:shop_app/model/tab.dart';
import 'package:shop_app/components/cache_network_image.dart';
import 'package:shop_app/components/topbar.dart';
import 'package:shop_app/components/menue.dart';
import 'package:shop_app/components/tabbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<HomePage> {
  @override
  AnimationController _animationController;
  List<KingKongItem> kingKongItems;
  ScrollController _scrollViewController;
  GlobalKey _keyFilter = GlobalKey();
  Size _sizeRed;
  TabController _controller;
  List<TabModel> _tabModels = [];
  int _currentIndex = 0;
  List _hotWords = [];

  bool _onScroll(ScrollNotification scroll) {
    return false;
  }

  String get hoursString {
    Duration duration =
        _animationController.duration * _animationController.value;
    return '${(duration.inHours)..toString().padLeft(2, '0')}';
  }

  String get minutesString {
    Duration duration =
        _animationController.duration * _animationController.value;
    return '${(duration.inMinutes % 60).toString().padLeft(2, '0')}';
  }

  String get secondsString {
    Duration duration =
        _animationController.duration * _animationController.value;
    return '${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

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

    kingKongItems = KingKongList.fromJson(menueDataJson['items']).items;

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

  _handleTabSelection() {
    print('_handleTabSelection:${_controller.index}');
    setState(() {
      _currentIndex = _controller.index;
    });
  }

  Widget build(BuildContext context) {
    var v = Column(
      children: <Widget>[
        _buildSwiperImageWidget(),
        _buildSwiperButtonWidget(),
        _buildNewspaperWidget(),
        _buildRecommendGoodsWidget(),
        _buildAd2vertisingWidget(),
        _buildSpikeWidget(),
        _buildAd3vertisingWidget(),
      ],
    );

    var body = NestedScrollView(
      controller: _scrollViewController,
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
                children: <Widget>[v],
              ),
            ),
            expandedHeight: (_sizeRed == null
                ? MediaQuery.of(context).size.height
                : _sizeRed.height + ScreenUtil.getInstance().setHeight(96)),
            bottom: PreferredSize(
              preferredSize: Size(
                double.infinity,
                ScreenUtil.getInstance().setHeight(92),
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
          : TabBarView(
              controller: _controller,
              children: _createGoodsList(),
            ),
    );
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
              child: v,
              key: _keyFilter,
            ),
          ),
          GZTopBar(),
          Expanded(child: body),
        ],
      ),
    );
  }

  // 分类商品
  List<Widget> _createGoodsList() {
    return [8, 7, 6, 5, 4, 3, 2, 1].map((item) {
      return SingleChildScrollView(
        padding: EdgeInsets.all(
          ScreenUtil.getInstance().setWidth(15),
        ),
        child: Wrap(
          spacing: ScreenUtil.getInstance().setWidth(12),
          runSpacing: ScreenUtil.getInstance().setHeight(20),
          children: [1, 2, 3, 4, 5, 6, 7, 8].map((item1) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: ScreenUtil.getInstance().setWidth(354),
                height: ScreenUtil.getInstance().setHeight(528),
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: ScreenUtil.getInstance().setWidth(354),
                      height: ScreenUtil.getInstance().setHeight(262),
                      child: GZCacheNetworkImageWidget(
                        imageUrl:
                            'https://img.alicdn.com/tfscom/i1/2610856926/TB2JAdPhwRkpuFjy1zeXXc.6FXa_!!2610856926.jpg_360x360xzq90.jpg_.webp',
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(10),
                    ),
                    Text(
                      '红米5 Plus',
                      style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(32),
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(80, 80, 80, 1),
                      ),
                    ),
                    Text(
                      '千元全面屏，前置柔光自拍',
                      style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(24),
                        color: Color.fromRGBO(80, 80, 80, 1),
                      ),
                    ),
                    Text(
                      '999起',
                      style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(32),
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(134, 134, 134, 1),
                      ),
                    ),
                    MaterialButton(
                      height: ScreenUtil.getInstance().setHeight(58),
                      minWidth: ScreenUtil.getInstance().setWidth(192),
                      color: Colors.red,
                      textColor: Colors.white,
                      child: new Text('立即购买'),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      );
    }).toList();
  }

  // 轮播图
  Widget _buildSwiperImageWidget() {
    return Container(
      height: 150.0,
      child: Swiper(
        index: 0,
        loop: true,
        autoplay: true,
        duration: 300,
        pagination: SwiperPagination(),
        scrollDirection: Axis.horizontal,
        itemCount: banner_images.length,
        onTap: (index) {
          LogUtil.v("你点击了第$index个");
        },
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              height: 150,
              child: ClipPath(
                clipper: ArcClipper(),
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 150,
                      child: GZCacheNetworkImageWidget(
                        imageUrl: banner_images[index],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // 菜单栏
  Widget _buildSwiperButtonWidget() {
    List data = [];
    for (var i = 0; i < kingKongItems.length; ++i) {
      data.add(kingKongItems[i]);
    }
    return Container(
      height: ScreenUtil.getInstance().setHeight(160) * 2,
      child: GridView.count(
        crossAxisCount: 5,
        crossAxisSpacing: 0,
        physics: NeverScrollableScrollPhysics(),
        children: data.map((item) {
          return HomeKingKongWidget(
            data: item,
            fontColor: (menueDataJson['config'] as dynamic)['color'],
          );
        }).toList(),
      ),
    );
  }

  // 商城早报
  Widget _buildNewspaperWidget() {
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(24),
        bottom: ScreenUtil.getInstance().setHeight(24),
      ),
      width: MediaQuery.of(context).size.width,
      height: ScreenUtil.getInstance().setHeight(96),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Divider(
            height: ScreenUtil.getInstance().setHeight(1),
            indent: 0.0,
            color: Color.fromRGBO(80, 80, 80, 1),
          ),
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: ScreenUtil.getInstance().setWidth(164),
                child: Text(
                  '商城早报',
                  style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(28),
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(245, 89, 89, 1),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: ScreenUtil.getInstance().setHeight(13),
                  right: ScreenUtil.getInstance().setWidth(25),
                ),
                width: ScreenUtil.getInstance().setWidth(1),
                height: ScreenUtil.getInstance().setHeight(70),
                color: Color.fromRGBO(80, 80, 80, 0.8),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: ScreenUtil.getInstance().setWidth(558),
                child: Text(
                  '小米8 青春版全面配色：梦幻蓝全面来袭！',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(28),
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(80, 80, 80, 1),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 推荐商品
  Widget _buildRecommendGoodsWidget() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: ScreenUtil.getInstance().setHeight(534),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              right: ScreenUtil.getInstance().setWidth(10),
            ),
            width: ScreenUtil.getInstance().setWidth(373),
            height: ScreenUtil.getInstance().setHeight(534),
            child: GZCacheNetworkImageWidget(
              imageUrl: 'https://i1.mifile.cn/a4/xmad_15592788710155_nYAat.jpg',
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                width: ScreenUtil.getInstance().setWidth(367),
                height: ScreenUtil.getInstance().setHeight(258),
                child: GZCacheNetworkImageWidget(
                  imageUrl:
                      'https://i1.mifile.cn/a4/xmad_15621496532895_qtPax.jpg',
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: ScreenUtil.getInstance().setHeight(10),
                ),
                width: ScreenUtil.getInstance().setWidth(367),
                height: ScreenUtil.getInstance().setHeight(264),
                child: GZCacheNetworkImageWidget(
                  imageUrl:
                      'https://i1.mifile.cn/a4/xmad_15622932130351_aJFEP.jpg',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 广告位
  Widget _buildAd2vertisingWidget() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(26),
      ),
      height: ScreenUtil.getInstance().setHeight(288),
      child: GZCacheNetworkImageWidget(
        imageUrl: 'https://i1.mifile.cn/a4/xmad_15621639904412_QuMpy.jpg',
      ),
    );
  }

  // 广告位
  Widget _buildAd3vertisingWidget() {
    return Container(
      margin: EdgeInsets.only(
        bottom: ScreenUtil.getInstance().setHeight(26),
      ),
      width: MediaQuery.of(context).size.width,
      height: ScreenUtil.getInstance().setHeight(288),
      child: GZCacheNetworkImageWidget(
        imageUrl: 'https://i1.mifile.cn/a4/xmad_15517943282724_lhogK.jpg',
      ),
    );
  }

  // 秒杀
  Widget _buildSpikeWidget() {
    Widget Countown = Stack(
      alignment: Alignment.centerLeft,
      children: <Widget>[
        Container(
          width: ScreenUtil.getInstance().setWidth(158),
          child: Text(
            '小米秒杀',
            style: TextStyle(
              fontSize: ScreenUtil.getInstance().setSp(28),
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(254, 115, 21, 1),
            ),
          ),
        ),
        Positioned(
          right: ScreenUtil.getInstance().setWidth(22),
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (_, Widget child) {
              return Row(
                children: <Widget>[
                  Text(
                    '距下一场',
                    style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(28),
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(80, 80, 80, 1),
                    ),
                  ),
                  SizedBox(
                    width: ScreenUtil.getInstance().setWidth(14),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: Container(
                      color: Color.fromRGBO(128, 128, 128, 1),
                      child: Text(
                        hoursString,
                        style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(24),
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: ScreenUtil.getInstance().setWidth(8),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: Container(
                      color: Color.fromRGBO(128, 128, 128, 1),
                      child: Text(
                        minutesString,
                        style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(24),
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: ScreenUtil.getInstance().setWidth(8),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: Container(
                      color: Color.fromRGBO(128, 128, 128, 1),
                      child: Text(
                        secondsString,
                        style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(24),
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
    Widget SpikeGoods = Row(
      children: [1, 2, 3, 4, 5, 6, 7, 8].map((item) {
        return Container(
          width: ScreenUtil.getInstance().setWidth(192),
          height: ScreenUtil.getInstance().setHeight(264),
          margin: EdgeInsets.only(
            right: ScreenUtil.getInstance().setWidth(16),
          ),
          child: Column(
            children: <Widget>[
              Container(
                width: ScreenUtil.getInstance().setWidth(192),
                height: ScreenUtil.getInstance().setHeight(192),
                child: GZCacheNetworkImageWidget(
                  imageUrl:
                      'https://img.alicdn.com/tfscom/i1/TB1e3Heo_JYBeNjy1zeYXGhzVXa_M2.SS2_360x360xzq90.jpg_.webp',
                ),
              ),
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(16),
              ),
              Container(
                width: ScreenUtil.getInstance().setWidth(192),
                height: ScreenUtil.getInstance().setHeight(54),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '￥69',
                      style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(36),
                        color: Color.fromRGBO(254, 115, 21, 1),
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil.getInstance().setWidth(10),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: ScreenUtil.getInstance().setHeight(14),
                      ),
                      child: Text(
                        '￥169',
                        style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(20),
                          color: Color.fromRGBO(80, 80, 80, 0.43),
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Color.fromRGBO(80, 80, 80, 0.43),
                          decorationStyle: TextDecorationStyle.solid,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(26),
        bottom: ScreenUtil.getInstance().setHeight(26),
      ),
      padding: EdgeInsets.only(
        left: ScreenUtil.getInstance().setWidth(18),
      ),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: ScreenUtil.getInstance().setHeight(72),
            child: Countown,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SpikeGoods,
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
