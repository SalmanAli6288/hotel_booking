import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hotel_booking/auth/login_page.dart';
import 'package:hotel_booking/auth/opening_page.dart';
import 'package:hotel_booking/color_page.dart';
import 'package:hotel_booking/content/cancel_hotel_booking.dart';
import 'package:hotel_booking/content/kezia_edit_profile.dart';
import 'package:hotel_booking/content/my_booking1.dart';
import 'package:hotel_booking/content/name_of_reservation.dart';
import 'package:hotel_booking/content/newpassword_page.dart';
import 'package:hotel_booking/content/notification_page.dart';
import 'package:hotel_booking/content/payment_method.dart';
import 'package:hotel_booking/content/payment_of_hotel.dart';
import 'package:hotel_booking/content/security_page.dart';
import 'package:hotel_booking/image_page.dart';
import 'package:image_picker/image_picker.dart';

import '../main.dart';

class keziaProfile extends StatefulWidget {
  const keziaProfile({super.key});

  @override
  State<keziaProfile> createState() => _keziaProfileState();
}

class _keziaProfileState extends State<keziaProfile> {

  var file;
  pickFile(imageSource) async {
   final imageFile=await ImagePicker.platform.pickImage(source: imageSource);
   file=File(imageFile!.path);
   if(mounted){
     setState(() {
       file=File(imageFile!.path);
     });
      }
  }
  bool toggle = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPage.secondaryColor,
        leading: Container(
          height: w * 0.5,
          width: w * 0.5,
          padding: EdgeInsets.all(w * 0.02),
          child: SvgPicture.asset(imagePage.bolusmall),
        ),
        title: Text(
          "Profile",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: w * 0.06,
              color: colorPage.black),
        ),

        elevation: 0,
      ),
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: w * 0.4,
              ),
              Stack(
                children: [
                  file!=null?
                  CircleAvatar(
                    backgroundImage: FileImage(file),
                  radius: w*0.15,)
                      : CircleAvatar(
                    backgroundImage: NetworkImage(currentUserImage),
                    radius: w*0.15,
                  ),
                  Positioned(
                    bottom: w*0,
                      right: w*0,
                      child: InkWell(
                        onTap: () {
                          showDialog(context: context,
                              builder: (context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(w*0.06)
                                  ),
                                  content: Container(
                                     height: w*0.3,
                                     width: w*1,
                                     decoration: BoxDecoration(
                                     //color: colorPage.red,
                                       borderRadius: BorderRadius.circular(w*0.03),),
                                    child:Column(
                                      children: [
                                        Text("Choose an image from..?",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700
                                        ),),
                                        SizedBox(height: w*0.08,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                pickFile(ImageSource.camera);
                                                Navigator.pop(context);

                                              },
                                              child: Container(
                                                height: w*0.15,
                                                width: w*0.15,
                                                child: Icon(Icons.camera_alt_outlined,
                                                  size: w*0.075,
                                                  color: colorPage.secondaryColor,),
                                                decoration: BoxDecoration(
                                                    color: colorPage.primaryColor,
                                                    borderRadius: BorderRadius.circular(w*0.03)
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                pickFile(ImageSource.gallery);
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: w*0.15,
                                                width: w*0.15,
                                                child: Icon(Icons.photo,
                                                  size: w*0.075,
                                                  color: colorPage.secondaryColor,),
                                                decoration: BoxDecoration(
                                                    color: colorPage.primaryColor,
                                                    borderRadius: BorderRadius.circular(w*0.03)
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                ),
                                );
                              },);
                        },
                          child: Stack(
                            children: [
                              Container(
                                height: w*0.08,
                                width: w*0.08,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topLeft:Radius.circular(w*0.03),topRight:Radius.circular(w*0.03),bottomRight: Radius.circular(w*0.03)),
                                  color: colorPage.primaryColor,
                                ),

                              ),
                              Positioned(
                                  top: w*0.015,
                                  left: w*0.01,
                                  child: Icon(Icons.edit,color: colorPage.secondaryColor,)),
                            ],
                          )
                      ))
                ],
              ),
            ],
          ),
          Text(
             "${currentUserName}",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: w * 0.05),
          ),
          SizedBox(
            height: w * 0.02,
          ),
          Text(
            "${currentUserEmail}",
            style: TextStyle(fontSize: w * 0.032),
          ),
          SizedBox(
            height: w * 0.08,
          ),
          Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => editProfile(name: currentUserName, email: currentUserEmail,),));
                },
                child: ListTile(
                  leading: SvgPicture.asset(imagePage.person),
                  title: Text("Edit Profile"),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => paymentMethod(),));
                },
                child: ListTile(
                  leading: SvgPicture.asset(imagePage.wallet),
                  title: Text("Payment"),
                ),
              ),
              InkWell(onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => notificationPage(),
                    ));
              },
                child: ListTile(
                  leading: SvgPicture.asset(imagePage.notificationicon),
                  title: Text("Notification"),
                ),
              ),
              InkWell(
                onTap: () {Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => securityPage(),
                    ));
                },
                child: ListTile(
                  leading: SvgPicture.asset(imagePage.security),
                  title: Text("Security"),
                ),
              ),
              ListTile(
                leading: SvgPicture.asset(imagePage.help),
                title: Text("Help"),
              ),
              ListTile(
                leading: SvgPicture.asset(imagePage.eye),
                title: Text("Dark Theme"),
                trailing: Stack(
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
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                      showDragHandle: true,
                      context: context,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(w*0.09),
                              topRight: Radius.circular(w*0.09))
                      ),
                      builder: (context){
                        return Container(
                          height: w*0.6,
                          child: Column(
                            children: [

                              Text("Logout Profile",
                                style: TextStyle(
                                    fontSize: w*0.05,
                                    fontWeight: FontWeight.w600,
                                    color: colorPage.red
                                ),),
                              SizedBox(height: w*0.03,),
                              Divider(
                                endIndent: w*0.08,
                                indent: w*0.08,
                                thickness: w*0.003,
                              ),
                              Text("Are you sure you want to cancel your\nhotel bookings?",textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: w*0.04
                                ),),
                              // SizedBox(height: w*0.02,),
                              // Text("Only 80% of the money you can refund from your payment\naccording to our policy",textAlign: TextAlign.center,
                              //   style: TextStyle(
                              //       fontSize: w*0.025
                              //   ),),
                              SizedBox(height: w*0.04,),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      GoogleSignIn().signOut();
                                      FirebaseAuth.instance.signOut();
                                     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => openingPage( ),), (route) => false);
                                    },
                                    child: Container(
                                      height: w*0.12,
                                      width: w*0.6,
                                      decoration: BoxDecoration(
                                          color: colorPage.primaryColor,
                                          borderRadius: BorderRadius.circular(w*0.06),
                                          // boxShadow: [
                                          //   BoxShadow(
                                          //     color: colorPage.black.withOpacity(0.15),
                                          //     blurRadius: 4,
                                          //     spreadRadius: 2,
                                          //     offset: Offset(0, 4),
                                          //   )
                                          // ]
                                      ),

                                      child: Center(child: Text("Yes, logout",style: TextStyle(
                                          color: colorPage.secondaryColor
                                      ),)),
                                    ),
                                  ),
                                  SizedBox(height: w*0.03,),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: w*0.12,
                                      width: w*0.6,
                                      decoration: BoxDecoration(
                                          color: colorPage.lightGreen,
                                          borderRadius: BorderRadius.circular(w*0.06),
                                          // boxShadow: [
                                          //   BoxShadow(
                                          //     color: colorPage.black.withOpacity(0.15),
                                          //     blurRadius: 4,
                                          //     spreadRadius: 2,
                                          //     offset: Offset(0, 4),
                                          //   )
                                          // ]
                                      ),
                                      child: Center(child: Text("Cancel",style: TextStyle(
                                          color: colorPage.primaryColor
                                      ),)),
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        );
                      });
                },
                child: ListTile(
                  leading: SvgPicture.asset(imagePage.logout),
                  title: Text(
                    "Logout",
                    style: TextStyle(color: colorPage.red),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
