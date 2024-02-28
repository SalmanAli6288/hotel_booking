import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/color_page.dart';
import 'package:hotel_booking/content/calender_page.dart';
import 'package:hotel_booking/image_page.dart';
import 'package:readmore/readmore.dart';

import '../main.dart';

class presidentialHotel extends StatefulWidget {
  final String image;
  final String name;
  final String place;
  final String description;
  final double rate;

  final String id;

  const presidentialHotel({super.key, required this.image, required this.name, required this.place, required this.description, required this.rate, required this.id});

  @override
  State<presidentialHotel> createState() => _presidentialHotelState();
}

class _presidentialHotelState extends State<presidentialHotel> {
  int selectedindex=0;
  bool more=false;
  bool view=true;
  List review=[
    {
    "images":imagePage.othava,
    "text1":"Ivande Othawa",
      "text2":"Jan 20, 2025",
      "text3":"Very nice and comfortable hotel, thank you for\naccompanying my vacation!"
    },
    {
      "images":imagePage.davies,
      "text1":"Nonso Davies",
      "text2":"Jan 20, 2025",
      "text3":"The rooms are very elegant and the natural views\nare amazing can’t wait to come back again"
    },
    {
      "images":imagePage.peter,
      "text1":"Peter Shege",
      "text2":"Jan 09, 2025",
      "text3":"Very nice hotel, my friends and I are very satisfied\nwith the service!"
    },
    {
      "images":imagePage.room1,
      "text1":"Ashik usman",
      "text2":"Jan 20, 2025",
      "text3":"Very nice and comfortable hotel, thank you for\naccompanying my vacation!"
    },
    {
      "images":imagePage.room2,
      "text1":"Lionel scaloni",
      "text2":"Jan 20, 2025",
      "text3":"Very nice hotel, my friends and I are very satisfied\nwith the service!"
    }
  ];
  List hotel=[
    {
      "images":imagePage.room1,
      "text":"Intercontinental Hotel",
      "text2":"Lagos, Nigeria",
      "text3":"5.0",
      "text4":"(4,345 reviews)",
      "text5":"\$205",
      "text6":"/night",
    },
    {
      "images":imagePage.room2,
      "text":"Nevada Hotel",
      "text2":"Lagos, Nigeria",
      "text3":"5.0",
      "text4":"(4,345 reviews)",
      "text5":"\$107",
      "text6":"/night",
    },
    {
      "images":imagePage.room3,
      "text":"Oriental Hotel",
      "text2":"Lagos, Nigeria",
      "text3":"5.0",
      "text4":"(4,345 reviews)",
      "text5":"\$190",
      "text6":"/night",
    },
    {
      "images":imagePage.room4,
      "text":"Federal Palace Hotel",
      "text2":"Lagos, Nigeria",
      "text3":"5.0",
      "text4":"(4,345 reviews)",
      "text5":"\$200",
      "text6":"/night",
    },{
      "images":imagePage.room5,
      "text":"Presidential Hotel",
      "text2":"Lagos, Nigeria",
      "text3":"5.0",
      "text4":"(4,345 reviews)",
      "text5":"\$160",
      "text6":"/night",
    }
  ];
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
        title: Text(widget.name,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: w*0.06,
              color: colorPage.black
          ),),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Container(
          width: w*1,
          child: Column(
            children: [
              Container(
                height: w*0.6,
                width: w*1,
                child: Image.network(widget.image,fit: BoxFit.fill,),
              ),
              Container(
                width: w*1,
               // height: height*2,
               // color: Colors.red,
                child: Padding(
                  padding:  EdgeInsets.all(w*0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: w*0.07
                      ),),
                      SizedBox(height: w*0.02,),
                      Row(
                       // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(imagePage.location),
                          SizedBox(width:w*0.01),
                          Text(widget.place)
                        ],
                      ),
                      SizedBox(height: w*0.09,),
                      Divider(
                        thickness: w*0.0045,
                        color: colorPage.black.withOpacity(0.25),
                      ),
                      SizedBox(height: w*0.04,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Gallery Photos",style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: w*0.05
                          ),),
                          InkWell(
                            onTap: () {
                              view=!view;
                              setState(() {

                              });
                            },
                            child: Text(view==true?"See all":"See less",
                            style: TextStyle(
                              color: colorPage.primaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize: w*0.05
                            ),),
                          )
                        ],
                      ),
                      SizedBox(height: w*0.04,),
                      Container(
                        height: view==true?w*0.3:w*0.9,
                        width: w*1,
                       // color: Colors.green,
                        child: view==true? StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance.collection("Hotel").doc(widget.id).snapshots(),
                          builder: (context, snapshot) {

                            if(!snapshot.hasData){
                              return CircularProgressIndicator();
                            }

                            var hotel1=snapshot.data!["addImage"];

                            return ListView.separated(
                              itemCount: hotel1.length,
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                               return Container(
                                  height: w*0.3,
                                  width: w*0.36,
                                  decoration: BoxDecoration(
                                     // color: Colors.red,
                                      borderRadius: BorderRadius.circular(w*0.04),
                                    image: DecorationImage(image: NetworkImage(hotel1[index]),fit: BoxFit.fill)
                                  ),

                                );
                              }, separatorBuilder: (BuildContext context, int index) { return SizedBox(width: w*0.03,); },
                            );
                          }
                        )
                            :StreamBuilder<DocumentSnapshot>(
                              stream: FirebaseFirestore.instance.collection("Hotel").doc(widget.id).snapshots(),
                              builder: (context, snapshot) {

                                if(!snapshot.hasData) {
                                  return CircularProgressIndicator();
                                }

                                var hotel2=snapshot.data!["addImage"];

                                return GridView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: hotel2.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: w*0.03,
                                    crossAxisSpacing: w*0.03,
                                    childAspectRatio: 1
                                ),
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: w*0.09,
                                    width: w*0.36,
                                    decoration: BoxDecoration(
                                      // color: Colors.red,
                                        borderRadius: BorderRadius.circular(w*0.04),
                                        image: DecorationImage(image: NetworkImage(hotel2[index]),fit: BoxFit.fill)
                                    ),
                                  );
                                },);
                              }
                            ),
                      ),
                      SizedBox(height: w*0.04,),
                      Text("Details",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: w*0.05
                      ),),
                      SizedBox(height: w*0.05,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              SvgPicture.asset(imagePage.hotel),
                              Text("Hotels",style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: w*0.03
                              ),),
                            ],
                          ),
                          Column(
                            children: [
                              SvgPicture.asset(imagePage.bedroom),
                              Text("Bedroom",style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: w*0.03
                              ),)
                            ],
                          ),
                          Column(
                            children: [
                              SvgPicture.asset(imagePage.bathroom),
                              Text("Bathroom",style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: w*0.03
                              ),)
                            ],
                          ),
                          Column(
                            children: [
                              SvgPicture.asset(imagePage.scale),
                              Text("300 sqr",style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: w*0.03
                              ),),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: w*0.05),
                      Text("Description",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: w*0.05
                      ),),
                      SizedBox(height: w*0.01,),
                      ReadMoreText(widget.description,
                      textAlign: TextAlign.justify,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: "Read More",
                      trimExpandedText: "Show Less",
                      lessStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: w*0.04,color: colorPage.primaryColor
                      ),
                        moreStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: w*0.04,color: colorPage.primaryColor
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: w*0.038,
                        ),
                      ),
                      SizedBox(height: w*0.04),
                      Text("Facilities",style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: w*0.05
                      ),),
                      SizedBox(height: w*0.03,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(imagePage.pool),
                              SizedBox(height: w*0.02,),
                              Text("Swimming pool",style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: w*0.03
                              ),),
                              SizedBox(height: w*0.02,),
                              Column(
                                children: [
                                  SvgPicture.asset(imagePage.meetingroom),
                                  SizedBox(height: w*0.02,),
                                  Text("Meeting Room",style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: w*0.03
                                  ),),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SvgPicture.asset(imagePage.wifi),
                              SizedBox(height: w*0.015,),
                              Text("Wifi",style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: w*0.03
                              ),),
                              SizedBox(height: w*0.02,),
                              Column(
                                children: [
                                  SvgPicture.asset(imagePage.elevator),
                                  SizedBox(height: w*0.02,),
                                  Text("Elevator",style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: w*0.03
                                  ),),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SvgPicture.asset(imagePage.restaurant),
                              SizedBox(height: w*0.02,),
                              Text("Restaurant",style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: w*0.03
                              ),),
                              SizedBox(height: w*0.02,),
                              Column(
                                children: [
                                  SvgPicture.asset(imagePage.fitness),
                                  SizedBox(height: w*0.02,),
                                  Text("Fitness Center",style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: w*0.03
                                  ),),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SvgPicture.asset(imagePage.parking),
                              SizedBox(height: w*0.015,),
                              Text("Parking",style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: w*0.03
                              ),),
                              SizedBox(height: w*0.02,),
                              Column(
                                children: [
                                  SvgPicture.asset(imagePage.hours24live),
                                  SizedBox(height: w*0.02,),
                                  Text("24-hours open",style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: w*0.03
                                  ),),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                     // SizedBox(height: w*0.05,),
                      SizedBox(height: w*0.04),
                      Text("Location",style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: w*0.05
                      ),),
                      Container(
                        height: w*0.5,
                        width: w*1,

                        decoration: BoxDecoration(
                          //  color: Colors.red,
                          borderRadius: BorderRadius.circular(w*0.03),
                          image: DecorationImage(image: AssetImage(imagePage.map))
                        ),
                      ),
                      SizedBox(height: w*0.04),
                      Row(
                        children: [
                          Text("Review",style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: w*0.05
                          ),),
                          SizedBox(width: w*0.03,),
                          SvgPicture.asset(imagePage.star),
                          SizedBox(width: w*0.01,),
                          Text("5.0",style: TextStyle(color: colorPage.primaryColor,fontWeight: FontWeight.w400,fontSize: w*0.03),),
                          SizedBox(width: w*0.02,),
                          Text("(4,345 review)",style: TextStyle(fontWeight: FontWeight.w400,fontSize: w*0.03),),
                          SizedBox(width: w*0.21,),
                          Text("See All",
                          style: TextStyle(
                            fontSize: w*0.04,
                            fontWeight: FontWeight.w700,
                            color: colorPage.primaryColor
                          ),)
                        ],
                      ),
                      SizedBox(height: w*0.05,),
                     ListView.separated(
                      itemCount:  more==true?review.length:3,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return  Container(
                            height: w*0.4,
                            width: w*1,
                            decoration: BoxDecoration(
                                color: colorPage.secondaryColor,
                                borderRadius: BorderRadius.circular(w*0.03),
                                boxShadow: [
                                  BoxShadow(
                                      color: colorPage.black.withOpacity(0.15),
                                      blurRadius:2,
                                      spreadRadius: 2,
                                      offset: Offset(
                                          0,4
                                      ))
                                ]
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: w*0.03,),
                                ListTile(
                                  leading:  Container(
                                    height: w*0.2,
                                    width: w*0.2,
                                    decoration: BoxDecoration(
                                       shape: BoxShape.circle,
                                        image: DecorationImage(image: AssetImage(hotel[index]["images"]),fit: BoxFit.fill)
                                    ),
                                  ),
                                  title: Text(review[index]["text1"],style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: w*0.05
                                  ),) ,
                                  subtitle: Text(review[index]["text2"],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: w*0.04,
                                  ),),
                                  trailing: Container(
                                    height: w*0.07,
                                    width: w*0.13,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(w*0.04),
                                      color: colorPage.primaryColor
                                    ),
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            height: w*0.045,
                                            // padding: EdgeInsets.all(width*0.2),
                                            width: w*0.045,
                                            // color: colorPage.thirdColor,
                                            child: SvgPicture.asset(imagePage.star,color: colorPage.secondaryColor)
                                        ),
                                        SizedBox(width: w*0.01,),
                                        Text("5.0",style:
                                        TextStyle(
                                            color: colorPage.secondaryColor,
                                            // fontWeight: FontWeight.w600,
                                            fontSize: w*0.035
                                        ),)
                                      ],
                                    ),
                                  ),
                                  ),

                                SizedBox(width: w*0.5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(review[index]["text3"]),
                                  ],
                                ),

                              ],
                            ),
                          );
                        }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: w*0.03,); },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: w*0.03,),
              InkWell(
                onTap: () {
                  more=!more;
                  setState(() {

                  });
                },
                child: Container(
                  height: w*0.13,
                  width: w*0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(w*0.1),
                      color: colorPage.lightGreen,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        spreadRadius: 2,
                        color: colorPage.primaryColor.withOpacity(0.25),
                        offset: Offset(0, 4)
                      )
                    ]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     Text(more==true?"Less":"More",
                        style: TextStyle(
                            color: colorPage.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: w*0.038,
                        ),
                      ),
                      Icon(more==true?Icons.keyboard_arrow_up_sharp:Icons.keyboard_arrow_down_sharp,color: colorPage.primaryColor,)

                    ],
                  ),
                ),
              ),
              SizedBox(height: w*0.35,),
            ],
          ),
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
            Divider(
              thickness: w*0.0045,
              color: colorPage.black.withOpacity(0.25),
            ),
            SizedBox(height: w*0.04,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text(widget.rate.toString(),
                    style: TextStyle(
                      color: colorPage.primaryColor,
                      fontSize: w*0.05,
                      fontWeight: FontWeight.w700
                    ),),
                    SizedBox(width: w*0.01,),
                    Text("/night",style: TextStyle(
                        //color: colorPage.primaryColor,
                        fontSize: w*0.025,
                    ),),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => calenderPage(),));
                  },
                  child: Container(
                    height: w*0.13,
                    width: w*0.6,
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
                    child: Center(child: Text("Book Now !",
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
