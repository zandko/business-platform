import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;

class NewspaperDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBarWidget(context),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          ScreenUtil.getInstance().setWidth(38),
          ScreenUtil.getInstance().setHeight(58),
          ScreenUtil.getInstance().setWidth(38),
          0,
        ),
        child: Column(
          children: <Widget>[
            Text(
              '小米感恩季福利加码 再送100元手机券',
              style: TextStyle(
                color: Color.fromRGBO(56, 56, 56, 1),
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil.getInstance().setSp(48),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: ScreenUtil.getInstance().setHeight(20),
                bottom: ScreenUtil.getInstance().setHeight(20),
              ),
              child: Row(
                children: <Widget>[
                  Text(
                    '2017-12-21',
                    style: TextStyle(
                      color: Color.fromRGBO(128, 128, 128, 1),
                      fontSize: ScreenUtil.getInstance().setSp(28),
                    ),
                  ),
                  Text(
                    '小米商城',
                    style: TextStyle(
                      color: Color.fromRGBO(128, 128, 128, 1),
                      fontSize: ScreenUtil.getInstance().setSp(28),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(
                ScreenUtil.getInstance().setWidth(32),
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Color.fromRGBO(229, 229, 229, 1),
                ),
              ),
              child: Text(
                '小米2017感恩季火热进行中，除了100万张100元现金券，又有新的福利来了!',
                style: TextStyle(
                  color: Color.fromRGBO(128, 128, 128, 1),
                  fontSize: ScreenUtil.getInstance().setSp(26),
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(20),
            ),
            Html(
              data: """
              <img src='https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/012ed82dfddfacabd040b9de4bfb3f69.jpg?w=1080&h=655&bg=FFFFFF' alt=''>
              <img src='https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/4df2a2494d4585205db5672d40d68633.jpg?w=1080&h=670&bg=FFFFFF' alt=''>
              <img src='https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/fd52ddef6ca9f17552947c63804115a2.jpg?w=1080&h=1530&bg=FFFFFF' alt=''>
            """,
              //Optional parameters:
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
              //Must have useRichText set to false for this to work
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
                      return baseStyle
                          .merge(TextStyle(height: 2, fontSize: 20));
                  }
                }
                return baseStyle;
              },
            ),
          ],
        ),
      ),
    );
  }

  _navigatePop(BuildContext context) async {
    await Navigator.pop(context);
  }

  Widget _buildAppBarWidget(context) {
    return PreferredSize(
      child: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 1.0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            _navigatePop(context);
          },
          child: Icon(
            Icons.chevron_left,
            size: ScreenUtil.getInstance().setSp(46),
            color: Color.fromRGBO(128, 128, 128, 1),
          ),
        ),
        title: Text(
          '小米感恩季福利加码 再送100元手机券',
          style: TextStyle(
            fontSize: ScreenUtil.getInstance().setSp(36),
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(80, 80, 80, 1),
          ),
        ),
        actions: <Widget>[
          Icon(
            Icons.more_horiz,
            size: ScreenUtil.getInstance().setSp(46),
            color: Color.fromRGBO(128, 128, 128, 1),
          ),
          SizedBox(
            width: ScreenUtil.getInstance().setWidth(28),
          ),
        ],
      ),
      preferredSize: Size.fromHeight(
        ScreenUtil.getInstance().setHeight(80),
      ),
    );
  }
}
