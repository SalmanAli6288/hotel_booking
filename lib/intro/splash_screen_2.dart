import 'package:flutter/material.dart';
import 'package:hotel_booking/color_page.dart';
import 'package:hotel_booking/main.dart';
import 'package:widget_loading/widget_loading.dart';

import '../auth/opening_page.dart';

class splashScreen2 extends StatefulWidget {
  const splashScreen2({super.key});

  @override
  State<splashScreen2> createState() => _splashScreen2State();
}

class _splashScreen2State extends State<splashScreen2> {
  void initState() {
    // TODO: implement initState
    Future.delayed(
        Duration(
            seconds: 2)).then((value) =>
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => openingPage(),)));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Container(
              height: height*0.6,
              width: w*0.6,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/b_image.png")),
              ),
            ),
          ),
          CircularWidgetLoading(
            child: Text("ffff"),
            dotRadius: w*0.015,
            padding: EdgeInsets.all(w*0.12),
            loading: true,
            dotColor: colorPage.primaryColor,
          )
        ],
      ),
    );
  }
}
