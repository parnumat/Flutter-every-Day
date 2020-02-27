import 'package:day4/animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        brightness: Brightness.light,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.grey[800],
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_basket,
              color: Colors.grey[800],
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                    1,
                    Text(
                      'Food Delivery',
                      style: GoogleFonts.quicksand(
                        textStyle: TextStyle(
                          color: Colors.grey[80],
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        FadeAnimation(
                          1,
                          makeCategory(isActive: true, title: 'Pizza'),
                        ),
                        FadeAnimation(
                          1.3,
                          makeCategory(isActive: false, title: 'Burgers'),
                        ),
                        FadeAnimation(
                          1.4,
                          makeCategory(isActive: false, title: 'Kebab'),
                        ),
                        FadeAnimation(
                          1.4,
                          makeCategory(isActive: false, title: 'Desert'),
                        ),
                        FadeAnimation(
                          1.4,
                          makeCategory(isActive: false, title: 'Salad'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
            FadeAnimation(
              1,
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'IceStyle Delivery',
                  style: GoogleFonts.quicksand(
                    textStyle: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    FadeAnimation(
                      1.4,
                      makeItem(
                        image: 'assets/images/four.jpg',
                        price: 10.00,
                        details: "Small Vegetarian Pizza",
                      ),
                    ),
                    FadeAnimation(
                        1.5,
                        makeItem(
                          image: 'assets/images/three.jpg',
                          price: 15.00,
                          details: "Medium Vegetarian Pizza",
                        )),
                    FadeAnimation(
                        1.6,
                        makeItem(
                          image: 'assets/images/five.jpg',
                          price: 20.00,
                          details: "Large Vegetarian Pizza",
                        )),
                    FadeAnimation(
                        1.7,
                        makeItem(
                          image: 'assets/images/six.jpg',
                          price: 35.00,
                          details: "Over Vegetarian Pizza",
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  Widget makeCategory({isActive, title}) {
    return AspectRatio(
      aspectRatio: isActive ? 3 : 2.5 / 1,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: isActive ? Colors.yellow[700] : Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Align(
          child: Text(
            title,
            style: GoogleFonts.quicksand(
              textStyle: TextStyle(
                color: isActive ? Colors.white : Colors.grey[500],
                fontSize: 18,
                fontWeight: isActive ? FontWeight.bold : FontWeight.w100,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget makeItem({image, price, details}) {
    return AspectRatio(
      aspectRatio: 1 / 1.4,
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                stops: [.2, .9],
                colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.3)
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "\$ $price",
                        style: GoogleFonts.quicksand(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        details,
                        style: GoogleFonts.quicksand(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
