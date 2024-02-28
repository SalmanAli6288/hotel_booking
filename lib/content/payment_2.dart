import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/color_page.dart';
import 'package:hotel_booking/content/payment_of_hotel.dart';
import 'package:hotel_booking/image_page.dart';

import '../main.dart';

class payment2Page extends StatefulWidget {
  const payment2Page({super.key,required this.card});
  final String card;

  @override
  State<payment2Page> createState() => _payment2PageState();
}

class _payment2PageState extends State<payment2Page> {
  String? button;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPage.secondaryColor,
        leading:Container(
          height: w*0.5,
          width: w*0.5,
          padding: EdgeInsets.all(w*0.02),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
              child: SvgPicture.asset(imagePage.leftarrow)),
        ) ,
        title: Text("Payment",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: w*0.06,
              color: colorPage.black
          ),),
        elevation: 0,
      ),

      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          height: height*0.8,
          width: w*1,
         // color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(w*0.045),
                    height: w*0.25,
                    width: w*1,
                    color: colorPage.secondaryColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Payment Method",style: TextStyle(fontSize: w*0.04,fontWeight: FontWeight.w700),),
                        Text("Add New Card",style: TextStyle(fontSize: w*0.04,fontWeight: FontWeight.w700,color: colorPage.primaryColor),)
                      ],
                    ),
                  ),
                  Container(
                    height: w*1.05,
                    width: w*1,
                    color: colorPage.lightGreen,
                    child: Padding(
                      padding: EdgeInsets.all(w*0.03),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: w*0.17,
                            width: w*0.84,
                            decoration: BoxDecoration(
                                color: colorPage.secondaryColor,
                                borderRadius: BorderRadius.circular(w*0.03)
                            ),
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: w*0.03,),
                                    Container(
                                        height: w*0.09,
                                        width: w*0.09,
                                        child: SvgPicture.asset(imagePage.paypal)),
                                    SizedBox(width: w*0.02,),
                                    Text("Paypal",style: TextStyle(
                                        fontWeight: FontWeight.w600
                                    ),),
                                  ],
                                ),
                                Radio(
                                  activeColor: colorPage.primaryColor,
                                  fillColor: MaterialStatePropertyAll(colorPage.primaryColor),
                                  value: "p",
                                  groupValue: button,
                                  onChanged: (value) {
                                    setState(() {
                                      button=value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: w*0.05,),
                          Container(
                            height: w*0.17,
                            width: w*0.84,
                            decoration: BoxDecoration(
                                color: colorPage.secondaryColor,
                                borderRadius: BorderRadius.circular(w*0.03)
                            ),
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: w*0.03,),
                                    Container(
                                        height: w*0.09,
                                        width: w*0.09,
                                        child: SvgPicture.asset(imagePage.google)),
                                    SizedBox(width: w*0.02,),
                                    Text("Google Pay",style: TextStyle(
                                        fontWeight: FontWeight.w600
                                    ),),
                                  ],
                                ),

                                Radio(
                                  activeColor: colorPage.primaryColor,
                                  fillColor: MaterialStatePropertyAll(colorPage.primaryColor),
                                  value: "G",
                                  groupValue: button,
                                  onChanged: (value) {
                                    setState(() {
                                      button=value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: w*0.05,),
                          Container(
                            height: w*0.17,
                            width: w*0.84,
                            decoration: BoxDecoration(
                                color: colorPage.secondaryColor,
                                borderRadius: BorderRadius.circular(w*0.03)
                            ),
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: w*0.03,),
                                    Container(
                                        height: w*0.09,
                                        width: w*0.09,
                                        child: SvgPicture.asset(imagePage.apple)),
                                    SizedBox(width: w*0.02,),
                                    Text("Apple Pay",style: TextStyle(
                                        fontWeight: FontWeight.w600
                                    ),),
                                  ],
                                ),
                                Radio(
                                  activeColor: colorPage.primaryColor,
                                  fillColor: MaterialStatePropertyAll(colorPage.primaryColor),
                                  value: "A",
                                  groupValue: button,
                                  onChanged: (value) {
                                    setState(() {
                                      button=value!;
                                    });
                                  },
                                ),

                              ],
                            ),
                          ),
                          SizedBox(height: w*0.05,),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: w*0.06,),
                              Text("Pay with Debit/Credit Card",style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: w*0.04
                              ),),
                            ],
                          ),
                          SizedBox(height: w*0.07,),
                          Container(
                            height: w*0.17,
                            width: w*0.84,
                            decoration: BoxDecoration(
                                color: colorPage.secondaryColor,
                                borderRadius: BorderRadius.circular(w*0.03)
                            ),
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: w*0.03,),
                                    Container(
                                        height: w*0.09,
                                        width: w*0.09,
                                        child: SvgPicture.asset(imagePage.mastercard)),
                                    SizedBox(width: w*0.02,),
                                    Text("${widget.card}",style: TextStyle(
                                        fontWeight: FontWeight.w600
                                    ),),
                                  ],
                                ),
                                Radio(
                                  activeColor: colorPage.primaryColor,
                                  fillColor: MaterialStatePropertyAll(colorPage.primaryColor),
                                  value: "g",
                                  groupValue: button,
                                  onChanged: (value) {
                                    setState(() {
                                      button=value!;
                                    });
                                  },
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => paymentHotel(),));
                },
                child: Container(
                  height: w*0.17,
                  width: w*0.8,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(w*0.08),
                      boxShadow: [
                        BoxShadow(
                          color: colorPage.black.withOpacity(0.15),
                          offset: Offset(0, 4),
                          spreadRadius: 2,
                          blurRadius: 2,
                        )
                      ]
                  ),
                  child: Center(child: Text("Continue",
                    style: TextStyle(color: colorPage.secondaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: w*0.04),)),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
