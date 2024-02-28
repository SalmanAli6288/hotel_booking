import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/color_page.dart';
import 'package:hotel_booking/content/payment_of_hotel.dart';
import 'package:hotel_booking/image_page.dart';

import '../main.dart';

class ticketPage extends StatefulWidget {
  const ticketPage({super.key});

  @override
  State<ticketPage> createState() => _ticketPageState();
}

class _ticketPageState extends State<ticketPage> {
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
              Navigator.pop(context,MaterialPageRoute(builder: (context) => paymentHotel(),));
            },
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                  child: SvgPicture.asset(imagePage.leftarrow))),
        ),
        title: Text("Ticket",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: w * 0.06,
              color: colorPage.black),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(w*0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: w*0.05,),
              Stack(
                  children: [

                    SvgPicture.asset(imagePage.ticketOutline),
                    Column(
                      children: [
                        SizedBox(height: w*0.08,),
                        Center(child: Text("Intercontinental Hotel",style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: w*0.045
                        ),)),
                        SizedBox(height: w*0.05,),
                        Container(
                          height: w*0.45,
                          width: w*0.45,
                          // color: colorPage.red,
                          child: Image(image: AssetImage(imagePage.qrcode)),
                        ),
                      ],
                    ),
                    Positioned(
                      top: w*0.9,
                      left: w*0.095,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Name",style: TextStyle(color: colorPage.darkGrey),),
                                Text("Kezia Williams",style: TextStyle(fontWeight: FontWeight.w700),),
                                SizedBox(height: w*0.055,),
                                Text("Check in",style: TextStyle(color: colorPage.darkGrey),),
                                Text("Dec 16, 2024",style: TextStyle(fontWeight: FontWeight.w700),),
                                SizedBox(height: w*0.04,),
                                Text("Hotel",style: TextStyle(color: colorPage.darkGrey),),
                                Text("Intercontinental Hotel",style: TextStyle(fontWeight: FontWeight.w700),),

                              ],
                            ),
                            SizedBox(width: w*0.05,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Phone number",style: TextStyle(color: colorPage.darkGrey),),
                                Text("+234 702 2347 642",style: TextStyle(fontWeight: FontWeight.w700),),
                                SizedBox(height: w*0.055,),
                                Text("Check out",style: TextStyle(color: colorPage.darkGrey),),
                                Text("Dec 16, 2024",style: TextStyle(fontWeight: FontWeight.w700),),
                                SizedBox(height: w*0.04,),
                                Text("Guest",style: TextStyle(color: colorPage.darkGrey),),
                                Text("3",style: TextStyle(fontWeight: FontWeight.w700),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  ),
              SizedBox(height: w*0.05,),
              Container(
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
                child: Center(child: Text("Download Ticket",
                  style: TextStyle(
                      color: colorPage.secondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: w*0.038
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
