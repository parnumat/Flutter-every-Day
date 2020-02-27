import 'package:day4/animation/FadeAnimation.dart';
import 'package:day4/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class StarterPage extends StatefulWidget {
  @override
  _StarterPageState createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  bool _texVisible = true;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );

    _animation = Tween<double>(
      begin: 1.0,
      end: 25.0,
    ).animate(_animationController);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  void _onTap() {
    setState(() {
      _texVisible = false;
    });

    _animationController.forward().then(
          (f) => Navigator.push(
            context,
            PageTransition(
              child: HomePage(),
              type: PageTransitionType.rotate,
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/seven.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.2),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FadeAnimation(
                  .5,
                  Text(
                    'Taking Order For Faster Deloivery',
                    style: GoogleFonts.quicksand(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                  1,
                  Text(
                    "See returants nerby by \nadding location",
                    style: GoogleFonts.quicksand(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        height: 1.4,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                FadeAnimation(
                  1.2,
                  ScaleTransition(
                    scale: _animation,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            Colors.yellow,
                            Colors.orange,
                          ],
                        ),
                      ),
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 50),
                        opacity: _texVisible ? 1.0 : 0.0,
                        child: MaterialButton(
                          minWidth: double.infinity,
                          child: Text(
                            "Start",
                            style: GoogleFonts.quicksand(
                              textStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          onPressed: () => _onTap(),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                FadeAnimation(
                  1.4,
                  AnimatedOpacity(
                    opacity: _texVisible ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 50),
                    child: Align(
                      child: Text(
                        "Now Deliver To Your Door 24/7",
                        style: GoogleFonts.quicksand(
                          textStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
