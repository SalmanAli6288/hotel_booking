import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hotel_booking/auth/account_page.dart';
import 'package:hotel_booking/auth/profile_page.dart';
import 'package:hotel_booking/color_page.dart';
import 'package:hotel_booking/content/bottom_navigation.dart';
import 'package:hotel_booking/content/lock_page.dart';
import 'package:hotel_booking/image_page.dart';
import 'package:hotel_booking/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key,});

  @override
  State<loginPage> createState() => _loginPageState();
}
signInWithGoogle(context) async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  // Once signed in, return the UserCredential
  final userCredential= await FirebaseAuth.instance.signInWithCredential(credential);
  user = userCredential.user;


  currentUserName=user?.displayName;
  currentUserEmail=user?.email;
  currentUserImage=user!.photoURL!;

  QuerySnapshot loginData = await FirebaseFirestore.instance.collection('bolu').where('email', isEqualTo: currentUserEmail).get();
    if (loginData!.docs.isEmpty) {
      Navigator.push(context, CupertinoPageRoute(builder: (context) => profilePage(googleSignIn: true,)), );
    }else{
      // var pass=loginData!.docs[0]['password'];
      // print(pass);
      // if(password.text==pass){

      if(currentUserStatus=loginData.docs[0]["block"]==true){
        showDialog(context: context, builder: (context) =>
          AlertDialog(
            title: Text("u have been blocked"),
            actions: [
              TextButton(onPressed: () {
                GoogleSignIn().signOut();
                Navigator.pop(context);
              }, child: Text("ok"))
            ],
          ),);
        return;
      }

      Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => bottomNavigation()), (route) => false);
      // }else{
      //   return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("incorrect password")));
      // }
    }
}

User? user;

class _loginPageState extends State<loginPage> {

  TextEditingController username = TextEditingController();



  getDataofCreateaccount() async {
    QuerySnapshot loginData = await FirebaseFirestore.instance.collection('bolu').where('email', isEqualTo: emailController.text).get();

    if (loginData.docs.isEmpty) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => profilePage(googleSignIn: false),));
    }else{
      currentUserName=loginData.docs[0]["name"];
      currentUserEmail=loginData.docs[0]["email"];
      currentUserImage=loginData.docs[0]["image"];
      currentUserId=loginData.docs[0].id??"";
      currentUserPhone=loginData.docs[0]["phone"];

      if(currentUserStatus=loginData.docs[0]["block"]==true){

        showDialog(context: context, builder: (context) =>
          AlertDialog(
            title: Text("You have been blocked"),
            actions: [
              TextButton(onPressed:() {
                Navigator.pop(context);
              }, child: Text("ok"))
            ],
          ),
        );
        return;
      }

      Navigator.push(context, MaterialPageRoute(builder: (context) => bottomNavigation(),));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Submitted successfully")));

    }



    //   return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No user found")));
    // }else{
    //   var pass=loginData!.docs[0]['password'];
    //   print(pass);
    //
    //   if(passwordController.text==pass){
    //     Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => bottomNavigation()), (route) => false);
    //   }else{
    //     return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("incorrect password")));
    //   }
    // }
  }

  bool checkbox1=false;
  bool visibility=true;

  TextEditingController emailController=TextEditingController();
  TextEditingController  passwordController=TextEditingController();

  final emailValidation=RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  // final passwordValidation=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])');
  final formKey=GlobalKey<FormState>();


  // keepLoginName() async {
  //   SharedPreferences name = await SharedPreferences.getInstance();
  //   name.setString("name", username.text);
  // }

  // getData() async {
  //   QuerySnapshot loginData = await FirebaseFirestore.instance.collection('user').where('email', isEqualTo: username.text).get();
  //
  //   if (loginData!.docs.isEmpty) {
  //     return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No user found")));
  //   }else{
  //     var pass=loginData!.docs[0]['password'];
  //     print(pass);
  //
  //     if(password.text==pass){
  //       Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => helloUser1()), (route) => false);
  //     }else{
  //       return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("incorrect password")));
  //     }
  //   }
  // }


   loginData(){
    FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((value) async {
      // QuerySnapshot loginData = await FirebaseFirestore.instance.collection('user').where('email', isEqualTo: username.text).get();

      Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => bottomNavigation()), (route) => false);

    }).catchError((e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.code)));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPage.secondaryColor,
        leading: InkWell(
          onTap: () {
            // Navigator.pop(context, MaterialPageRoute(builder:(context) => profilePage(googleSignIn: false),));
          },
          child: Container(
            padding: EdgeInsets.all(w*0.025),
            height: w*0.01,
            width: w*0.01,
            child: SvgPicture.asset(imagePage.leftarrow,
              color: colorPage.black,
              height: w*0.01,
              width: w*0.01,),
          ),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(w*0.05),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: w*0.1,),
                      Text("Login to your Account",
                        style: TextStyle(
                          fontSize:w*0.11,
                          fontWeight: FontWeight.w700,
                        ),),
                      SizedBox(height: w*0.1,),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value){
                          if(
                          !emailValidation.hasMatch(value!)
                          ){
                            return"enter valid email";
                          }else{
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: colorPage.lightgrey,
                            prefixIcon: Container(
                                height: w*0.03,
                                width: w*0.03,
                                padding: EdgeInsets.all(w*0.025),
                                child: SvgPicture.asset(imagePage.email,color: colorPage.black,)),
                            labelText:"Email",
                            labelStyle:TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize:w*0.045,
                            ),
                            hintText: "please enter your email",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: w*0.045,
                            ),
                            border: OutlineInputBorder(
                              borderSide:BorderSide(
                                color: colorPage.black,
                              ),
                              borderRadius: BorderRadius.circular(w*0.03,),
                            )
                        ),
                      ),
                      SizedBox(height: w*0.05,),
                      TextFormField(
                          controller: passwordController,
                          // textCapitalization: TextCapitalization.sentences,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          obscureText: visibility?true:false,
                          // obscuringCharacter: "#",
                          // maxLines: 5,
                          // minLines: 3,
                          // maxLength: 8,
                          style: TextStyle(
                              fontSize: w*0.045,
                              fontWeight: FontWeight.w500
                          ),
                          // autovalidateMode: AutovalidateMode.onUserInteraction,
                          // validator: (value) {
                          //   if(
                          //   !passwordValidation.hasMatch(value!)
                          //   ){
                          //     return "Enter valid password";
                          //   }else{
                          //     return null;
                          //   }
                          //
                          // },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: colorPage.lightgrey,
                            prefixIcon: InkWell(
                                onTap: () {
                                  visibility=!visibility;
                                  setState(() {

                                  });
                                },
                                child: Icon(visibility?Icons.visibility_off:Icons.visibility,  color: colorPage.black,)),
                            // prefixText: "madakkana",
                            // prefixStyle: ,
                            labelText: "Password",
                            labelStyle: TextStyle(
                                fontSize: w*0.045,
                                fontWeight: FontWeight.w500
                            ),
                            hintText: "Please enter your password",
                            hintStyle: TextStyle(
                              fontSize: w*0.045,
                              fontWeight: FontWeight.w500,
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(w*0.03)

                            ),
                            // focusedBorder: OutlineInputBorder(
                            //     borderSide: BorderSide(
                            //       color: Colors.blue,
                            //     ),
                            //     borderRadius: BorderRadius.circular(width*0.03)
                            //
                            // ),
                          )
                      ),
                      SizedBox(height: w*0.04,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(w*0.01),
                            ),
                            side: BorderSide(color: colorPage.primaryColor),
                            activeColor: colorPage.primaryColor,
                            value: checkbox1,
                            onChanged: (value) {
                              setState(() {
                                checkbox1=value!;
                              });
                            },

                          ),
                          Text("Remember me"),
                        ],
                      ),
                      SizedBox(height: w*0.04,),
                      InkWell(
                        onTap: () {
                          if(
                          emailController.text!=""&&
                          passwordController.text!=""&&
                          formKey.currentState!.validate()
                          ){
                            getDataofCreateaccount();
                            // FirebaseFirestore.instance.collection("bolu").add({
                            //   "email":emailController.text,
                            //   "password":passwordController.text
                            // });
                          }else{
                            emailController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter your Email"))):
                            passwordController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter your Password"))):
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter valid details")));
                          }

                        },
                        child: Center(
                          child: Container(
                            height: w*0.13,
                            width: w*0.8,
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
                            child: Center(child: Text("Sign in",
                              style: TextStyle(
                                  color: colorPage.secondaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: w*0.038
                              ),
                            )),
                          ),
                        ),
                      ),
                      SizedBox(height: w*0.05,),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => lockPage(),));
                        },
                        child: Center(
                            child: Text("Forgot password?",
                        style: TextStyle(
                          color: colorPage.primaryColor
                        ),)),
                      ),
                      SizedBox(height: w*0.1,),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Divider(
                              // height: width*0.4,
                              indent: w*0.09,
                              endIndent: w*0.03,
                              thickness: w*0.003,
                              color: colorPage.black.withOpacity(0.25),
                            ),
                          ),
                          Text("or continue with"),
                          Expanded(
                            child: Divider(
                              // height: width*0.4,
                              indent: w*0.03,
                              endIndent: w*0.09,
                              thickness: w*0.003,
                              color: colorPage.black.withOpacity(0.25),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: w*0.1,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: w*0.18,
                            width: w*0.25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(w*0.03),
                                border: Border.all(color: colorPage.darkGrey)
                            ),
                            child: Center(child: SvgPicture.asset(imagePage.facebook,height: w*0.1,width: w*0.1)),
                          ),
                          InkWell(
                            onTap: () {
                              signInWithGoogle(context);
                            },
                            child: Container(
                              height: w*0.18,
                              width: w*0.25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(w*0.03),
                                  border: Border.all(color: colorPage.darkGrey)
                              ),
                              child: Center(child: SvgPicture.asset(imagePage.google,height: w*0.1,width: w*0.1)),
                            ),
                          ),
                          Container(
                            height: w*0.18,
                            width: w*0.25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(w*0.03),
                                border: Border.all(color: colorPage.darkGrey)
                            ),
                            child: Center(child: SvgPicture.asset(imagePage.apple,height: w*0.1,width: w*0.1)),
                          ),
                        ],
                      ),
                      SizedBox(height: w*0.08,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don’t have an account?"),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => profilePage(googleSignIn: false),));
                            },
                            child: Text(" Sign up",
                              style: TextStyle(
                                  color: colorPage.primaryColor
                              ),),
                          ),
                        ],
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
