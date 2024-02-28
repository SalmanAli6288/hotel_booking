import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking/content/protect_page.dart';
import 'package:hotel_booking/image_page.dart';
import 'package:hotel_booking/color_page.dart';

import '../main.dart';

class lockPage extends StatefulWidget {
  const lockPage({super.key});

  @override
  State<lockPage> createState() => _lockPageState();
}

class _lockPageState extends State<lockPage> {
  int? selectedIndex;
  List a=[
    {
      "icon":imagePage.msgicon,
      "text1":"Via sms",
      "text2":"+234111******99"
    },
    {
      "icon":imagePage.emailsmall,
      "text1":"via Email",
      "text2":"kez***9@your domain.com"
    }
  ];
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
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(imagePage.leftarrow,
              color: colorPage.black,
              height: w*0.01,
              width: w*0.01,),
          ),

      ),
        ),
        title: Text("Fill Your Profile",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: w*0.06,
              color: colorPage.black
          ),),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(w*0.04),
            child: Container(
              height: height*0.9,
              width: w*1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: w*0.03,),
                  Container(
                   // margin: EdgeInsets.only(left: width*0.10),
                    height: w*0.65,
                    width: w*1,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(imagePage.lockicon)),
                    ),
                  ),
                  SizedBox(height: w*0.05,),
                  Center(child: Text("Select which contact details should we use to reset\nyour password",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: w*0.035
                  ),)),
                  SizedBox(height: w*0.05,),
                  Container(
                    height: w*0.85,
                    width: w*1,
                    //color: Colors.red,
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder: (BuildContext, int index){
                    return InkWell(
                      onTap: () {
                        selectedIndex=index;
                        setState(() {

                        });
                      },
                      child: Container(
                        height: w*0.35,
                        width: w*0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(w*0.03),
                          border: Border.all(
                              width: selectedIndex==index?w*0.01:w*0.003,
                              color: colorPage.primaryColor),
                        ),
                        child: Row(
                          children: [
                           Container(
                              margin: EdgeInsets.all(w*0.04),
                              height: w*0.23,
                             width: w*0.23,
                             decoration: BoxDecoration(
                             color: colorPage.lightGreen,
                             shape: BoxShape.circle,
                             ),
                              child: Center(child: SvgPicture.asset(a[index]["icon"],height: w*0.1,width: w*0.1,),),
                         ),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                Text(a[index]["text1"]),
                                Text(a[index]["text2"]),
                                 ],
                               )
                    ]
                        )
                      )
                    );
                        },
                      separatorBuilder: (BuildContext context, int index){
                        return SizedBox(height: w*0.03,);
                      },
                       ),
                  ),
                  SizedBox(height: w*0.05,),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => protectPage(),));
                    },
                    child: Center(
                      child: Container(
                        child: Center(
                          child: Text("Continue",
                          style: TextStyle(
                            fontSize: w*0.052,
                            fontWeight: FontWeight.w600,
                            color: colorPage.secondaryColor
                          ),),
                        ),
                        height: w*0.15,
                        width: w*0.85,
                        decoration: BoxDecoration(
                          color: colorPage.primaryColor,
                          borderRadius: BorderRadius.circular(w*0.1),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2,
                              spreadRadius: 2,
                              color: colorPage.black.withOpacity(0.15),
                              offset: Offset(0, 4)
                            )
                          ]
                        ),
                      ),
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
