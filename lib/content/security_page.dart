import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/color_page.dart';
import 'package:hotel_booking/content/newpassword_page.dart';
import 'package:hotel_booking/image_page.dart';

import '../main.dart';
import 'kezia_profile.dart';

class securityPage extends StatefulWidget {
  const securityPage({super.key});

  @override
  State<securityPage> createState() => _securityPageState();
}

class _securityPageState extends State<securityPage> {
  bool toggle = false;
  bool toggle1 = false;
  bool toggle2 = false;
  bool toggle3 = false;
  bool toggle4 = false;
  bool toggle5 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPage.secondaryColor,
        leading: Container(
          height: w * 0.5,
          width: w * 0.5,
          padding: EdgeInsets.all(w * 0.02),
          child: InkWell(
              onTap: () {
                Navigator.pop(context,MaterialPageRoute(builder: (context) => keziaProfile(),));
              },
              child: SvgPicture.asset(imagePage.leftarrow)),
        ),
        title: Text(
          "Security",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: w * 0.06,
              color: colorPage.black),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(w*0.05),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Face ID",style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: w*0.04
                    ),),
                    Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            toggle = !toggle;
                            setState(() {});
                          },
                          child: Container(
                            height: w * 0.07,
                            width: w * 0.12,
                            decoration: BoxDecoration(
                              color: toggle ? Colors.green : Colors.grey[400],
                              borderRadius: BorderRadius.circular(w * 0.05),
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                            duration: Duration(milliseconds: 200),
                            left: toggle? w * 0.05 : w * 0.0,
                            right: toggle ? w * 0.0: w * 0.05,
                            top: w*0.005,
                            child: InkWell(
                              onTap: () {
                                toggle = !toggle;
                                setState(() {});
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeIn,
                                height: w * 0.06,
                                width: w * 0.06,
                                decoration: BoxDecoration(
                                    color: Colors.white, shape: BoxShape.circle),
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
                SizedBox(height: w*0.05,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Remember Me",style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: w*0.04
                    ),),
                    Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            toggle1 = !toggle1;
                            setState(() {});
                          },
                          child: Container(
                            height: w * 0.07,
                            width: w * 0.12,
                            decoration: BoxDecoration(
                              color: toggle1 ? Colors.green : Colors.grey[400],
                              borderRadius: BorderRadius.circular(w * 0.05),
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                            duration: Duration(milliseconds: 200),
                            left: toggle1? w * 0.05 : w * 0.0,
                            right: toggle1 ? w * 0.0 : w * 0.05,
                            top: w*0.005,
                            child: InkWell(
                              onTap: () {
                                toggle1 = !toggle1;
                                setState(() {});
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeIn,
                                height: w * 0.06,
                                width: w * 0.06,
                                decoration: BoxDecoration(
                                    color: Colors.white, shape: BoxShape.circle),
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
                SizedBox(height: w*0.05,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Touch ID",style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: w*0.04
                    ),),
                    Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            toggle2 = !toggle2;
                            setState(() {});
                          },
                          child: Container(
                            height: w * 0.07,
                            width: w * 0.12,
                            decoration: BoxDecoration(
                              color: toggle2 ? Colors.green : Colors.grey[400],
                              borderRadius: BorderRadius.circular(w * 0.05),
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                            duration: Duration(milliseconds: 200),
                            left: toggle2? w * 0.05 : w * 0,
                            right: toggle2 ? w * 0 : w * 0.05,
                            top: w*0.005,
                            child: InkWell(
                              onTap: () {
                                toggle2 = !toggle2;
                                setState(() {});
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeIn,
                                height: w * 0.06,
                                width: w * 0.06,
                                decoration: BoxDecoration(
                                    color: Colors.white, shape: BoxShape.circle),
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
                SizedBox(height: w*0.05,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Google Authenticator",style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: w*0.04
                    ),),
                    Container(
                      height: w*0.07,
                        width: w*0.07,
                        //color: colorPage.red,
                        child: SvgPicture.asset(imagePage.rightarw))
                  ],
                ),
              ],
            ),
            SizedBox(height: w*0.08,),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => newPasswordPage(),));
              },
              child: Container(
                height: w*0.15,
                width: w*0.75,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(w*0.1),
                    color: colorPage.lightGreen,
                    // boxShadow: [
                    //   BoxShadow(
                    //       color: colorPage.black.withOpacity(0.15),
                    //       blurRadius:2,
                    //       spreadRadius: 2,
                    //       offset: Offset(
                    //           0,4
                    //       )
                    //   )
                    // ]
                ),
                child: Center(child: Text("Change Password",
                  style: TextStyle(
                      color: colorPage.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: w*0.038
                  ),
                )),
              ),
            ),
          ],

        ),
      ),
    );
  }
}
