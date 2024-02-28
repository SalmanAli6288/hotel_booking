import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/color_page.dart';
import 'package:hotel_booking/content/presidential_hotel.dart';
import 'package:hotel_booking/image_page.dart';

import '../main.dart';

class searchPage extends StatefulWidget {
  const searchPage({super.key});

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
    int selectindex=0;
    List hotelselect=[];
    bool list=true;
    String categories='';
  // List hotel=[
  //   {
  //     "images":imagePage.room1,
  //     "text":"Intercontinental Hotel",
  //     "text2":"Lagos, Nigeria",
  //     "text3":"5.0",
  //     "text4":"(4,345 reviews)",
  //     "text5":"\$205",
  //     "text6":"/night",
  //   },
  //   {
  //     "images":imagePage.room2,
  //     "text":"Nevada Hotel",
  //     "text2":"Lagos, Nigeria",
  //     "text3":"5.0",
  //     "text4":"(4,345 reviews)",
  //     "text5":"\$107",
  //     "text6":"/night",
  //   },
  //   {
  //     "images":imagePage.room3,
  //     "text":"Oriental Hotel",
  //     "text2":"Lagos, Nigeria",
  //     "text3":"5.0",
  //     "text4":"(4,345 reviews)",
  //     "text5":"\$190",
  //     "text6":"/night",
  //   },
  //   {
  //     "images":imagePage.room4,
  //     "text":"Federal Palace Hotel",
  //     "text2":"Lagos, Nigeria",
  //     "text3":"5.0",
  //     "text4":"(4,345 reviews)",
  //     "text5":"\$200",
  //     "text6":"/night",
  //   },{
  //     "images":imagePage.room5,
  //     "text":"Presidential Hotel",
  //     "text2":"Lagos, Nigeria",
  //     "text3":"5.0",
  //     "text4":"(4,345 reviews)",
  //     "text5":"\$160",
  //     "text6":"/night",
  //   }
  // ];
   TextEditingController search=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPage.secondaryColor,
        elevation: 0,
      ),
      backgroundColor: colorPage.lightGreen,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: w*0.5,
              width: w*1,
              decoration: BoxDecoration(
                color: colorPage.red
              ),
              child: Padding(
                padding: EdgeInsets.all(w*0.03),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
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
                          fillColor: colorPage.lightgrey.withOpacity(0.45),
                          labelText: "Search",
                          labelStyle: TextStyle(
                              fontSize: w*0.045,
                              fontWeight: FontWeight.w400,
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
                             borderSide: BorderSide.none,
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
                    SizedBox(height: w*0.06,),
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection("category").snapshots(),
                      builder: (context, snapshot) {
                        if(!snapshot.hasData){
                          return CircularProgressIndicator();
                        }
                        var category=snapshot.data!.docs;
                        return Container(
                          height: w*0.09,
                          width: w*1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(w*0.03)
                          ),
                          // color: Colors.yellow,
                          child:ListView.separated(
                            itemCount: category.length,
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  selectindex=index;
                                  categories=category[index]["category"];
                                  if(categories=="All Hotel"){
                                    categories='';
                                  }

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
                          )
                        );
                      }
                    ),
                    SizedBox(height: w*0.04,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Recommended  (484,579)",
                        style: TextStyle(
                          fontWeight: FontWeight.w700
                        ),),
                        Row(
                          children: [
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
                          ],
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(height: w*0.03,),
            SingleChildScrollView(
              child: StreamBuilder<QuerySnapshot>(
                stream: categories==''? FirebaseFirestore.instance.collection("Hotel").snapshots():
                FirebaseFirestore.instance.collection("Hotel").where("category", isEqualTo: categories).snapshots(),
                builder: (context, snapshot) {

                  if(!snapshot.hasData){
                    return CircularProgressIndicator();
                  }

                  var hotel=snapshot.data!.docs;


                  return Container(
                    height: w*1.27,
                    width: w*0.9,
                    child: list==true?ListView.separated(
                      itemCount: hotel.length,
                     shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                     itemBuilder: (context, index1) {
                       return  Container(

                         height: w*0.4,
                         width: w*0.9,
                         decoration: BoxDecoration(
                             color: colorPage.secondaryColor,
                             borderRadius: BorderRadius.circular(w*0.04)
                         ),
                         child: Row(
                           children: [
                             InkWell(
                               onTap: () {
                                 Navigator.push(context,CupertinoPageRoute(builder: (context) =>presidentialHotel(
                                   image: hotel[index1]["image"],
                                   name: hotel[index1]["name"],
                                   place: hotel[index1]["place"], description: hotel[index1]["description"], rate: double.tryParse(hotel[index1]["rate"].toString())!, id: hotel[index1].id, ) ,));
                               },
                               child: Container(
                                 margin: EdgeInsets.only(left: w*0.03),
                                 height: w*0.3,
                                 width: w*0.3,
                                 decoration: BoxDecoration(
                                     image: DecorationImage(image: NetworkImage(hotel[index1]["image"]),fit: BoxFit.fill),
                                     borderRadius: BorderRadius.circular(w*0.03)
                                 ),
                               ),
                             ),
                             SizedBox(width:w*0.02),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text(hotel[index1]["rate"].toString(),
                                   style: TextStyle(
                                       fontSize: w*0.035,
                                       fontWeight: FontWeight.w700
                                   ),),
                                 SizedBox(height: w*0.05,),
                                 Text(hotel[index1]["rate"].toString(),
                                   style: TextStyle(
                                       fontSize: w*0.03,
                                       fontWeight: FontWeight.w400
                                   ),),
                                 SizedBox(height: w*0.02,),
                                 Row(
                                   children: [
                                     SvgPicture.asset(imagePage.star),
                                     Text(hotel[index1]["name"],
                                       style: TextStyle(
                                           color: colorPage.primaryColor
                                       ),),
                                     SizedBox(width: w*0.03,),
                                     Text(hotel[index1]["place"])
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
                                 Text(hotel[index1]["rate"].toString(),style: TextStyle(
                                     color: colorPage.primaryColor,
                                     fontWeight: FontWeight.w700,
                                     fontSize: w*0.035
                                 ),),
                                 Text(hotel[index1]["rate"].toString(),
                                   style: TextStyle(
                                       fontSize: w*0.025
                                   ),),
                                 SizedBox(height: w*0.08,),
                                InkWell(
                                  onTap: () {
                                    if(hotelselect.contains(index1)){
                                      hotelselect.remove(index1);
                                    }else{
                                      hotelselect.add(index1);
                                    }
                                    setState(() {

                                    });
                                  },
                                    child: SvgPicture.asset(hotelselect.contains(index1)?imagePage.savedfilledgreen:imagePage.savedicon,))
                               ],
                             ),
                           ],
                         ),

                       );
                     }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: w*0.03,); },
                    ) :GridView.builder(
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
                            Navigator.push(context, CupertinoPageRoute(builder: (context) => presidentialHotel(image: hotel[index]["image"],
                              name: hotel[index]["name"], place: hotel[index]["place"], description: hotel[index]["description"],
                              rate: hotel[index]["rate"], id: hotel[index].id,),));
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
                                    Text(hotel[index]["rate"].toString(),style: TextStyle(
                                        color: colorPage.primaryColor
                                    ),),
                                    SizedBox(width: w*0.02,),
                                    Text(hotel[index]["place"]),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(hotel[index]["rate"].toString(),style: TextStyle(
                                        color: colorPage.primaryColor
                                    ),),
                                    Text(hotel[index]["place"],
                                      style: TextStyle(
                                          fontSize: w*0.03,
                                          fontWeight: FontWeight.w400
                                      ),),
                                    SizedBox(width:w*0.05),
                                    InkWell(
                                      onTap: () {
                                        if(hotelselect.contains(index)){
                                          hotelselect.remove(index);
                                        }else{
                                          hotelselect.add(index);

                                        }
                                        setState(() {

                                        });
                                      },
                                        child: SvgPicture.asset(imagePage.savedicon,color: hotelselect.contains(index)?colorPage.primaryColor:colorPage.black,)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },

                    ),
                  );

                }
              ),

            ),

          ],
        ),
      ),
    );
  }
}
