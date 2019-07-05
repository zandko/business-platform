import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/style/style.dart';
import 'package:shop_app/data/home.dart';
import 'package:shop_app/utils/log_util.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shop_app/components/topbar.dart';
import 'package:shop_app/tools/arc_clipper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shop_app/model/kingkong.dart';
import 'package:shop_app/components/menue.dart';

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

    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
  }

  Widget build(BuildContext context) {
    var v = Column(
      children: <Widget>[
        _buildSwiperImageWidget(),
        _buildSwiperButtonWidget(),
        _buildNewspaperWidget(),
        _buildRecommendGoodsWidget(),
        _buildAd1vertisingWidget(),
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
                : _sizeRed.height),
//            bottom: PreferredSize(
//              preferredSize: Size(double.infinity, 46),
//            ),
          ),
        ];
      },
      body: Center(
        child: CircularProgressIndicator(),
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
                      child: CachedNetworkImage(
                        fadeOutDuration: const Duration(milliseconds: 300),
                        fadeInDuration: const Duration(milliseconds: 700),
                        fit: BoxFit.fill,
                        imageUrl: banner_images[index],
                        errorWidget: (context, url, error) => Icon(Icons.error),
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
            child: CachedNetworkImage(
              fadeOutDuration: const Duration(milliseconds: 300),
              fadeInDuration: const Duration(milliseconds: 700),
              fit: BoxFit.fill,
              imageUrl: 'https://i1.mifile.cn/a4/xmad_15592788710155_nYAat.jpg',
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                width: ScreenUtil.getInstance().setWidth(367),
                height: ScreenUtil.getInstance().setHeight(258),
                child: CachedNetworkImage(
                  fadeOutDuration: const Duration(milliseconds: 300),
                  fadeInDuration: const Duration(milliseconds: 700),
                  fit: BoxFit.fill,
                  imageUrl:
                      'https://i1.mifile.cn/a4/xmad_15621496532895_qtPax.jpg',
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: ScreenUtil.getInstance().setHeight(10),
                ),
                width: ScreenUtil.getInstance().setWidth(367),
                height: ScreenUtil.getInstance().setHeight(264),
                child: CachedNetworkImage(
                  fadeOutDuration: const Duration(milliseconds: 300),
                  fadeInDuration: const Duration(milliseconds: 700),
                  fit: BoxFit.fill,
                  imageUrl:
                      'https://i1.mifile.cn/a4/xmad_15622932130351_aJFEP.jpg',
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAd1vertisingWidget() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(26),
      ),
      height: ScreenUtil.getInstance().setHeight(288),
      child: CachedNetworkImage(
        fadeOutDuration: const Duration(milliseconds: 300),
        fadeInDuration: const Duration(milliseconds: 700),
        fit: BoxFit.fill,
        imageUrl: 'https://i1.mifile.cn/a4/xmad_15617044776801_SBenC.jpg',
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }

  Widget _buildAd2vertisingWidget() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(26),
      ),
      height: ScreenUtil.getInstance().setHeight(288),
      child: CachedNetworkImage(
        fadeOutDuration: const Duration(milliseconds: 300),
        fadeInDuration: const Duration(milliseconds: 700),
        fit: BoxFit.fill,
        imageUrl: 'https://i1.mifile.cn/a4/xmad_15621639904412_QuMpy.jpg',
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }

  Widget _buildAd3vertisingWidget() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(26),
      ),
      height: ScreenUtil.getInstance().setHeight(288),
      child: CachedNetworkImage(
        fadeOutDuration: const Duration(milliseconds: 300),
        fadeInDuration: const Duration(milliseconds: 700),
        fit: BoxFit.fill,
        imageUrl: 'https://i1.mifile.cn/a4/xmad_15517943282724_lhogK.jpg',
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }

  Widget _buildSpikeWidget() {
    List data = [];
    for (var i = 0; i < kingKongItems.length; ++i) {
      data.add(kingKongItems[i]);
    }
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(26),
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
            child: Stack(
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
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: data.map((item) {
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
                        child: CachedNetworkImage(
                          fadeOutDuration: const Duration(milliseconds: 300),
                          fadeInDuration: const Duration(milliseconds: 700),
                          fit: BoxFit.fill,
                          imageUrl:
                              'https://i1.mifile.cn/a1/pms_1550642182.7527088!220x220.jpg',
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
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
                                  decorationColor:
                                      Color.fromRGBO(80, 80, 80, 0.43),
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
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
