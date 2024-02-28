import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/color_page.dart';
import 'package:hotel_booking/content/new_card.dart';
import 'package:hotel_booking/image_page.dart';

import '../main.dart';

class paymentMethod extends StatefulWidget {
  const paymentMethod({super.key});

  @override
  State<paymentMethod> createState() => _paymentMethodState();
}

class _paymentMethodState extends State<paymentMethod> {
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
backgroundColor: colorPage.secondaryColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: height*0.9,
          width: w*1,
         // color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //
              Column(
                children: [
                  SizedBox(height: w*0.05,),
                  Container(
                    padding: EdgeInsets.all(w*0.045),
                    height: w*0.15,
                    width: w*1,
                    color: colorPage.secondaryColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Payment Method",style: TextStyle(fontSize: w*0.04,fontWeight: FontWeight.w700),),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => newCard(),));
                          },
                            child: Text("Add New Card",style: TextStyle(fontSize: w*0.04,fontWeight: FontWeight.w700,color: colorPage.primaryColor),))
                      ],
                    ),
                  ),
                  Container(
                    height: w*0.75,
                    width: w*1,
                    color: colorPage.lightGreen,
                    child: Padding(
                      padding: EdgeInsets.all(w*0.03),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please add new card")));
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
            ],
          ),
        ),
      ),
    );
  }
}
