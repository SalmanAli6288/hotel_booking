import 'package:flutter/material.dart';

import '../main.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    int count=0;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             InkWell(
               onTap: () {
                 count++;
                 print(count);
               },
               child: Container(
                 height: w*0.09,
                 width: w*0.09,
                 decoration: BoxDecoration(
                   color: Colors.red,
                   borderRadius: BorderRadius.circular(w*0.05)
                 ),
                 child: Icon(Icons.add,color: Colors.white,),
               ),
             ),
             SizedBox(width: w*0.02,),
             Text(count.toString()),
             SizedBox(width: w*0.02,),
             InkWell(
               onTap: () {
                 count--;
                 print(count);
               },
               child: Container(
                 height: w*0.09,
                 width: w*0.09,

                 decoration: BoxDecoration(
                   color: Colors.red,
                   borderRadius: BorderRadius.circular(w*0.05)
                 ),
                 child: Icon(Icons.remove,color: Colors.white,),
               ),
             )
           ],
         )
        ],
      ),
    );
  }
}
