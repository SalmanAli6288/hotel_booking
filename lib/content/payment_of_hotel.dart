import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/color_page.dart';
import 'package:hotel_booking/content/payment_2.dart';
import 'package:hotel_booking/content/ticket_page.dart';
import 'package:hotel_booking/image_page.dart';
import 'package:lottie/lottie.dart';

import '../main.dart';

class paymentHotel extends StatefulWidget {
  const paymentHotel({super.key});

  @override
  State<paymentHotel> createState() => _paymentHotelState();
}

class _paymentHotelState extends State<paymentHotel> {
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
              Navigator.pop(context);
            },
              child: SvgPicture.asset(imagePage.leftarrow)),
        ),
        title: Text(
          "payment",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: w * 0.06,
              color: colorPage.black),
        ),
        elevation: 0,
      ),
      backgroundColor: colorPage.lightGreen,
      body: Padding(
        padding: EdgeInsets.all(w * 0.04),
        child: Column(
          children: [
            Container(
              height: w * 0.4,
              width: w * 1,
              decoration: BoxDecoration(
                  color: colorPage.secondaryColor,
                  borderRadius: BorderRadius.circular(w * 0.03)),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: w * 0.032),
                    height: w * 0.3,
                    width: w * 0.3,
                    decoration: BoxDecoration(
                        color: colorPage.darkGrey,
                        borderRadius: BorderRadius.circular(w * 0.03),
                        image: DecorationImage(
                            image: AssetImage(imagePage.room1),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    width: w * 0.03,
                  ),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Intercontinental Hotel",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: w * 0.035),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Lagos, Nigeria"),
                              SizedBox(
                                height: w * 0.03,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(imagePage.star),
                                  Text(
                                    "5.0",
                                    style: TextStyle(
                                        color: colorPage.primaryColor),
                                  ),
                                  Text("(4,345 reviews)")
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: w * 0.03,
                      ),
                      Column(
                        // crossAxisAlignment: CrossAxisAlignment.,
                        children: [
                          SizedBox(
                            height: w * 0.07,
                          ),
                          Text(
                            "\$205",
                            style: TextStyle(color: colorPage.primaryColor),
                          ),
                          Text("/night")
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: w * 0.03,
            ),
            Container(
              padding: EdgeInsets.all(w * 0.05),
              height: w * 0.45,
              width: w * 1,
              decoration: BoxDecoration(
                  color: colorPage.secondaryColor,
                  borderRadius: BorderRadius.circular(w * 0.03)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Check in"),
                      Text(
                        "December 16, 2024",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Check out"),
                      Text(
                        "December 16, 2024",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Guest"),
                      Text(
                        "3",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: w * 0.03,
            ),
            Container(
              padding: EdgeInsets.all(w * 0.05),
              height: w * 0.45,
              width: w * 1,
              decoration: BoxDecoration(
                  color: colorPage.secondaryColor,
                  borderRadius: BorderRadius.circular(w * 0.03)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("5 Nights"),
                      Text(
                        "\$760.00",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Taxes & Fees (10%)"),
                      Text(
                        "\$760.00",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total"),
                      Text(
                        "\$760.00",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: w * 0.05,
            ),
            Container(
              padding: EdgeInsets.all(w*0.03),
              height: w * 0.18,
              width: w * 1,
              decoration: BoxDecoration(
                color: colorPage.secondaryColor,
                borderRadius: BorderRadius.circular(w * 0.03),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: w * 0.1,
                          width: w * 0.1,
                          child: SvgPicture.asset(imagePage.mastercard)),
                      SizedBox(width: w*0.03,),
                      Text(
                        "**** **** **** ****4679",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => payment2Page(card: ""),));
                    },
                      child: Text("Change", style: TextStyle(color: colorPage.primaryColor),)),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: w*0.3,
        width: w*1,
        color: colorPage.secondaryColor,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: w*0.07,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(w*0.06)
                            ),
                            content: Container(
                              height: w*1.1,
                              width: w*1,
                              decoration: BoxDecoration(
                                //color: colorPage.red,
                                borderRadius: BorderRadius.circular(w*0.03)
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: w*0.5,
                                    width: w*1,
                                    decoration: BoxDecoration(
                                     // color: colorPage.red
                                    ),
                                    child: Lottie.asset(imagePage.verified,),
                                  ),
                                  SizedBox(height: w*0.03,),
                                  Text("Payment Successfull!",style: TextStyle(
                                    color: colorPage.primaryColor,
                                    fontSize: w*0.05,
                                    fontWeight: FontWeight.w700
                                  ),),

                                  SizedBox(height: w*0.03,),
                                  Text("Successfully made payment and hotel booking",
                                    textAlign:TextAlign.center,
                                      style: TextStyle(
                                        fontSize: w*0.035
                                  ),),
                                  SizedBox(height: w*0.04,),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => ticketPage(),));
                                    },
                                    child: Container(
                                      height: w*0.13,
                                      width: w*0.8,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(w*0.1),
                                          color: colorPage.primaryColor,
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
                                      child: Center(child: Text("View Ticket",
                                        style: TextStyle(
                                            color: colorPage.secondaryColor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: w*0.038
                                        ),
                                      )),
                                    ),
                                  ),
                                  SizedBox(height: w*0.05,),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: w*0.13,
                                      width: w*0.8,
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
                                      child: Center(child: Text("Cancel",
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
                        });
                    setState(() {

                    });
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
                    child: Center(child: Text("Continue",
                      style: TextStyle(
                          color: colorPage.secondaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: w*0.038
                      ),
                    )),
                  ),
                ),
              ],
            )
          ],
        ),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
