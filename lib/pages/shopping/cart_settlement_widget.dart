import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/pages/shopping/settlement/settlement_page.dart';

class CartSettlementWidget extends StatefulWidget {
  @override
  _CartSettlementWidgetState createState() => _CartSettlementWidgetState();
}

class _CartSettlementWidgetState extends State<CartSettlementWidget> {
  bool _checkboxSelected = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: MediaQuery.of(context).size.width,
      left: 0,
      bottom: 0,
      child: Container(
        color: Colors.white,
        height: ScreenUtil.getInstance().setHeight(104),
        child: Row(
          children: <Widget>[
            Checkbox(
                value: _checkboxSelected,
                activeColor: Theme.of(context).primaryColor,
                onChanged: (T) {
                  setState(() {
                    _checkboxSelected = T;
                  });
                }),
            Text(
              '全选',
              style: TextStyle(
                fontSize: ScreenUtil.getInstance().setSp(32),
                color: Color.fromRGBO(80, 80, 80, 1),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '合计:',
                    style: TextStyle(
                      color: Color.fromRGBO(80, 80, 80, 1),
                      fontSize: ScreenUtil.getInstance().setSp(32),
                    ),
                  ),
                  SizedBox(
                    width: 2.0,
                  ),
                  Text(
                    '￥999999',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil.getInstance().setSp(32),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettlementPage(),
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                        left: ScreenUtil.getInstance().setWidth(20),
                      ),
                      child: Text(
                        '结算(3)',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil.getInstance().setSp(32),
                        ),
                      ),
                      width: ScreenUtil.getInstance().setWidth(206),
                      height: ScreenUtil.getInstance().setHeight(104),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
