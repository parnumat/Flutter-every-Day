import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  final List<String> shoes;
  final int cardNum;
  ProductCard({this.shoes, this.cardNum});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(642),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: ScreenUtil().setHeight(40),
              ),
              child: Container(
                width: ScreenUtil().setWidth(620),
                height: ScreenUtil().setHeight(990),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.tealAccent[400],
                      Colors.deepPurple[700],
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 8),
                      blurRadius: 8,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
