import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: "毕业设计",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color.fromRGBO(0, 169, 172, 1),
        ),
        home: Scaffold(
          body: Center(
            child: Text('hello world'),
          ),
        ),
      ),
    );
  }
}
