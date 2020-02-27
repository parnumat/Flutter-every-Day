import 'package:day2/home/profileClipper.dart';
import 'package:day2/widget/ProductCard.dart';
import 'package:day2/widget/brandSelector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      width: 750,
      height: 1334,
      allowFontScaling: true,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(40),
                left: ScreenUtil().setWidth(40),
                right: ScreenUtil().setWidth(40),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {},
                  ),
                  ClipOval(
                    clipper: ProfileClipper(),
                    child: Image.asset(
                      "assets/images/five.jpg",
                      width: ScreenUtil().setWidth(160),
                      height: ScreenUtil().setHeight(160),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(60),
                left: ScreenUtil().setWidth(70),
                bottom: ScreenUtil().setHeight(105),
              ),
              child: Text(
                "IceStyle",
                style: GoogleFonts.quicksand(
                  textStyle: TextStyle(
                    fontSize: 32,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            BrandSelector(
              brands: ["Nike", "Adidas", "Converse", "Vans"],
            ),
            SizedBox(
              height: ScreenUtil().setHeight(50),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(1050),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  List<String> shoes ;
                  return Padding(
                    padding: EdgeInsets.only(
                      left: ScreenUtil().setWidth(30),
                    ),
                    child: ProductCard(
                      shoes: shoes,
                      cardNum: index,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
