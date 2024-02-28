import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking/color_page.dart';
import 'package:hotel_booking/image_page.dart';
import 'package:pinput/pinput.dart';
import 'package:timer_count_down/timer_count_down.dart';
import '../main.dart';
import 'newpassword_page.dart';

class protectPage extends StatefulWidget {
  const protectPage({super.key});

  @override
  State<protectPage> createState() => _protectPageState();
}

class _protectPageState extends State<protectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPage.secondaryColor,
        leading: Padding(
          padding: EdgeInsets.all(w*0.025),
          child: Container(
            height: w*0.01,
            width: w*0.01,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(imagePage.leftarrow,
                color: colorPage.black,
                height: w*0.01,
                width: w*0.01,),
            ),

          ),
        ),
        title: Text("Forgot password",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: w*0.06,
              color: colorPage.black
          ),),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(w*0.03),
        child: SingleChildScrollView(
          child: Container(
            height: height*0.9,
            width: w*1,
            child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  // margin: EdgeInsets.only(left: width*0.10),
                  height: w*0.6,
                  width: w*1,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(imagePage.prtotecticon))
                  ),
                ),
                Center(child: Text("Code has been sent to +234111******99")),
               // SizedBox(height: w*0.05 ,),
                Column(
                  children: [
                    Pinput(
                      length: 4,
                      mainAxisAlignment: MainAxisAlignment.center,
                      preFilledWidget: Container(
                        decoration:BoxDecoration(
                          border: Border.all(color: colorPage.primaryColor),
                          borderRadius: BorderRadius.circular(w*0.03),
                        ) ,
                      ),
                    ),
                    SizedBox(height: w*0.05,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Resend code in "),
                        Countdown(
                            seconds: 60,
                            build: (p0, p1) {
                              return Text("$p1",
                              style: TextStyle(
                                color: colorPage.primaryColor
                              ),);
                            },),
                        Text("s",
                        style: TextStyle(
                          color: colorPage.primaryColor
                        ),),
                        Text(" s"),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: w*0.05,),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => newPasswordPage(),));
                  },
                  child: Container(
                    height: w*0.13,
                    width: w*0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(w*0.1),
                        color: colorPage.primaryColor,
                        boxShadow: [
                          BoxShadow(
                              color: colorPage.black.withOpacity(0.15),
                              blurRadius:2,
                              spreadRadius: 2,
                              offset: Offset(
                                  0,4
                              )
                          )
                        ]
                    ),
                    child: Center(child: Text("Verify",
                      style: TextStyle(
                          color: colorPage.secondaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: w*0.038
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
