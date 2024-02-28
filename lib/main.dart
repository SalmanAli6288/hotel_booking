import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking/content/ticket_page.dart';
import 'package:hotel_booking/countTest/count_page.dart';
import 'package:hotel_booking/intro/splash_screen.dart';
import 'package:hotel_booking/riverpod_directory/provider_page.dart';
import 'package:hotel_booking/riverpod_directory/stateful_stateless.dart';

import 'auth/login_page.dart';
import 'auth/opening_page.dart';
import 'auth/profile_page.dart';
import 'auth/account_page.dart';
import 'content/calender_page.dart';
import 'content/cancel_hotel_booking.dart';
import 'content/home_page.dart';
import 'content/bottom_navigation.dart';
import 'content/kezia_edit_profile.dart';
import 'content/kezia_profile.dart';
import 'content/lock_page.dart';
import 'content/my_book.dart';
import 'content/my_booking1.dart';
import 'content/name_of_reservation.dart';
import 'content/new_card.dart';
import 'content/newpassword_page.dart';
import 'content/notification_page.dart';
import 'content/payment_2.dart';
import 'content/payment_method.dart';
import 'content/payment_of_hotel.dart';
import 'content/presidential_hotel.dart';
import 'content/protect_page.dart';
import 'content/recently-booked.dart';
import 'content/search_page.dart';
import 'content/security_page.dart';
import 'intro/onbody_content.dart';
import 'intro/onbody_screen_1.dart';

var height;
var w;
var currentUserName;
var currentUserId;
var currentUserEmail;
var currentUserImage;
var currentUserPhone;
var currentUserStatus;

final nameProvider = Provider ((ref){return "Salman"; });

final countProvider=StateProvider((ref) => 0);

Future<bool> showAlert(BuildContext context,String message)async{

  //bool value = false;

  bool value = await showDialog(context: context, builder: (context) {
    return AlertDialog(
      title: Text("Are you sure"),
      content: Text(message),

      actions: [
        TextButton(onPressed: (){
          Navigator.of(context,rootNavigator: true).pop(false);


        }, child: Text("Cancel")),

        TextButton(onPressed: (){


          Navigator.of(context,rootNavigator: true).pop(true);


        }, child: Text("Ok")),

      ],
    );
  });
  print(value);
  return value;


}


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      ProviderScope(
          child: myApp()));
}
class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    w=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.urbanistTextTheme()
        ),
        debugShowCheckedModeBanner: false,
        home: TestPage()
      ),
    );
  }
}

