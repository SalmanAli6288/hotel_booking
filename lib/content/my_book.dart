import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/color_page.dart';
import 'package:hotel_booking/content/presidential_hotel.dart';
import 'package:hotel_booking/image_page.dart';

import '../main.dart';

class myBookMark extends StatefulWidget {
  const myBookMark({super.key});

  @override
  State<myBookMark> createState() => _myBookMarkState();
}

class _myBookMarkState extends State<myBookMark> {
  List selectHotel=[];
  List bookMark=[];
  // List hotel=[
  //   {
  //     "images":imagePage.room1,
  //     "text":"Intercontinental Hotel",
  //     "text2":"Lagos, Nigeria",
  //     "text3":"5.0",
  //     "text4":"(4,345 reviews)",
  //     "text5":"\$205",
  //     "text6":"/night",
  //     "button":presidentialHotel()
  //   },
  //   {
  //     "images":imagePage.room2,
  //     "text":"Nevada Hotel",
  //     "text2":"Lagos, Nigeria",
  //     "text3":"5.0",
  //     "text4":"(4,345 reviews)",
  //     "text5":"\$107",
  //     "text6":"/night",
  //     "button":presidentialHotel()
  //   },
  //   {
  //     "images":imagePage.room3,
  //     "text":"Oriental Hotel",
  //     "text2":"Lagos, Nigeria",
  //     "text3":"5.0",
  //     "text4":"(4,345 reviews)",
  //     "text5":"\$190",
  //     "text6":"/night",
  //     "button":presidentialHotel()
  //   },
  //   {
  //     "images":imagePage.room4,
  //     "text":"Federal Palace Hotel",
  //     "text2":"Lagos, Nigeria",
  //     "text3":"5.0",
  //     "text4":"(4,345 reviews)",
  //     "text5":"\$200",
  //     "text6":"/night",
  //     "button":presidentialHotel()
  //   },{
  //     "images":imagePage.room5,
  //     "text":"Presidential Hotel",
  //     "text2":"Lagos, Nigeria",
  //     "text3":"5.0",
  //     "text4":"(4,345 reviews)",
  //     "text5":"\$160",
  //     "text6":"/night",
  //     "button":presidentialHotel()
  //   },{
  //       "images":imagePage.room6,
  //       "text":"Presidential Hotel",
  //       "text2":"Lagos, Nigeria",
  //       "text3":"5.0",
  //       "text4":"(4,345 reviews)",
  //       "text5":"\$160",
  //       "text6":"/night",
  //     "button":presidentialHotel()
  //   }
  // ];
  bool list=true;
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
        title: Text("My Bookmark",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: w*0.06,
              color: colorPage.black
          ),),
        actions: [
          InkWell(
            onTap: () {
              list=true;
              setState(() {

              });
            },
              child: SvgPicture.asset(list==true ? imagePage.linemenu : imagePage.noteicon)),
          SizedBox(width: w*0.03,),
          InkWell(
            onTap: () {
              list=false;
              setState(() {

              });
            },
              child: SvgPicture.asset(list==true ?imagePage.colum4: imagePage.sqr4green)),
          SizedBox(width: w*0.03,),
        ],
        elevation: 0,
      ),
      backgroundColor: colorPage.lightGreen,
      body: Padding(
        padding: EdgeInsets.all(w*0.05),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("Hotel").snapshots(),
            builder: (context, snapshot) {

              if(!snapshot.hasData){
                return CircularProgressIndicator();
              }

              var hotel=snapshot.data!.docs;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 list==true? ListView.separated(
                   itemCount: hotel.length,
                   shrinkWrap: true,
                   physics: BouncingScrollPhysics(),
                   scrollDirection: Axis.vertical,
                   itemBuilder: (BuildContext , index) {
                     return InkWell(
                       onTap: () {
                         // Navigator.push(context, MaterialPageRoute(builder: (context) => hotel[index]["button"],));
                       },
                       child: Container(
                         height: w*0.4,
                         width: w*0.9,
                         decoration: BoxDecoration(
                             color: colorPage.secondaryColor,
                             borderRadius: BorderRadius.circular(w*0.03)
                         ),
                         child: Row(
                           children: [
                             Container(
                               margin: EdgeInsets.only(left: w*0.03),
                               height: w*0.3,
                               width: w*0.3,
                               decoration: BoxDecoration(
                                   image: DecorationImage(image: NetworkImage(hotel[index]["image"]),fit: BoxFit.fill),
                                   borderRadius: BorderRadius.circular(w*0.03)
                               ),
                             ),
                             SizedBox(width:w*0.02),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text(hotel[index]["name"],
                                   style: TextStyle(
                                       fontSize: w*0.035,
                                       fontWeight: FontWeight.w700
                                   ),),
                                 SizedBox(height: w*0.05,),
                                 Text(hotel[index]["place"],
                                   style: TextStyle(
                                       fontSize: w*0.03,
                                       fontWeight: FontWeight.w400
                                   ),),
                                 SizedBox(height: w*0.02,),
                                 Row(
                                   children: [
                                     SvgPicture.asset(imagePage.star),
                                     Text(hotel[index]["rate"],
                                       style: TextStyle(
                                           color: colorPage.primaryColor
                                       ),),
                                     SizedBox(width: w*0.03,),
                                     Text(hotel[index]["rate"])
                                   ],
                                 ),
                               ],
                             ),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.center,
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 SizedBox(height: w*0.08,),
                                 SizedBox(width: w*0.14,),
                                 Text(hotel[index]["rate"],style: TextStyle(
                                     color: colorPage.primaryColor,
                                     fontWeight: FontWeight.w700,
                                     fontSize: w*0.035
                                 ),),
                                 Text(hotel[index]["rate"],
                                   style: TextStyle(
                                       fontSize: w*0.025
                                   ),),
                                 SizedBox(height: w*0.08,),
                                 InkWell(
                                     onTap: () {
                                       if(selectHotel.contains(index)){
                                         selectHotel.remove(index);
                                       }else{
                                         selectHotel.add(index);
                                       }
                                       print(selectHotel);

                                       // selectedindex=index;
                                       setState(() {

                                       });
                                     },
                                     child: SvgPicture.asset(selectHotel.contains(index)?imagePage.savedfilledgreen:imagePage.savedicon,))
                               ],
                             )
                           ],
                         ),
                       ),
                     );
                   }, separatorBuilder: (BuildContext context, int index) {
                   return SizedBox(height: w*0.03,); },
                 ) :  GridView.builder(
                   shrinkWrap: true,
                   //scrollDirection: Axis.horizontal,
                   itemCount: hotel.length,
                   physics: BouncingScrollPhysics(),
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount: 2,
                       mainAxisSpacing: w*0.03,
                       crossAxisSpacing: w*0.03,
                       childAspectRatio: .65
                   ),
                   itemBuilder: (BuildContext context, int index) {
                     return InkWell(
                       onTap: () {
                         // Navigator.push(context, MaterialPageRoute(builder: (context) => hotel[index]["button"],));
                       },
                       child: Container(
                         height: w*0.75,
                         width: w*0.45,
                         decoration: BoxDecoration(
                             color: colorPage.secondaryColor,
                             borderRadius: BorderRadius.circular(w*0.03)
                         ),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             Container(
                               margin: EdgeInsets.all(w*0.03),
                               height: w*0.35,
                               width: w*0.35,
                               decoration: BoxDecoration(
                                   image: DecorationImage(image: NetworkImage(hotel[index]["image"]),fit: BoxFit.fill),
                                   borderRadius: BorderRadius.circular(w*0.03)
                               ),
                             ),
                             Text(hotel[index]["name"],style: TextStyle(
                                 fontWeight: FontWeight.w700,
                                 fontSize: w*0.035
                             ),),

                             Row(
                               crossAxisAlignment: CrossAxisAlignment.center,
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 SvgPicture.asset(imagePage.star),
                                 Text(hotel[index]["place"],style: TextStyle(
                                     color: colorPage.primaryColor
                                 ),),
                                 SizedBox(width: w*0.02,),
                                 Text(hotel[index]["rate"]),
                               ],
                             ),
                             Row(
                               crossAxisAlignment: CrossAxisAlignment.center,
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text(hotel[index]["rate"],style: TextStyle(
                                     color: colorPage.primaryColor
                                 ),),
                                 Text(hotel[index]["rate"],
                                   style: TextStyle(
                                       fontSize: w*0.03,
                                       fontWeight: FontWeight.w400
                                   ),),
                                 SizedBox(width:w*0.05),
                                 InkWell(
                                     onTap: () {
                                       if(bookMark.contains(index)){
                                         bookMark.remove(index);
                                       }else{
                                         bookMark.add(index);
                                       }
                                       setState(() {

                                       });
                                     },
                                     child: SvgPicture.asset(imagePage.savedicon,color: bookMark.contains(index)?colorPage.primaryColor:colorPage.black,)),
                               ],
                             ),
                           ],
                         ),
                       ),
                     );
                   },
                 ),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
