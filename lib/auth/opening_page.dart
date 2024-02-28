import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hotel_booking/auth/account_page.dart';
import 'package:hotel_booking/auth/login_page.dart';
import 'package:hotel_booking/auth/profile_page.dart';
import 'package:hotel_booking/color_page.dart';
import 'package:hotel_booking/content/bottom_navigation.dart';
import 'package:hotel_booking/content/home_page.dart';
import 'package:hotel_booking/image_page.dart';
import 'package:hotel_booking/main.dart';

class openingPage extends StatefulWidget {
  const openingPage({super.key});

  @override
  State<openingPage> createState() => _openingPageState();
}

class _openingPageState extends State<openingPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: height*0.9,
            width: w*1,
            child: Padding(
              padding:  EdgeInsets.all(w*0.03),
              child: Column(
               // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: w*0.05,),
                  Center(
                    child: Text("Let’s you in",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: w*0.13
                    ),),
                  ),
                  SizedBox(height: w*0.05,),
                  Column(
                    children: [
                      Center(
                        child: Container(
                            height: w*0.13,
                            width: w*0.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(w*0.03,),
                              border: Border.all(),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: w*0.04,),
                                Container(
                                  height: w*0.10,
                                  width: w*0.10,
                                  child: SvgPicture.asset(imagePage.facebook),
                                ),
                                SizedBox(width: w*0.04,),
                                Text("Continue with Facebook")
                              ],
                            )
                        ),
                      ),
                      SizedBox(height: w*0.05,),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            signInWithGoogle(context);
                          },
                          child: Container(
                            height: w*0.13,
                            width: w*0.8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: w*0.04,),
                                Container(
                                  height: w*0.10,
                                  width: w*0.10,
                                  child: SvgPicture.asset(imagePage.google),
                                ),
                                SizedBox(width: w*0.04,),
                                Text("Continue with Google")
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(w*0.03,),
                              border: Border.all(),
                              //  color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: w*0.05,),
                      Center(
                        child: Container(
                          height: w*0.13,
                          width: w*0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: w*0.04,),
                              Container(
                                height: w*0.10,
                                width: w*0.10,
                                child: SvgPicture.asset(imagePage.apple),
                              ),
                              SizedBox(width: w*0.04,),
                              Text("Continue with Apple")
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(w*0.03,),
                            //color: Colors.red,
                            border: Border.all(),
                          ),
                        ),
                      ),
                      SizedBox(height: w*0.03,),
                    ],
                  ),
                  Container(
                    height: w*0.15,
                    width: w*1,
                   // color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Divider(
                            height: w*0.4,
                            indent: w*0.01,
                            endIndent: w*0.04,
                            thickness: w*0.003,
                            color: colorPage.black.withOpacity(0.25),
                          ),
                        ),
                        Text("or"),
                        Expanded(
                          child: Divider(
                            height: w*0.4,
                            indent: w*0.03,
                            endIndent: w*0.01,
                            thickness: w*0.003,
                            color: colorPage.black.withOpacity(0.25),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: w*0.001,),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder:(context) => loginPage(),));
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
                        child: Center(child: Text("Sign in with password",
                          style: TextStyle(
                            color: colorPage.secondaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: w*0.038
                          ),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(height: w*0.05,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don’t have an account?"),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => profilePage(googleSignIn: false),));
                        },
                        child: Text(" Sign up",
                        style: TextStyle(
                          color: colorPage.primaryColor
                        ),),
                      ),
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
