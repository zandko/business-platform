import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/components/cache_network_image.dart';

class SpikWidget extends StatefulWidget {
  final AnimationController animationController;

  SpikWidget({Key key, this.animationController}) : super(key: key);

  @override
  _SpikWidgetState createState() => _SpikWidgetState();
}

class _SpikWidgetState extends State<SpikWidget> {
  String get hoursString {
    Duration duration =
        widget.animationController.duration * widget.animationController.value;
    return '${(duration.inHours).toString().padLeft(2, '0')}';
  }

  String get minutesString {
    Duration duration =
        widget.animationController.duration * widget.animationController.value;
    return '${(duration.inMinutes % 60).toString().padLeft(2, '0')}';
  }

  String get secondsString {
    Duration duration =
        widget.animationController.duration * widget.animationController.value;
    return '${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
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
          _buildCountownWidget(),
          _buildSpikeGoodsWidget(),
        ],
      ),
    );
  }

  Widget _buildCountownWidget() {
    return Container(
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
              animation: widget.animationController,
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
                    _buildTimeWidget(hoursString),
                    SizedBox(
                      width: ScreenUtil.getInstance().setWidth(8),
                    ),
                    _buildTimeWidget(minutesString),
                    SizedBox(
                      width: ScreenUtil.getInstance().setWidth(8),
                    ),
                    _buildTimeWidget(secondsString),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeWidget(String time) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3),
      child: Container(
        color: Color.fromRGBO(128, 128, 128, 1),
        child: Text(
          time,
          style: TextStyle(
            fontSize: ScreenUtil.getInstance().setSp(24),
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildSpikeGoodsWidget() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [1, 2, 3, 4, 5, 6, 7, 8].map((item) {
          return _buildSpikGoodsItemWidget();
        }).toList(),
      ),
    );
  }

  Widget _buildSpikGoodsItemWidget() {
    return Container(
      width: ScreenUtil.getInstance().setWidth(192),
      height: ScreenUtil.getInstance().setHeight(264),
      margin: EdgeInsets.only(
        right: ScreenUtil.getInstance().setWidth(16),
      ),
      child: Column(
        children: <Widget>[
          GZCacheNetworkImageWidget(
            width: ScreenUtil.getInstance().setWidth(192),
            height: ScreenUtil.getInstance().setHeight(192),
            imageUrl:
                'https://img.alicdn.com/tfscom/i1/TB1e3Heo_JYBeNjy1zeYXGhzVXa_M2.SS2_360x360xzq90.jpg_.webp',
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
  }
}
