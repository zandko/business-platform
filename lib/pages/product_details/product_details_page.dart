import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/components/cache_network_image.dart';
import 'package:shop_app/components/swipper.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;

class ProductDetailsPage extends StatefulWidget {
  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              bottom: ScreenUtil.getInstance().setHeight(104),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SwipperWidget(
                    height: ScreenUtil.getInstance().setHeight(824),
                  ),
                  _buildDescriptionWidget(),
                  _buildDeliveryWidget(),
                  _buildAccessoriesWidget(),
                  _buildEvaluationWidget(),
                  _buildParameterWidget(),
                  _buildDetailOrParameterWidget(),
                ],
              ),
            ),
          ),
          _buildActionBarWidget(),
          _buildBottomBarWidget(),
        ],
      ),
    );
  }

  Widget _buildActionBarWidget() {
    return Positioned(
      top: ScreenUtil.getInstance().setHeight(66),
      child: Container(
        padding: EdgeInsets.only(
          left: ScreenUtil.getInstance().setWidth(20),
          right: ScreenUtil.getInstance().setWidth(20),
        ),
        width: MediaQuery.of(context).size.width,
        height: ScreenUtil.getInstance().setHeight(86),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ClipOval(
              child: InkWell(
                child: Container(
                  width: ScreenUtil.getInstance().setWidth(66),
                  height: ScreenUtil.getInstance().setHeight(66),
                  color: Color.fromRGBO(56, 56, 56, 0.6),
                  child: Icon(Icons.chevron_left, color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            ClipOval(
              child: Container(
                width: ScreenUtil.getInstance().setWidth(66),
                height: ScreenUtil.getInstance().setHeight(66),
                color: Color.fromRGBO(56, 56, 56, 0.6),
                child: Icon(Icons.more_horiz, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBarWidget() {
    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
        color: Colors.white,
        height: ScreenUtil.getInstance().setHeight(104),
        child: Row(
          children: <Widget>[
            Container(
              width: ScreenUtil.getInstance().setWidth(328),
              height: ScreenUtil.getInstance().setHeight(102),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1, color: Colors.black12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.favorite_border,
                        color: Color.fromRGBO(128, 128, 128, 1),
                        size: ScreenUtil.getInstance().setSp(42),
                      ),
                      Text(
                        '喜欢',
                        style: TextStyle(
                          color: Color.fromRGBO(128, 128, 128, 1),
                          fontSize: ScreenUtil.getInstance().setSp(24),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: ScreenUtil.getInstance().setHeight(50),
                    width: 1,
                    color: Color.fromRGBO(128, 128, 128, 1),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.shopping_cart,
                        color: Color.fromRGBO(128, 128, 128, 1),
                        size: ScreenUtil.getInstance().setSp(42),
                      ),
                      Text(
                        '购物车',
                        style: TextStyle(
                          color: Color.fromRGBO(128, 128, 128, 1),
                          fontSize: ScreenUtil.getInstance().setSp(24),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: ScreenUtil.getInstance().setWidth(422),
              height: ScreenUtil.getInstance().setHeight(104),
              color: Color.fromRGBO(255, 112, 58, 1),
              child: Text(
                '加入购物车',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil.getInstance().setSp(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDescriptionWidget() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(28),
        left: ScreenUtil.getInstance().setWidth(28),
        right: ScreenUtil.getInstance().setWidth(24),
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '米家扫地机器人',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              color: Color.fromRGBO(51, 51, 51, 1),
              fontSize: ScreenUtil.getInstance().setSp(36),
            ),
          ),
          Text(
            '【小米2017感恩季来啦！米家扫地机器人立减100元，用券再享折上优惠，小米分期12期免息】高精度激光测距，智能规划路径/1800Pa 大风压澎湃吸力/远程智能控制，定时清扫/大电池持久清扫',
            overflow: TextOverflow.ellipsis,
            maxLines: 4,
            style: TextStyle(
              color: Color.fromRGBO(128, 128, 128, 1),
              fontSize: ScreenUtil.getInstance().setSp(26),
            ),
          ),
          Row(
            children: <Widget>[
              Text(
                '￥1599',
                style: TextStyle(
                  color: Color.fromRGBO(255, 112, 58, 1),
                  fontSize: ScreenUtil.getInstance().setSp(36),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '￥1699',
                style: TextStyle(
                  decorationStyle: TextDecorationStyle.solid,
                  decorationColor: Color.fromRGBO(166, 166, 166, 1),
                  decoration: TextDecoration.lineThrough,
                  color: Color.fromRGBO(166, 166, 166, 1),
                  fontSize: ScreenUtil.getInstance().setSp(26),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Container(
            height: ScreenUtil.getInstance().setHeight(70),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 1,
                  color: Color.fromRGBO(229, 229, 229, 1),
                ),
              ),
            ),
            child: _buildPublicSelectWidget('分期', '花呗分期/小米分期', ''),
          ),
        ],
      ),
    );
  }

  Widget _buildPublicSelectWidget(String text1, String text2, String text3) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              text1,
              style: TextStyle(
                fontSize: ScreenUtil.getInstance().setSp(26),
                color: Color.fromRGBO(128, 128, 128, 1),
              ),
            ),
            SizedBox(
              width: ScreenUtil.getInstance().setWidth(40),
            ),
            Text(
              text2,
              style: TextStyle(
                fontSize: ScreenUtil.getInstance().setSp(26),
                color: Color.fromRGBO(51, 51, 51, 1),
              ),
            ),
            SizedBox(
              width: ScreenUtil.getInstance().setWidth(20),
            ),
            Text(
              text3,
              style: TextStyle(
                fontSize: ScreenUtil.getInstance().setSp(26),
                color: Color.fromRGBO(255, 112, 58, 1),
              ),
            ),
          ],
        ),
        Icon(
          Icons.chevron_right,
          color: Color.fromRGBO(153, 153, 153, 1),
        ),
      ],
    );
  }

  Widget _buildDeliveryWidget() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(24),
      ),
      padding: EdgeInsets.only(
        left: ScreenUtil.getInstance().setWidth(28),
        right: ScreenUtil.getInstance().setWidth(24),
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil.getInstance().setHeight(70),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Color.fromRGBO(229, 229, 229, 1),
                ),
              ),
            ),
            child: _buildPublicSelectWidget('已选', '米家扫地机器人 x 1', ''),
          ),
          Container(
            height: ScreenUtil.getInstance().setHeight(70),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Color.fromRGBO(229, 229, 229, 1),
                ),
              ),
            ),
            child: _buildPublicSelectWidget('送至', '北京市 朝阳区', '有现货'),
          ),
          Container(
            height: ScreenUtil.getInstance().setHeight(70),
            child: Row(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.check_circle_outline,
                      color: Color.fromRGBO(128, 128, 128, 1),
                      size: ScreenUtil.getInstance().setSp(28),
                    ),
                    Text(
                      '支持7天无理由退货',
                      style: TextStyle(
                        color: Color.fromRGBO(128, 128, 128, 1),
                        fontSize: ScreenUtil.getInstance().setSp(24),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccessoriesWidget() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(18),
      ),
      padding: EdgeInsets.only(
        left: ScreenUtil.getInstance().setWidth(28),
        right: ScreenUtil.getInstance().setWidth(24),
      ),
      height: ScreenUtil.getInstance().setHeight(70),
      child: _buildPublicSelectWidget('配件', '虚拟墙、滤网、边刷', ''),
    );
  }

  Widget _buildEvaluationWidget() {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: ScreenUtil.getInstance().setHeight(18),
          ),
          padding: EdgeInsets.only(
            left: ScreenUtil.getInstance().setWidth(28),
            right: ScreenUtil.getInstance().setWidth(24),
          ),
          height: ScreenUtil.getInstance().setHeight(70),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: Colors.black12,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '用户评价(14257)',
                style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(28),
                  color: Color.fromRGBO(128, 128, 128, 1),
                ),
              ),
              Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                        text: '98.6%',
                        style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(28),
                          color: Color.fromRGBO(255, 112, 58, 1),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '满意',
                            style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(28),
                              color: Color.fromRGBO(128, 128, 128, 1),
                            ),
                          ),
                        ]),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Color.fromRGBO(153, 153, 153, 1),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          padding: EdgeInsets.all(
            ScreenUtil.getInstance().setWidth(26),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  ClipOval(
                    child: GZCacheNetworkImageWidget(
                      width: ScreenUtil.getInstance().setWidth(56),
                      height: ScreenUtil.getInstance().setHeight(56),
                      imageUrl:
                          'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3024387196,1621670548&fm=27&gp=0.jpg',
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    '骑毛驴玩小米',
                    style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(30),
                      color: Color.fromRGBO(56, 56, 56, 1),
                    ),
                  ),
                ],
              ),
              Text(
                '小东西很好，双12买的13号就到了，买的时候没告诉老婆，收到之后立马让它先表演一下，结果老婆高兴坏了，出乎我意料的准许我来撩客服妹子，今天我头发理了，胡子刮了，放在衣柜里10多年的西装皮鞋也穿上了',
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(26),
                  color: Color.fromRGBO(56, 56, 56, 1),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildParameterWidget() {
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(18),
      ),
      height: ScreenUtil.getInstance().setHeight(74),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            '商品详情',
            style: TextStyle(
              color: Color.fromRGBO(255, 112, 58, 1),
              fontSize: ScreenUtil.getInstance().setSp(28),
            ),
          ),
          Container(
            height: ScreenUtil.getInstance().setHeight(40),
            width: 1,
            color: Colors.black12,
          ),
          Text(
            '参数',
            style: TextStyle(
              color: Color.fromRGBO(80, 80, 80, 1),
              fontSize: ScreenUtil.getInstance().setSp(28),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailOrParameterWidget() {
    return Html(
      data: """
              <img src='https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/012ed82dfddfacabd040b9de4bfb3f69.jpg?w=1080&h=655&bg=FFFFFF' alt=''>
              <img src='https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/4df2a2494d4585205db5672d40d68633.jpg?w=1080&h=670&bg=FFFFFF' alt=''>
              <img src='https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/fd52ddef6ca9f17552947c63804115a2.jpg?w=1080&h=1530&bg=FFFFFF' alt=''>
            """,
      linkStyle: const TextStyle(
        color: Colors.redAccent,
        decorationColor: Colors.redAccent,
        decoration: TextDecoration.underline,
      ),
      onLinkTap: (url) {
        print("Opening $url...");
      },
      onImageTap: (src) {
        print(src);
      },
      customRender: (node, children) {
        if (node is dom.Element) {
          switch (node.localName) {
            case "custom_tag":
              return Column(children: children);
          }
        }
        return null;
      },
      customTextAlign: (dom.Node node) {
        if (node is dom.Element) {
          switch (node.localName) {
            case "p":
              return TextAlign.justify;
          }
        }
        return null;
      },
      customTextStyle: (dom.Node node, TextStyle baseStyle) {
        if (node is dom.Element) {
          switch (node.localName) {
            case "p":
              return baseStyle.merge(TextStyle(height: 2, fontSize: 20));
          }
        }
        return baseStyle;
      },
    );
  }
}
