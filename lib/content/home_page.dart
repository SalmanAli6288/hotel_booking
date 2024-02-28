import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/color_page.dart';
import 'package:hotel_booking/content/my_book.dart';
import 'package:hotel_booking/content/presidential_hotel.dart';
import 'package:hotel_booking/content/recently-booked.dart';
import 'package:hotel_booking/image_page.dart';

import '../auth/login_page.dart';
import '../main.dart';


class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  TextEditingController search=TextEditingController();
  // List category =["All Hotel","Recommended","popular","Trending"];
  List selectHotel=[];
//   List room=[
//     {
//     "image":imagePage.room1,
//     "text1":"Intercontinental Hotel",
//     "text2":"Lagos, Nigeria",
//     "text3":"\$205 ",
//     "text4":"/night ",
// },
//     {
//     "image":imagePage.room2,
//       "text1":"Nevada Hotel",
//       "text2":"Lagos, Nigeria",
//       "text3":"\$107 ",
//       "text4":"/night ",
//     },
//     {
//     "image":imagePage.room3,
//       "text1":"Oriental Hotel",
//       "text2":"Lagos, Nigeria",
//       "text3":"\$190 ",
//       "text4":"/night ",
//     },
//     {
//     "image":imagePage.room4,
//       "text1":"Federal Palace Hotel",
//       "text2":"Lagos, Nigeria",
//       "text3":"\$200 ",
//       "text4":"/night ",
//       },
//     {
//     "image":imagePage.room5,
//       "text1":"Presidential Hotel",
//       "text2":"Lagos, Nigeria",
//       "text3":"\$160 ",
//       "text4":"/night ",
//   }];
  int selectindex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPage.secondaryColor,
        leading: Padding(
          padding: EdgeInsets.all(w*0.025),
          child: Container(
            height: w*0.01,
            width: w*0.01,
            child: CircleAvatar(
              radius: w*0.06,
                 backgroundImage: NetworkImage(currentUserImage),
                 // Image.network(currentUserImage,
                ),
            ),
          ),
        title: Text("Bolu",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: w*0.06,
              color: colorPage.black
          ),),
        elevation: 0,
        actions: [
          Icon(Icons.notifications_none_outlined,color: colorPage.black,),
          SizedBox(width: w*0.02,),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => myBookMark(),));
            },
              child: Icon(Icons.bookmark,color: colorPage.black)),
          SizedBox(width: w*0.02,),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(w*0.03),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: height*0.8,
            width: w*1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Hi, ${currentUserName}",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: w*0.08
                        ),),
                      ],
                    ),
                    SizedBox(height: w*0.05,),
                    TextFormField(
                        controller: search,
                        textCapitalization: TextCapitalization.sentences,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        style: TextStyle(
                            fontSize: w*0.045,
                            fontWeight: FontWeight.w500
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: colorPage.lightgrey,
                          labelText: "Search",
                          labelStyle: TextStyle(
                              fontSize: w*0.045,
                              fontWeight: FontWeight.w400
                          ),
                          prefixIcon: Container(
                            height: w*0.02,
                            width: w*0.08,
                            padding: EdgeInsets.all(w*0.025),
                            child: SvgPicture.asset(imagePage.searchicon),
                          ),
                          suffixIcon: Container(
                            height: w*0.02,
                            width: w*0.08,
                            padding: EdgeInsets.all(w*0.025),
                            child: SvgPicture.asset(imagePage.randkann),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
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
                  ],
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection("category").snapshots(),
                  builder: (context, snapshot) {

                    if(!snapshot.hasData){
                      return CircularProgressIndicator();
                    }

                    var category=snapshot.data!.docs;

                    return Container(
                      height: w*0.08,
                      width: w*1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(w*0.03)
                      ),
                      child: ListView.separated(
                        itemCount: category.length,
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              selectindex=index;
                              setState(() {

                              });
                            },
                            child: Container(
                              height: w*0.4,
                              // width: w*0.4,
                              padding: EdgeInsets.only(left:w*0.02,right: w*0.02),
                              decoration: BoxDecoration(
                                  color:selectindex==index?colorPage.primaryColor:colorPage.secondaryColor,
                                  borderRadius: BorderRadius.circular(w*0.05),
                                  border: Border.all(color: colorPage.primaryColor)
                              ) ,
                              child: Center(child: Text(category[index]["category"],
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: selectindex==index?colorPage.secondaryColor:colorPage.primaryColor
                                ),)),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(width: w*0.03,);
                        },
                      ),
                    );
                  }
                ),
                Column(
                  children: [

                    SizedBox(height: w*0.05,),
                    Container(
                      height: w*0.8,
                      width: w*3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(w*0.03)
                      ),
                      // color: Colors.yellow,
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance.collection("Hotel").snapshots(),
                        builder: (context, snapshot) {

                          if(!snapshot.hasData){
                            return CircularProgressIndicator();
                          }

                          var rooms=snapshot.data!.docs;




                          return ListView.separated(
                            itemCount: rooms.length,
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext , int index1) {
                              return Stack(
                                children:[
                                  InkWell(
                                    onTap:() {
                                      Navigator.push(context, CupertinoPageRoute(builder: (context) => presidentialHotel(image: rooms[index1]["image"], name: rooms[index1]["name"], place: rooms[index1]["place"], description: rooms[index1]["description"], rate: double.tryParse(rooms[index1]["rate"].toString())!, id: rooms[index1].id),));
                                    },
                                    child: Container(
                                    height: w*0.8,
                                    width: w*0.7,
                                    padding: EdgeInsets.only(left:w*0.02,right: w*0.02),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(w*0.09),
                                      //  border: Border.all(color: colorPage.primaryColor),
                                     image: DecorationImage(image: NetworkImage(rooms[index1]["image"]),fit: BoxFit.fill)
                                    ) ,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: w*0.03),
                                          child: Text(rooms[index1]["name"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                              color: colorPage.secondaryColor,
                                              fontSize: w*0.05
                                            ),),
                                        ),
                                        SizedBox(height: w*0.04,),
                                        Padding(
                                          padding: EdgeInsets.only(left:w*0.03),
                                          child: Text(rooms[index1]["name"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: colorPage.secondaryColor
                                            ),),
                                        ),
                                        SizedBox(height: w*0.02,),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(left:w*0.03),
                                              child: Text(rooms[index1]["place"],
                                                style: TextStyle(
                                                  fontSize: w*0.05,
                                                    fontWeight: FontWeight.w700,
                                                    color: colorPage.secondaryColor
                                                ),),
                                            ),
                                            Text(rooms[index1]["rate"].toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: colorPage.secondaryColor
                                              ),),
                                          ],
                                        ),
                                        SizedBox(height: w*0.04,)
                                      ],
                                    ),
                                ),
                                  ),
                                  Positioned(
                                    left: w*0.48,
                                    top: w*0.06,
                                    child: Container(
                                      height: w*0.07,
                                      width: w*0.15,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(w*0.06),
                                        color: colorPage.primaryColor,
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              height: w*0.05,
                                              // padding: EdgeInsets.all(width*0.2),
                                              width: w*0.05,
                                              // color: colorPage.thirdColor,
                                              child: SvgPicture.asset(imagePage.star,color: colorPage.secondaryColor)
                                          ),
                                          Text("5.0",style:
                                          TextStyle(
                                              color: colorPage.secondaryColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: w*0.035
                                          ),)
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: w*0.58,
                                      top: w*0.64,
                                      child:
                                      InkWell(
                                      onTap: () {
                                        if(selectHotel.contains(index1)){
                                          selectHotel.remove(index1);
                                        }else{
                                          selectHotel.add(index1);
                                        }
                                        setState(() {

                                        });
                                        },
                                          child: Container(
                                            height: w*0.08,
                                              width: w*0.08,
                                              //color: colorPage.red,
                                              child: SvgPicture.asset(imagePage.savedicon,color: selectHotel.contains(index1)?colorPage.primaryColor:colorPage.secondaryColor,width: w*0.055,height: w*0.055,)))
                                  ),

                              ],
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return SizedBox(width: w*0.03,);
                            },
                          );
                        }
                      ),

                    ),
                    SizedBox(height: w*0.048,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Recently Booked",
                          style: TextStyle(
                              fontSize: w*0.04,
                              fontWeight: FontWeight.w600
                          ),),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => recentlyBooked(),));
                          },
                          child: Text("See All",
                            style: TextStyle(
                                fontSize: w*0.04,
                                fontWeight: FontWeight.w600,
                                color: colorPage.primaryColor
                            ),),
                        ),
                      ],
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
