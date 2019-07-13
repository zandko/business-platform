import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/components/cache_network_image.dart';
import 'package:shop_app/model/category_data_entity.dart';

class MenuContentWidget extends StatefulWidget {
  final CategoryDataEntity categoryDataEntity;

  MenuContentWidget({Key key, this.categoryDataEntity}) : super(key: key);

  @override
  _MenuContentWidgetState createState() => _MenuContentWidgetState();
}

class _MenuContentWidgetState extends State<MenuContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          ScreenUtil.getInstance().setWidth(30),
          ScreenUtil.getInstance().setHeight(16),
          ScreenUtil.getInstance().setWidth(30),
          0),
      width: ScreenUtil.getInstance().setWidth(582),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          _buildMenuImageWidget(),
          SizedBox(
            height: ScreenUtil.getInstance().setHeight(44),
          ),
          _buildTwoMenuWidget(),
        ],
      ),
    );
  }

  Widget _buildMenuImageWidget() {
    return GZCacheNetworkImageWidget(
      width: ScreenUtil.getInstance().setWidth(520),
      height: ScreenUtil.getInstance().setHeight(186),
      imageUrl: widget.categoryDataEntity.picUrl
    );
  }

  Widget _buildTwoMenuWidget() {
    return Column(
      children: widget.categoryDataEntity.childer.map((item) {
        return Container(
          margin: EdgeInsets.only(
            bottom: ScreenUtil.getInstance().setHeight(32),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildTwoMenuTitleWidget(item.title),
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(46),
              ),
              _buildTwoMenuContentWidget(item.childer),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTwoMenuTitleWidget(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            right: ScreenUtil.getInstance().setWidth(10),
          ),
          width: ScreenUtil.getInstance().setWidth(50),
          height: 1,
          color: Color.fromRGBO(56, 56, 56, 0.5),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: ScreenUtil.getInstance().setSp(28),
            color: Color.fromRGBO(56, 56, 56, 1),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: ScreenUtil.getInstance().setWidth(10),
          ),
          width: ScreenUtil.getInstance().setWidth(50),
          height: 1,
          color: Color.fromRGBO(56, 56, 56, 0.5),
        ),
      ],
    );
  }

  Widget _buildTwoMenuContentWidget(List<CategoryDataChilderChilder> data) {
    return Wrap(
      spacing: ScreenUtil.getInstance().setWidth(30),
      runSpacing: ScreenUtil.getInstance().setHeight(42),
      children: data.map((item) {
        return Container(
          child: Column(
            children: <Widget>[
              GZCacheNetworkImageWidget(
                width: ScreenUtil.getInstance().setWidth(154),
                height: ScreenUtil.getInstance().setHeight(154),
                imageUrl: item.picUrl,
              ),
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(15),
              ),
              Text(
                item.title,
                style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(26),
                  color: Color.fromRGBO(128, 128, 128, 1),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
