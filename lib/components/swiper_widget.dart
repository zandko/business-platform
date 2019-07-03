import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwiperDiy extends StatelessWidget {
  final List swiperDataList;
  final double heightNumber;
  const SwiperDiy({Key key, @required this.swiperDataList, this.heightNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.getInstance().setHeight(heightNumber),
      child: Scaffold(
        body: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              "${swiperDataList[index]['image']}",
              fit: BoxFit.cover,
            );
          },
          itemCount: swiperDataList.length,
           pagination: SwiperPagination(),
           autoplay: true,
        ),
      ),
    );
  }
}