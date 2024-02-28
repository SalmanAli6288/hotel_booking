import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/color_page.dart';
import 'package:hotel_booking/intro/onbody_content.dart';
import 'package:hotel_booking/main.dart';

import 'splash_screen_2.dart';

class onBodyScreen1 extends StatefulWidget {
  const onBodyScreen1({super.key});

  @override
  State<onBodyScreen1> createState() => _onBodyScreen1State();
}

class _onBodyScreen1State extends State<onBodyScreen1> {
  int currentindex=0;
  PageController controller=PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: height*1.1,
                width: w*1,
                child: PageView.builder(
                  controller: controller,
                  padEnds: false,
                  itemCount: content.length,
                  onPageChanged:(int index) {
                    setState(() {
                      currentindex=index;
                    });
                  },
                  itemBuilder:(context, index) {
                    return Column(
                      children: [
                        Container(
                          height: w*1.48,
                          width: w*1,
                        //  color: Colors.red,
                          child: Stack(
                            children: [
                              Container(
                              height: w*1,
                              width: w*1,
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage(content[index].images))
                              ),
                            ),

                    Positioned(
                     // top: width*0.7,
                      left: w*0.05,
                      bottom: w*0.03,
                      child: Text(content [index].title,
                      style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: w*0.115,
                        color: colorPage.black
                      ),),
                    )
                            ],

                          ),
                        ),
                        SizedBox(height: w*0.01,),
                        Padding(
                          padding:EdgeInsets.all(w*0.05),
                          child: Text(content [index].description,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: w*0.033
                          ),),
                        ),
                        SizedBox(height: w*0.03,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(3,
                                  (index) => Container(
                                    margin: EdgeInsets.all(w*0.004),
                                    height: w*0.03,
                                    width: currentindex==index?w*0.09:w*0.04,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(w*0.02),
                                      color: currentindex==index?colorPage.primaryColor:colorPage.lightGreen
                                    ),
                          )),
                        ),
                        SizedBox(height: w*0.08,),
                        InkWell(
                          onTap: () {
                            if(currentindex==2){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> splashScreen2(),
                              ));
                            }else{
                              controller.nextPage(
                                  duration: Duration(milliseconds: 100),
                                   curve: Curves.ease);
                            }
                          },
                          child: Container(
                            child: Center(child: Text(currentindex==2?"Done":"Next",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: colorPage.secondaryColor
                            ),)),
                            height: w*0.14,
                            width: w*0.8,
                            decoration: BoxDecoration(
                              color: colorPage.primaryColor,
                              borderRadius: BorderRadius.circular(w*0.4)
                            ),
                          ),
                        ),
                        SizedBox(height: w*0.08,),
                    InkWell(
                      onTap: () {
                        controller.jumpToPage(2);
                      },
                      child: Container(
                              child: Center(child: Text("Skip",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: colorPage.primaryColor
                              ),)),
                              height: w*0.14,
                              width: w*0.8,
                              decoration: BoxDecoration(
                                color: colorPage.lightGreen,
                                borderRadius: BorderRadius.circular(w*0.4)
                              ),
                            ),
                    ),
                      ],
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}
