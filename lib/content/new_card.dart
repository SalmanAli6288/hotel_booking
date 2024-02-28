import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flip_card/controllers/flip_card_controllers.dart';
import 'package:flutter_flip_card/flipcard/flip_card.dart';
import 'package:flutter_flip_card/flipcard/gesture_flip_card.dart';
import 'package:flutter_flip_card/modal/flip_side.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking/color_page.dart';
import 'package:hotel_booking/content/payment_2.dart';
import 'package:hotel_booking/image_page.dart';

import '../main.dart';

class newCard extends StatefulWidget {
  const newCard({super.key});

  @override
  State<newCard> createState() => _newCardState();
}

class _newCardState extends State<newCard> {
  TextEditingController cardnumber=TextEditingController();
  TextEditingController fullname=TextEditingController();
  TextEditingController date=TextEditingController();
  TextEditingController cvv=TextEditingController();
  final formKey=GlobalKey<FormState>();
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
        title: Text("New Card",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: w*0.06,
              color: colorPage.black
          ),),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(w*0.035),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Container(
              height: height*0.86,
              width: w*1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureFlipCard(
                    animationDuration: Duration(milliseconds: 300),
                    axis: FlipAxis.vertical,
                    // controller: cardnumber,
                    enableController: false,
                    frontWidget: Center(
                      child: Container(
                        padding: EdgeInsets.all(w*0.03),
                        width: w*1,
                        height: w*0.6,
                        decoration: BoxDecoration(
                          // gradient: LinearGradient(
                          //   begin: Alignment.topLeft,
                          //   end: Alignment.bottomRight,
                          //   stops: [0.6,0.6,0.6],
                          //   colors: [
                          //     Colors.green.shade600,
                          //   Colors.green.shade400,
                          //     Colors.green.shade200,
                          // ],
                          // ),
                            image: DecorationImage(image: AssetImage(imagePage.card),fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(w*0.03)
                        ),
                        child: Column(
                         // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    //mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Balance",style: GoogleFonts.sourceSans3(color: colorPage.secondaryColor.withOpacity(0.70)),),
                                      SizedBox(height: w*0.02,),
                                      Text("\$1299.15",style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: w*0.06,
                                          color: colorPage.secondaryColor
                                      ),),
                                    ],
                                  ),
                                  Container(
                                    height: w*0.2,
                                      width: w*0.2,
                                    //
                                      //
                                      //
                                      //  color: Colors.red,
                                      child: SvgPicture.asset(imagePage.logomastercard))
                                ],

                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(w*0.05),
                                    child:
                                    Column(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        SizedBox(height: w*0.06,),
                                        Text(cvv.text,style: TextStyle(
                                          color: colorPage.secondaryColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: w*0.05
                                        ),),
                                        SizedBox(height: w*0.02,),
                                        Text(cardnumber.text,style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: w*0.04,
                                          color: colorPage.secondaryColor
                                        ),),
                                      ],
                                    ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ), backWidget: Container(
                    width: w*1,
                    height: w*0.6,
                    decoration: BoxDecoration(
                        // gradient: LinearGradient(
                        //   begin: Alignment.topLeft,
                        //   end: Alignment.bottomLeft,
                        //   stops: [0.4,0.6,0.8],
                        //   colors: [
                        //    colorPage.primaryColor,
                        //    colorPage.primaryColor,
                        //    colorPage.secondaryColor
                        //   ],
                        // ),
                      image: DecorationImage(image: AssetImage(imagePage.card),fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(w*0.03)
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: w*0.05),
                        Container(
                          height: w*0.14,
                          width: w*1,
                          color: colorPage.black,
                        ),
                        SizedBox(height: w*0.05,),
                        Row(
                          children: [
                            Container(
                              height: w*0.11,
                              width: w*0.5,
                              color: colorPage.secondaryColor,
                            ),
                            Container(
                              height: w*0.08,
                              width: w*0.12,
                              color: colorPage.secondaryColor,
                              child: Center(child: Text(cvv.text)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  ),
                 // SizedBox(height: w*0.05,),
                  Column(
                    children: [
                      TextFormField(
                        controller: fullname,
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.sentences,
                        textInputAction: TextInputAction.done,
                        style: TextStyle(
                            fontSize: w*0.045,
                            fontWeight: FontWeight.w500
                        ),
                        decoration: InputDecoration(
                          labelText: "Full Name",
                          fillColor: colorPage.lightgrey,
                          filled: true,
                          labelStyle: TextStyle(
                            fontSize: w*0.045,
                            fontWeight: FontWeight.w400,
                            color: colorPage.black
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: colorPage.darkGrey,
                              ),
                              borderRadius: BorderRadius.circular(w*0.03)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                // color: Colors.blue,
                              ),
                              borderRadius: BorderRadius.circular(w*0.03)

                          ),
                      )
                      ),
                      SizedBox(height: w*0.05,),
                      TextFormField(
                        controller: cardnumber,
                        keyboardType: TextInputType.number,
                        maxLength: 20,
                        textCapitalization: TextCapitalization.sentences,
                        textInputAction: TextInputAction.done,
                        obscureText: true,
                        obscuringCharacter: "*",
                        style: TextStyle(
                            fontSize: w*0.045,
                            fontWeight: FontWeight.w500
                        ),
                        decoration: InputDecoration(
                          counterText: "",
                          labelText: "card number",
                          fillColor: colorPage.lightgrey,
                          filled: true,
                          labelStyle: TextStyle(
                              fontSize: w*0.045,
                              fontWeight: FontWeight.w400,
                              color: colorPage.black
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: colorPage.darkGrey,
                              ),
                              borderRadius: BorderRadius.circular(w*0.03)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                // color: Colors.blue,
                              ),
                              borderRadius: BorderRadius.circular(w*0.03)

                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            cardnumber.text=value;
                          });
                        },
                      ),
                      SizedBox(height: w*0.05,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: w*0.15,
                            width: w*0.45,
                            //color: Colors.black,
                            child: TextFormField(
                              controller: date,
                              keyboardType: TextInputType.number,
                              textCapitalization: TextCapitalization.sentences,
                              textInputAction: TextInputAction.done,
                              style: TextStyle(
                                  fontSize: w*0.045,
                                  fontWeight: FontWeight.w500
                              ),
                              decoration: InputDecoration(
                                labelText: "date",
                                fillColor: colorPage.lightgrey,
                                filled: true,
                                labelStyle: TextStyle(
                                    fontSize: w*0.045,
                                    fontWeight: FontWeight.w400,
                                    color: colorPage.black
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: colorPage.darkGrey,
                                    ),
                                    borderRadius: BorderRadius.circular(w*0.03)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      // color: Colors.blue,
                                    ),
                                    borderRadius: BorderRadius.circular(w*0.03)
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  date.text=value;
                                });
                              },
                            ),
                          ),
                          Container(
                            height: w*0.15,
                            width: w*0.45,
                            // color: Colors.black,
                            child: TextFormField(
                              controller: cvv,
                              maxLength: 3,
                              keyboardType: TextInputType.number,
                              textCapitalization: TextCapitalization.sentences,
                              textInputAction: TextInputAction.done,
                              style: TextStyle(
                                  fontSize: w*0.045,
                                  fontWeight: FontWeight.w500
                              ),
                              decoration: InputDecoration(
                                counterText: "",
                                labelText: "cvv",
                                fillColor: colorPage.lightgrey,
                                filled: true,
                                labelStyle: TextStyle(
                                    fontSize: w*0.045,
                                    fontWeight: FontWeight.w400,
                                    color: colorPage.black
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: colorPage.darkGrey,
                                    ),
                                    borderRadius: BorderRadius.circular(w*0.03)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      // color: Colors.blue,
                                    ),
                                    borderRadius: BorderRadius.circular(w*0.03)
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  cvv.text=value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: w*0.05,),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      if(
                      fullname.text!=""&&
                      cardnumber.text!=""&&
                      date.text!=""&&
                      cvv.text!=""&&
                      formKey.currentState!.validate()
                      ){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => payment2Page(card:cardnumber.text),));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Submitted Successfully")));
                      }else{
                        fullname.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter Name"))):
                        cardnumber.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter card number"))):
                        date.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter date"))):
                        cvv.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter cvv"))):
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter valid Details")));
                      }
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
                      child: Center(child: Text("Add New Card",
                        style: TextStyle(color: colorPage.secondaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: w*0.04),)),

                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
