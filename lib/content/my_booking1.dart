
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/color_page.dart';
import 'package:hotel_booking/content/cancel_hotel_booking.dart';
import 'package:hotel_booking/content/search_page.dart';
import 'package:hotel_booking/content/ticket_page.dart';
import 'package:hotel_booking/image_page.dart';

import '../main.dart';

class myBooking extends StatefulWidget {
  const myBooking({super.key});

  @override
  State<myBooking> createState() => _myBookingState();
}

class _myBookingState extends State<myBooking> {
  List category=["ongoing","completed","canceled"];
  bool? select;
  int selectedindex=0;
  List selectHotel=[];
  List selectHotel1=[];
  List room=[
    {
      "image":imagePage.room1,
      "text1":"Intercontinental Hotel",
      "text2":"Lagos, Nigeria",
      "text3":"\$205 ",
      "text4":"/night ",
    },
    {
      "image":imagePage.room2,
      "text1":"Nevada Hotel",
      "text2":"Lagos, Nigeria",
      "text3":"\$107 ",
      "text4":"/night ",
    },
    {
      "image":imagePage.room3,
      "text1":"Oriental Hotel",
      "text2":"Lagos, Nigeria",
      "text3":"\$190 ",
      "text4":"/night ",
    },
    {
      "image":imagePage.room4,
      "text1":"Federal Palace Hotel",
      "text2":"Lagos, Nigeria",
      "text3":"\$200 ",
      "text4":"/night ",
    },
    {
      "image":imagePage.room5,
      "text1":"Presidential Hotel",
      "text2":"Lagos, Nigeria",
      "text3":"\$160 ",
      "text4":"/night ",
    }];
  int selectindex=0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: colorPage.secondaryColor,
          leading:Container(
            height: w*0.5,
            width: w*0.5,
            padding: EdgeInsets.all(w*0.02),
            child: SvgPicture.asset(imagePage.bolusmall),
          ) ,
          title: Text("My Booking",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: w*0.06,
                color: colorPage.black
            ),),
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => searchPage(),));
              },
              child: Container(
                  height: w*0.1,
                  width: w*0.1,
                  //color: Colors.red,
                  child: SvgPicture.asset(imagePage.searchicon,color: colorPage.black,)),
            ),
            SizedBox(width: w*0.07,)
          ],
          elevation: 0,
        ),
        backgroundColor: colorPage.lightGreen,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: w*0.03,),
            Container(
              margin: EdgeInsets.only(top:w*0.03,bottom: w*0.03),
              height: w*0.12,
              width: w*1,
              decoration: BoxDecoration(
                  color: colorPage.secondaryColor,
              ),
              child: TabBar(
                  labelColor: colorPage.secondaryColor,
                  unselectedLabelColor: colorPage.primaryColor,
                  padding: EdgeInsets.all(w*0.025),
                  indicator: BoxDecoration(
                    border: Border.all(color: colorPage.primaryColor),
                      color: colorPage.primaryColor,
                      borderRadius: BorderRadius.circular(w*0.06)
                  ),
                  tabs:[
                    Tab(
                      text: "Ongoing",
                    ),
                    Tab(
                      text: "Completed",
                    ),
                    Tab(
                      text: "Canceled",
                    ),

                  ]),
            ),
            Expanded(
              child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.all(w*0.04
                        ),
                        child: Column(
                          children:[
                            ListView.separated(
                              itemCount: room.length,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.all(w*0.04),
                                  height: w*0.55,
                                  width: w*0.9,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(w*0.03),
                                    color: colorPage.secondaryColor,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                           // margin: EdgeInsets.only(left: w*0.03,top: w*0.05),
                                            height: w*0.28,
                                            width: w*0.28,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(image: AssetImage(room[index]["image"]),fit: BoxFit.fill),
                                                borderRadius: BorderRadius.circular(w*0.045)
                                            ),
                                          ),
                                          SizedBox(width: w*0.05,),
                                          Column(
                                           // mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: w*0.05,),
                                              Text(room[index]["text1"],style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: w*0.04
                                              ),),
                                              Text(room[index]["text2"]),
                                              SizedBox(height: w*0.05,),
                                              Container(
                                                height: w*0.07,
                                                width: w*0.2,
                                                decoration: BoxDecoration(
                                                  color: colorPage.lightGreen,
                                                  borderRadius: BorderRadius.circular(w*0.03)
                                                ),
                                                child: Center(child: Text("Paid",
                                                style: TextStyle(
                                                  fontSize: w*0.03,
                                                  color: colorPage.primaryColor
                                                ),)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: w*0.05,),
                                      Divider(
                                        height: w*0.03,
                                        color: colorPage.black.withOpacity(0.25),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
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

                                                          Text("Cancel Booking",
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
                                                           SizedBox(height: w*0.02,),
                                                          Text("Only 80% of the money you can refund from your payment\naccording to our policy",textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: w*0.025
                                                          ),),
                                                          SizedBox(height: w*0.04,),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                           // crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  Navigator.pop(context);
                                                                },
                                                                child: Container(
                                                                  height: w*0.12,
                                                                  width: w*0.4,
                                                                  decoration: BoxDecoration(
                                                                      color: colorPage.lightGreen,
                                                                      borderRadius: BorderRadius.circular(w*0.06),
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          color: colorPage.black.withOpacity(0.15),
                                                                          blurRadius: 4,
                                                                          spreadRadius: 2,
                                                                          offset: Offset(0, 4),
                                                                        )
                                                                      ]
                                                                  ),
                                                                  child: Center(child: Text("Cancel",style: TextStyle(
                                                                    color: colorPage.primaryColor
                                                                  ),)),
                                                                ),
                                                              ),
                                                              SizedBox(width: w*0.03,),
                                                              InkWell(
                                                                onTap: () {
                                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => cancelBooking(),));
                                                                },
                                                                child: Container(
                                                                  height: w*0.12,
                                                                  width: w*0.4,
                                                                  decoration: BoxDecoration(
                                                                      color: colorPage.primaryColor,
                                                                    borderRadius: BorderRadius.circular(w*0.06),
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: colorPage.black.withOpacity(0.15),
                                                                        blurRadius: 4,
                                                                        spreadRadius: 2,
                                                                        offset: Offset(0, 4),
                                                                      )
                                                                    ]
                                                                  ),

                                                                  child: Center(child: Text("Yes, continue",style: TextStyle(
                                                                    color: colorPage.secondaryColor
                                                                  ),)),
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Container(
                                              height: w*0.08,
                                              width: w*0.3,
                                              decoration: BoxDecoration(
                                                color: selectHotel.contains(index)?colorPage.primaryColor:colorPage.secondaryColor,
                                                  border: Border.all(color: colorPage.primaryColor),
                                                borderRadius: BorderRadius.circular(w*0.06)
                                              ),
                                              child: Center(child: Text("Cancel Booking",
                                              style: TextStyle(
                                                fontSize: w*0.035,
                                                color: selectHotel.contains(index)?colorPage.secondaryColor:colorPage.primaryColor
                                              ),)),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => ticketPage(),));
                                            },
                                            child: Container(
                                              height: w*0.08,
                                              width: w*0.3,
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: colorPage.primaryColor),
                                                  color: selectHotel1.contains(index)?colorPage.secondaryColor:colorPage.primaryColor,
                                                //color: Colors.red,
                                                borderRadius: BorderRadius.circular(w*0.06)
                                              ),
                                              child: Center(child: Text("View Ticket",
                                              style: TextStyle(
                                                fontSize: w*0.035,
                                                color: selectHotel1.contains(index)?colorPage.primaryColor:colorPage.secondaryColor
                                              ),)),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),

                                );
                              }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: w*0.03,); },
                            ),
                          ]
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.all(w*0.04
                        ),
                        child: Column(
                            children:[
                              ListView.separated(
                                itemCount: room.length,
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.all(w*0.04),
                                    height: w*0.55,
                                    width: w*0.9,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(w*0.03),
                                      color: colorPage.secondaryColor,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          //mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              // margin: EdgeInsets.only(left: w*0.03,top: w*0.05),
                                              height: w*0.28,
                                              width: w*0.28,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(image: AssetImage(room[index]["image"]),fit: BoxFit.fill),
                                                  borderRadius: BorderRadius.circular(w*0.045)
                                              ),
                                            ),
                                            SizedBox(width: w*0.05,),
                                            Column(
                                              // mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(height: w*0.05,),
                                                Text(room[index]["text1"]),
                                                Text(room[index]["text2"]),
                                                SizedBox(height: w*0.05,),
                                                Container(
                                                  height: w*0.07,
                                                  width: w*0.2,
                                                  decoration: BoxDecoration(
                                                      color: colorPage.lightGreen,
                                                      borderRadius: BorderRadius.circular(w*0.03)
                                                  ),
                                                  child: Center(child: Text("completed",
                                                    style: TextStyle(
                                                        fontSize: w*0.03,
                                                        color: colorPage.primaryColor
                                                    ),)),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: w*0.05,),
                                        Divider(
                                          height: w*0.03,
                                          color: colorPage.black.withOpacity(0.25),
                                        ),
                                       SizedBox(height: w*0.02,),
                                       Container(
                                         height: w*0.08,
                                         width: w*0.9,
                                         decoration: BoxDecoration(
                                             color: colorPage.lightGreen,
                                           borderRadius: BorderRadius.circular(w*0.02)
                                         ),
                                         child: Row(
                                           children: [
                                             SizedBox(width: w*0.06,),
                                             Container(
                                               height: w*0.05,
                                                 width: w*0.05,
                                                 //color: Colors.red,
                                                 child: SvgPicture.asset(imagePage.tick)),
                                             SizedBox(width: w*0.02,),
                                             Text("yay. you have completed it!")
                                           ],
                                         ),

                                       )
                                      ],
                                    ),

                                  );
                                }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: w*0.03,); },
                              ),
                            ]
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.all(w*0.04
                        ),
                        child: Column(
                            children:[
                              ListView.separated(
                                itemCount: room.length,
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.all(w*0.04),
                                    height: w*0.55,
                                    width: w*0.9,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(w*0.03),
                                      color: colorPage.secondaryColor,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          //mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              // margin: EdgeInsets.only(left: w*0.03,top: w*0.05),
                                              height: w*0.28,
                                              width: w*0.28,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(image: AssetImage(room[index]["image"]),fit: BoxFit.fill),
                                                  borderRadius: BorderRadius.circular(w*0.045)
                                              ),
                                            ),
                                            SizedBox(width: w*0.05,),
                                            Column(
                                              // mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(height: w*0.05,),
                                                Text(room[index]["text1"]),
                                                Text(room[index]["text2"]),
                                                SizedBox(height: w*0.05,),
                                                Container(
                                                  height: w*0.07,
                                                  width: w*0.4,
                                                  decoration: BoxDecoration(
                                                      color: colorPage.lightred,
                                                      borderRadius: BorderRadius.circular(w*0.03)
                                                  ),
                                                  child: Center(child: Text("Canceled & Refunded",
                                                    style: TextStyle(
                                                        fontSize: w*0.03,
                                                        color: colorPage.red
                                                    ),)),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: w*0.05,),
                                        Divider(
                                          height: w*0.03,
                                          color: colorPage.black.withOpacity(0.25),
                                        ),
                                      SizedBox(height: w*0.02,),
                                      Container(
                                        height: w*0.08,
                                        width: w*0.9,
                                        decoration: BoxDecoration(
                                            color: colorPage.lightred,
                                            borderRadius: BorderRadius.circular(w*0.02)
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(width: w*0.06,),
                                            Container(
                                                height: w*0.05,
                                                width: w*0.05,
                                                //color: Colors.red,
                                                child: SvgPicture.asset(imagePage.error)),
                                            SizedBox(width: w*0.02,),
                                            Text("You canceled this hotel booking",style: TextStyle(
                                              color: colorPage.red
                                            ),)
                                          ],
                                        ),

                                      ),

                                      ],
                                    ),

                                  );
                                }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: w*0.03,); },
                              ),
                            ]
                        ),
                      ),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
