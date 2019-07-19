import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    size = new Size(
      size.width,
      ScreenUtil.getInstance().setHeight(300),
    );
    var path = new Path();
    path.lineTo(0.0, size.height);

    var firstControlPoint = new Offset(
      size.width / 2,
      size.height - ScreenUtil.getInstance().setHeight(40),
    );
    var firstPoint = new Offset(size.width, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

//    var secondControlPoint =
//        new Offset(size.width - (size.width / 2), size.height-30);
//    var secondPoint = new Offset(size.width, size.height );
//    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
//        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
