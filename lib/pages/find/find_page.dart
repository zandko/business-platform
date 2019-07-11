import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/data/home.dart';
import 'package:shop_app/components/search_card.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shop_app/utils/log_util.dart';
import 'package:shop_app/components/cache_network_image.dart';

class FindPage extends StatefulWidget {
  @override
  _FindPageState createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  TextEditingController _keywordTextEditingController = TextEditingController();
  FocusNode _focus = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          brightness: Brightness.light,
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        preferredSize: Size.fromHeight(0),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: ScreenUtil.getInstance().setWidth(28),
              right: ScreenUtil.getInstance().setWidth(28),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Color.fromRGBO(229, 229, 229, 1),
                ),
              ),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: GZSearchCardWidget(
                    isShowLeading: true,
                    elevation: 0,
                    color: Color.fromRGBO(229, 229, 229, 0.6),
                    onTap: () {
                      FocusScope.of(context).requestFocus(
                        FocusNode(),
                      );
                    },
                    textEditingController: _keywordTextEditingController,
                    focusNode: _focus,
                  ),
                ),
                Icon(
                  Icons.message,
                  size: ScreenUtil.getInstance().setSp(46),
                  color: Color.fromRGBO(166, 166, 166, 1),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _buildSwiperImageWidget(),
                  _buildSwiperButtonWidget(),
                  _buildMiHomeWidget(),
                  _buildNewspaperWidget(),
                  _buildNewspaperContentWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwiperImageWidget() {
    return Container(
      height: ScreenUtil.getInstance().setHeight(348),
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
              height: ScreenUtil.getInstance().setHeight(348),
              child: GZCacheNetworkImageWidget(
                imageUrl: banner_images[index],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSwiperButtonWidget() {
    return Container(
      padding: EdgeInsets.all(
        ScreenUtil.getInstance().setWidth(28),
      ),
      width: MediaQuery.of(context).size.width,
      height: ScreenUtil.getInstance().setHeight(164),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: ScreenUtil.getInstance().setWidth(2),
            color: Color.fromRGBO(229, 229, 229, 1),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: ScreenUtil.getInstance().setWidth(56),
                height: ScreenUtil.getInstance().setHeight(56),
                child: GZCacheNetworkImageWidget(
                  imageUrl:
                      'https://img.alicdn.com/tfscom/i1/2610856926/TB2JAdPhwRkpuFjy1zeXXc.6FXa_!!2610856926.jpg_360x360xzq90.jpg_.webp',
                ),
              ),
              Text(
                '精选手机',
                style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(28),
                  color: Color.fromRGBO(56, 56, 56, 1),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                width: ScreenUtil.getInstance().setWidth(56),
                height: ScreenUtil.getInstance().setHeight(56),
                child: GZCacheNetworkImageWidget(
                  imageUrl:
                      'https://img.alicdn.com/tfscom/i1/2610856926/TB2JAdPhwRkpuFjy1zeXXc.6FXa_!!2610856926.jpg_360x360xzq90.jpg_.webp',
                ),
              ),
              Text(
                '限时秒杀',
                style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(28),
                  color: Color.fromRGBO(56, 56, 56, 1),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                width: ScreenUtil.getInstance().setWidth(56),
                height: ScreenUtil.getInstance().setHeight(56),
                child: GZCacheNetworkImageWidget(
                  imageUrl:
                      'https://img.alicdn.com/tfscom/i1/2610856926/TB2JAdPhwRkpuFjy1zeXXc.6FXa_!!2610856926.jpg_360x360xzq90.jpg_.webp',
                ),
              ),
              Text(
                '小米众筹',
                style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(28),
                  color: Color.fromRGBO(56, 56, 56, 1),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                width: ScreenUtil.getInstance().setWidth(56),
                height: ScreenUtil.getInstance().setHeight(56),
                child: GZCacheNetworkImageWidget(
                  imageUrl:
                      'https://img.alicdn.com/tfscom/i1/2610856926/TB2JAdPhwRkpuFjy1zeXXc.6FXa_!!2610856926.jpg_360x360xzq90.jpg_.webp',
                ),
              ),
              Text(
                '在线直播',
                style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(28),
                  color: Color.fromRGBO(56, 56, 56, 1),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMiHomeWidget() {
    return Container(
      padding: EdgeInsets.all(
        ScreenUtil.getInstance().setWidth(28),
      ),
      width: MediaQuery.of(context).size.width,
      height: ScreenUtil.getInstance().setHeight(160),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: ScreenUtil.getInstance().setWidth(144),
            height: ScreenUtil.getInstance().setHeight(104),
            child: GZCacheNetworkImageWidget(
              imageUrl:
                  'https://img.alicdn.com/tfscom/i1/2610856926/TB2JAdPhwRkpuFjy1zeXXc.6FXa_!!2610856926.jpg_360x360xzq90.jpg_.webp',
            ),
          ),
          Container(
            width: ScreenUtil.getInstance().setWidth(374),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '小米之家北京朝阳合生汇店',
                  style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(28),
                    color: Color.fromRGBO(56, 56, 56, 1),
                  ),
                ),
                Text(
                  '距离1公里',
                  style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(26),
                    color: Color.fromRGBO(128, 128, 128, 1),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                '其他零售店',
                style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(24),
                  color: Color.fromRGBO(128, 128, 128, 1),
                ),
              ),
              Icon(
                Icons.chevron_right,
                size: ScreenUtil.getInstance().setWidth(25),
                color: Color.fromRGBO(153, 153, 153, 1),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNewspaperWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(16),
      ),
      padding: EdgeInsets.only(
        left: ScreenUtil.getInstance().setWidth(28),
      ),
      width: MediaQuery.of(context).size.width,
      height: ScreenUtil.getInstance().setHeight(74),
      color: Colors.white,
      child: Text(
        '商城早报',
        style: TextStyle(
          fontSize: ScreenUtil.getInstance().setSp(28),
          color: Color.fromRGBO(80, 80, 80, 1),
        ),
      ),
    );
  }

  Widget _buildNewspaperContentWidget() {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: ScreenUtil.getInstance().setHeight(596),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: ScreenUtil.getInstance().setHeight(374),
                child: GZCacheNetworkImageWidget(
                  imageUrl:
                      'https://img.alicdn.com/tfscom/i1/2610856926/TB2JAdPhwRkpuFjy1zeXXc.6FXa_!!2610856926.jpg_360x360xzq90.jpg_.webp',
                ),
              ),
              Container(
                padding: EdgeInsets.all(
                  ScreenUtil.getInstance().setWidth(26),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '小米感恩季福利加码 再送100元手机券',
                      style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(30),
                        color: Color.fromRGBO(56, 56, 56, 1),
                      ),
                    ),
                    Text(
                      '小米2017感恩季火热进行中，除了100万张100元现金券，又有新的福利来了!',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(26),
                        color: Color.fromRGBO(128, 128, 128, 1),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '7小时前',
                          style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(24),
                            color: Color.fromRGBO(128, 128, 128, 1),
                          ),
                        ),
                        Text(
                          '8276 阅读',
                          style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(24),
                            color: Color.fromRGBO(128, 128, 128, 1),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: ScreenUtil.getInstance().setHeight(596),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: ScreenUtil.getInstance().setHeight(374),
                child: GZCacheNetworkImageWidget(
                  imageUrl:
                      'https://img.alicdn.com/tfscom/i1/2610856926/TB2JAdPhwRkpuFjy1zeXXc.6FXa_!!2610856926.jpg_360x360xzq90.jpg_.webp',
                ),
              ),
              Container(
                padding: EdgeInsets.all(
                  ScreenUtil.getInstance().setWidth(26),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '小米感恩季福利加码 再送100元手机券',
                      style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(30),
                        color: Color.fromRGBO(56, 56, 56, 1),
                      ),
                    ),
                    Text(
                      '小米2017感恩季火热进行中，除了100万张100元现金券，又有新的福利来了!',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(26),
                        color: Color.fromRGBO(128, 128, 128, 1),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '7小时前',
                          style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(24),
                            color: Color.fromRGBO(128, 128, 128, 1),
                          ),
                        ),
                        Text(
                          '8276 阅读',
                          style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(24),
                            color: Color.fromRGBO(128, 128, 128, 1),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: ScreenUtil.getInstance().setHeight(596),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: ScreenUtil.getInstance().setHeight(374),
                child: GZCacheNetworkImageWidget(
                  imageUrl:
                      'https://img.alicdn.com/tfscom/i1/2610856926/TB2JAdPhwRkpuFjy1zeXXc.6FXa_!!2610856926.jpg_360x360xzq90.jpg_.webp',
                ),
              ),
              Container(
                padding: EdgeInsets.all(
                  ScreenUtil.getInstance().setWidth(26),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '小米感恩季福利加码 再送100元手机券',
                      style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(30),
                        color: Color.fromRGBO(56, 56, 56, 1),
                      ),
                    ),
                    Text(
                      '小米2017感恩季火热进行中，除了100万张100元现金券，又有新的福利来了!',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(26),
                        color: Color.fromRGBO(128, 128, 128, 1),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '7小时前',
                          style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(24),
                            color: Color.fromRGBO(128, 128, 128, 1),
                          ),
                        ),
                        Text(
                          '8276 阅读',
                          style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(24),
                            color: Color.fromRGBO(128, 128, 128, 1),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
