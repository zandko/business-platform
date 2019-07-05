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
  List<KingKongItem> kingKongItems;
  ScrollController _scrollViewController;
  GlobalKey _keyFilter = GlobalKey();
  Size _sizeRed;

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
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
  }

  Widget build(BuildContext context) {
    var v = Column(
      children: <Widget>[
        _buildSwiperImageWidget(),
        _buildSwiperButtonWidget(),
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

  @override
  bool get wantKeepAlive => true;
}
