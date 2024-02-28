import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/color_page.dart';
import 'package:hotel_booking/content/name_of_reservation.dart';
import 'package:hotel_booking/image_page.dart';

import '../main.dart';

class calenderPage extends StatefulWidget {
  const calenderPage({super.key});

  @override
  State<calenderPage> createState() => _calenderPageState();
}

class _calenderPageState extends State<calenderPage> {
  List<DateTime?> date=[];
  int count=1;
  int dfference=0;

  @override
  Widget build(BuildContext context) {
    dfference=date.isEmpty?0:date.last!.difference(date.first!).inDays;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPage.secondaryColor,
        leading:Container(
          height: w*0.5,
          width: w*0.5,
          padding: EdgeInsets.all(w*0.02),
          child: SvgPicture.asset(imagePage.leftarrow),
        ) ,
        title: Text("Select Date",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: w*0.06,
              color: colorPage.black
          ),),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(w*0.04),
          child: Container(
            height: height*0.9,
            width: w*1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: w*0.7,
                  width: w*1,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(w*0.03),
                    color: colorPage.lightGreen,
                  ),
                  child: CalendarDatePicker2(
                      config: CalendarDatePicker2Config(
                        calendarType: CalendarDatePicker2Type.range,
                        selectedDayHighlightColor: colorPage.primaryColor,
                       // currentDate: DateTime(DateTime.december),
                      ),
                      value: date,
                    onValueChanged:(value) {
                      date=value;
                      setState(() {

                      });
                    },

                  ),
                ),
                SizedBox(height: w*0.03,),
                Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Check in",style: TextStyle(fontSize: w*0.045,fontWeight: FontWeight.w700),),
                        SizedBox(height: w*0.03,),
                        Container(
                          height: w*0.13,
                          width: w*0.4,
                          decoration: BoxDecoration(
                              color: colorPage.lightgrey,
                              borderRadius: BorderRadius.circular(w*0.03)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(date.isEmpty ? "" :date[0].toString().substring(0,10)),
                              SvgPicture.asset(imagePage.dob)
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        Container(
                          height: w*0.08,
                            width: w*0.08,
                           // color: Colors.red,
                            child: SvgPicture.asset(imagePage.datearrow)),
                        SizedBox(height: w*0.02,),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Check out",style: TextStyle(fontSize: w*0.045,fontWeight: FontWeight.w700),),
                        SizedBox(height: w*0.03,),
                        Container(
                          height: w*0.13,
                          width: w*0.4,
                          decoration: BoxDecoration(
                              color: colorPage.lightgrey,
                              borderRadius: BorderRadius.circular(w*0.03)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(date.length==1 || date.isEmpty ? "":date[1].toString().substring(0,10)),
                              SvgPicture.asset(imagePage.dob)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: w*0.05,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Guest",style: TextStyle(fontWeight: FontWeight.w700,fontSize: w*0.05),),
                  ],
                ),
                SizedBox(height: w*0.05,),
                Container(
                  height: w*0.18,
                  width: w*0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(w*0.03),
                    border: Border.all(
                      color: colorPage.lightgrey
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap:() {
                          count++;
                          setState(() {

                          });
                        },
                        child:  Container(
                            height: w*0.12,
                            width: w*0.12,

                            decoration: BoxDecoration(
                                color: colorPage.lightGreen,
                              borderRadius: BorderRadius.circular(w*0.03)
                            ),
                            child: Center(
                              child: Text("+",style: TextStyle(
                                color: colorPage.black
                              ),),
                            )
                        ),
                      ),
                      Text(count.toString()),
                      InkWell(
                        onTap: () {
                          count<=1?0 :count--;
                          setState(() {

                          });
                        },
                        child: Container(
                            height: w*0.12,
                            width: w*0.12,

                            decoration: BoxDecoration(
                              color: colorPage.lightGreen,
                              borderRadius: BorderRadius.circular(w*0.03),

                        ),
                             child: Center(
                               child: Text("-",style: TextStyle(
                            color: colorPage.black
                        ),),
                             )
                      ), )],
                  ),
                ),
                SizedBox(height: w*0.05,),
                Text("Total: \$${(count*175)*(dfference)}",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: w*0.05
                ),),
                //SizedBox(height: w*0.01,),
                InkWell(
                  onTap: () {

                    if(
                    date.isEmpty||date.length==1
                    ){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please mention travel date")));
                    }else{
                      Navigator.push(context, MaterialPageRoute(builder: (context) => nameofReservation(),));
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
                    child: Center(child: Text("Continue",
                      style: TextStyle(color: colorPage.secondaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: w*0.04),)),

                  ),
                ),
                SizedBox(height: w*0.045,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
