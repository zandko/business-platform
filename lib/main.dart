import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:shop_app/style/style.dart';
import 'package:shop_app/pages/index_page.dart';

// void main() async {
//   sp = await SpUtil.getInstance();
//   if (Platform.isAndroid) {
//     SystemUiOverlayStyle systemUiOverlayStyle =
//         SystemUiOverlayStyle(statusBarColor: Colors.transparent);
//     SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
//   }

//   runApp(MyApp());
// }

void main() {
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  runZoned(() {
    runApp(MyApp());
    PaintingBinding.instance.imageCache.maximumSize = 100;
    Provider.debugCheckInvalidValueType = null;
  }, onError: (Object obj, StackTrace stack) {
    print(obj);
    print(stack);
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter demo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: GZColors.primarySwatch,
      ),
      home: IndexPage(),
    );
  }
}
