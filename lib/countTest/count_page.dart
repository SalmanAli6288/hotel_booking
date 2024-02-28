import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../main.dart';

class CountPage extends StatefulWidget {
  const CountPage({super.key});

  @override
  State<CountPage> createState() => _CountPageState();
}
// List<Map<String,dynamic>> food=[
//   {
//   "image":"https://www.buydaddy.in/wp-content/uploads/2020/05/dajaj-mandhi.jpg",
//     "name":"Mandhi",
//     "price": 170,
//     "Qty":0
//   },
//   {
//     "image":"https://miro.medium.com/v2/resize:fit:578/1*cDZdB_kwHJHGt_eA9qLoaw.png",
//     "name":"Biriyani",
//     "price": 100,
//     "Qty":0
//   },
//   {
//     "image":"https://www.licious.in/blog/wp-content/uploads/2020/12/Tripple-Dipped-Broasted-Chicken-750x750.jpg",
//     "name":"Broasted",
//     "price": 490,
//     "Qty":0
//   },
//   {
//     "image":"https://www.indianhealthyrecipes.com/wp-content/uploads/2020/12/fried-rice.jpg",
//     "name":"Fried-Rice",
//     "price": 150,
//     "Qty":0
//   },
//   {
//     "image":"https://pbs.twimg.com/media/FyF4eKsaIAAXubw.jpg",
//     "name":"porotta & Beef",
//     "price": 110,.
//     "Qty":0
//   },
//
// ];

class _CountPageState extends State<CountPage> {
  int total=0;
  List<QueryDocumentSnapshot<Map<String, dynamic>>>? data;
  totalPrice(){
    FirebaseFirestore.instance.collection('Food').snapshots().listen((event) {
       total=0;
      print(event.docs[1].data());
       data=event.docs;
       print('objectssssssssssssssssssss');

      for(int i=0;i<event.docs.length;i++){

        total=(event.docs[i]['rate']*event.docs[i]['Qty'])+total;
        print(total);
        // print('xcvnfghkl');
        // print((event.docs[i]['rate']*event.docs[i]['Qty']));
      }
      setState(() {

      });
    });

  }
  @override
  void initState() {
    totalPrice();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(w*0.04),
        child: Container(
          height: height*0.72,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                 data==null?CircularProgressIndicator():ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemCount: data!.length ,
                      itemBuilder: (context, index) {
                        return Container(
                          height: w*0.4,
                          width: w*1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(w*0.05),
                            color: Colors.green,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                // margin: EdgeInsets.only(left: w*0.03),
                                height: w*0.25,
                                width: w*0.25,
                                decoration: BoxDecoration(
                                    image: DecorationImage(image: NetworkImage(data![index]["image"]),fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(w*0.03)
                                ),

                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(data![index]["FoodName"],style: TextStyle(
                                      color: Colors.white
                                  ),),
                                  SizedBox(height: w*0.03,),
                                  Text(data![index]["rate"].toString(),style: TextStyle(
                                      color: Colors.white
                                  ),)
                                ],
                              ),

                              data![index]["Qty"]!=0? Container(
                               height: height*0.05,
                               width: w*0.2,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(w*0.03),
                                 color: Colors.white,
                               ),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 children: [
                                 InkWell(
                                   onTap: () {
                                     FirebaseFirestore.instance.collection("Food").doc(data![index].id).update(
                                         {
                                           "Qty":data![index]["Qty"]+1
                                         });
                                     totalPrice();
                                     setState(() {
                                     });
                                     },
                                   child: Container(
                                     height: w*0.05,
                                     width: w*0.05,
                                     // color: Colors.red,
                                     child: Icon(Icons.add),
                                   ),
                                 ),
                                   Text(data![index]["Qty"].toString()),
                                   InkWell(
                                     onTap: () {
                                       FirebaseFirestore.instance.collection("Food").doc(data![index].id).update(  {
                                         "Qty":data![index]["Qty"]-1
                                           });

                                       totalPrice();
                                       setState(() {
                                       });
                                       },
                                     child: Container(
                                       height: w*0.05,
                                       width: w*0.05,
                                       // color: Colors.red,
                                       child: Icon(Icons.remove),
                                     ),
                                   )
                                 ],
                               )
                             ):InkWell(
                               onTap: () {
                                 FirebaseFirestore.instance.collection("Food").doc(data![index].id).update(
                                     {
                                       "Qty":data![index]["Qty"]+1
                                     });
                                 totalPrice();
                                 setState(() {
                                 });
                               },
                               child: Container(
                                 height: height*0.05,
                                 width: w*0.2,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(w*0.03),
                                   color: Colors.white,

                                 ),
                                 child: Center(child: Text("Add")),
                               ),
                             ),
                            ],
                          ),

                        );
                      },
                      shrinkWrap: true,
                      separatorBuilder: (BuildContext context, int index) { return SizedBox(height: w*0.03,); },

                    )

              ],
            ),
          ),
        ),
      ),
      floatingActionButton:
      Container(
        height: height*0.15,
        width: w*1,
        color: Colors.lightGreen.withOpacity(0.25),
        child: Column(
          children: [
            Divider(
              thickness: w*0.01,
              color: Colors.black.withOpacity(0.50
              ),
            ),
            SizedBox(height:w*0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Price:$total",style: TextStyle(
                  fontSize: w*0.06,
                  fontWeight: FontWeight.w800
                ),),
              ],
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );

  }
}
