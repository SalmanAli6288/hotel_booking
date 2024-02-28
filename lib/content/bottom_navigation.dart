import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/auth/profile_page.dart';
import 'package:hotel_booking/color_page.dart';
import 'package:hotel_booking/content/home_page.dart';
import 'package:hotel_booking/content/kezia_profile.dart';
import 'package:hotel_booking/content/search_page.dart';
import 'package:hotel_booking/image_page.dart';

import 'cancel_hotel_booking.dart';
import 'my_booking1.dart';
import 'name_of_reservation.dart';
import 'newpassword_page.dart';

class bottomNavigation extends StatefulWidget {
  const bottomNavigation({super.key});

  @override
  State<bottomNavigation> createState() => _bottomNavigationState();
}

class _bottomNavigationState extends State<bottomNavigation> {
  int selectIndex=0;
  List pages=[
    homePage(),
    searchPage(),
    myBooking(),
    keziaProfile()

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectIndex,
          selectedItemColor: colorPage.primaryColor,
          unselectedItemColor: colorPage.black,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: (value) {
            selectIndex=value;
            setState(() {

            });
          },
          items:[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Search"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_sharp),
                label: "Booking"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Account"
            ),
          ]
      ),
    );
  }
}
