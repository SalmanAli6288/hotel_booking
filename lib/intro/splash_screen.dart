import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking/color_page.dart';
import 'package:hotel_booking/image_page.dart';
import 'package:hotel_booking/main.dart';

import 'onbody_content.dart';
import 'onbody_screen_1.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(
        Duration(
            seconds: 1)).then((value) =>
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => onBodyScreen1(),)));
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
       height: height*1,
       width: w*1,
       padding: EdgeInsets.only(left: w*0.08),
       decoration: BoxDecoration(
         image: DecorationImage(image: AssetImage(imagePage.homePage),fit: BoxFit.fill)
       ),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.end,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text("Welcome to",
           style: TextStyle(
             fontWeight: FontWeight.w700,
             fontSize: w*0.11,
             color: colorPage.secondaryColor,
           )),
           SizedBox(height: w*0.04,),
           Text("Bolu",
           style: TextStyle(
             fontWeight: FontWeight.w700,
             fontSize: w*0.3,
             color: colorPage.primaryColor
           ),),
           SizedBox(height: w*0.04,),
           Text("The best hotel bookings in the century to\naccompany your vacation",

             style: TextStyle(
                 fontWeight: FontWeight.w600,
                 fontSize: w*0.04,
                 color: colorPage.secondaryColor
             ),),
           SizedBox(height: w*0.1,),
         ],
       )
     ),
    );
  }
}
