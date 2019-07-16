import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/components/cache_network_image.dart';
import 'package:shop_app/pages/product_details/product_details_page.dart';

class RecommendGoodsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: ScreenUtil.getInstance().setHeight(534),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            child: _buildRecommendGoods(373, 534, 'https://i1.mifile.cn/a4/xmad_15592788710155_nYAat.jpg'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(),
                ),
              );
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildRecommendGoods(367, 258, 'https://i1.mifile.cn/a4/xmad_15621496532895_qtPax.jpg'),
              _buildRecommendGoods(367, 264, 'https://i1.mifile.cn/a4/xmad_15622932130351_aJFEP.jpg'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendGoods(double width, double height, String imageUrl) {
    return GZCacheNetworkImageWidget(
      width: ScreenUtil.getInstance().setWidth(width),
      height: ScreenUtil.getInstance().setHeight(height),
      imageUrl: imageUrl,
    );
  }
}
