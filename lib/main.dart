import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:shop_app/style/style.dart';
import 'package:shop_app/utils/shared_preferences.dart';
import 'package:shop_app/pages/index_page.dart';

SpUtil sp;

void main() async {
  sp = await SpUtil.getInstance();
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: "毕业设计",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: GZColors.primarySwatch,
//          primaryColor: Color.fromRGBO(237, 237, 237, 1),
        ),
        home: IndexPage(),
      ),
    );
  }
}
