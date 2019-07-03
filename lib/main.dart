import 'package:flutter/material.dart';
import 'package:shop_app/pages/index_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: "毕业设计",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
//          primaryColor: Color.fromRGBO(237, 237, 237, 1),
        ),
        home: IndexPage(),
      ),
    );
  }
}
