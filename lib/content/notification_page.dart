import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/color_page.dart';
import 'package:hotel_booking/content/kezia_profile.dart';
import 'package:hotel_booking/image_page.dart';

import '../main.dart';

class notificationPage extends StatefulWidget {
  const notificationPage({super.key});

  @override
  State<notificationPage> createState() => _notificationPageState();
}

class _notificationPageState extends State<notificationPage> {
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
          "Notification",
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: height*0.35,
              // color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("General Notification",style: TextStyle(
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
                              left: toggle ? w * 0.05 : w * 0.0,
                              right: toggle ? w * 0.0 : w * 0.05,
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
                      Text("Sound",style: TextStyle(
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
                              left: toggle1 ? w * 0.05: w * 0.0,
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
                      Text("Vibrate",style: TextStyle(
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
                              left: toggle2 ? w * 0.05 : w * 0.0,
                              right: toggle2 ? w * 0.0 : w * 0.05,
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
                      Text("App updates",style: TextStyle(
                          fontSize: w*0.04
                      ),),
                      Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              toggle3 = !toggle3;
                              setState(() {});
                            },
                            child: Container(
                              height: w * 0.07,
                              width: w * 0.12,
                              decoration: BoxDecoration(
                                color: toggle3 ? Colors.green : Colors.grey[400],
                                borderRadius: BorderRadius.circular(w * 0.05),
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                              duration: Duration(milliseconds: 200),
                              left: toggle3 ? w * 0.05 : w * 0.0,
                              right: toggle3 ? w * 0.0: w * 0.05,
                              top: w*0.005,
                              child: InkWell(
                                onTap: () {
                                  toggle3 = !toggle3;
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
                      Text("New Service Available",style: TextStyle(
                          fontSize: w*0.04
                      ),),
                      Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              toggle4 = !toggle4;
                              setState(() {});
                            },
                            child: Container(
                              height: w * 0.07,
                              width: w * 0.12,
                              decoration: BoxDecoration(
                                color: toggle4 ? Colors.green : Colors.grey[400],
                                borderRadius: BorderRadius.circular(w * 0.05),
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                              duration: Duration(milliseconds: 200),
                              left: toggle4 ? w * 0.05 : w * 0.0,
                              right: toggle4 ? w * 0.0 : w * 0.05,
                              top: w*0.005,
                              child: InkWell(
                                onTap: () {
                                  toggle4 = !toggle4;
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
                      Text("New tips available",style: TextStyle(
                          fontSize: w*0.04
                      ),),
                      Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              toggle5 = !toggle5;
                              setState(() {});
                            },
                            child: Container(
                              height: w * 0.07,
                              width: w * 0.12,
                              decoration: BoxDecoration(
                                color: toggle5 ? Colors.green : Colors.grey[400],
                                borderRadius: BorderRadius.circular(w * 0.05),
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                              duration: Duration(milliseconds: 200),
                              left: toggle5 ? w * 0.05 : w * 0.0,
                              right: toggle5 ? w * 0.0 : w * 0.05,
                              top: w*0.005,
                              child: InkWell(
                                onTap: () {
                                  toggle5 = !toggle5;
                                  setState(() {});
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 200),
                                  curve: Curves.easeIn,
                                  height: w * 0.06,
                                  width: w * 0.6,
                                  decoration: BoxDecoration(
                                      color: Colors.white, shape: BoxShape.circle),
                                ),
                              ))
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => keziaProfile(),));
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
                child: Center(child: Text("Update",
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
    );
  }
}
