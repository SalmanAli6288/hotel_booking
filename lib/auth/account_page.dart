import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hotel_booking/auth/profile_page.dart';
import 'package:hotel_booking/color_page.dart';
import 'package:hotel_booking/image_page.dart';
import 'package:hotel_booking/main.dart';

import '../content/bottom_navigation.dart';
import 'login_page.dart';
import 'opening_page.dart';

class accountPage extends StatefulWidget {
  const accountPage({super.key});

  @override
  State<accountPage> createState() => _accountPageState();
}

class _accountPageState extends State<accountPage> {

  User? user;

  TextEditingController username = TextEditingController();

  bool checkbox1=false;
  bool visibility=true;
TextEditingController emailController=TextEditingController();
TextEditingController  passwordController=TextEditingController();
final emailValidation=RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final passwordValidation=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  final formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPage.secondaryColor,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context, MaterialPageRoute(builder:(context) => openingPage(),));
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
          padding: EdgeInsets.all(w*0.03),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Padding(
                padding:  EdgeInsets.all(w*0.025),
                child: Container(
                  height: height*0.82,
                  width: w*1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                     SizedBox(height: w*0.04,),
                      Text("Create your Account",
                      style: TextStyle(
                        fontSize:w*0.11,
                        fontWeight: FontWeight.w700,
                      ),),
                      SizedBox(height: w*0.05,),
                      Column(
                        children: [
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

                              prefixIcon: Container(
                                  height: w*0.03,
                                  width: w*0.03,
                                  padding: EdgeInsets.all(w*0.025),
                                  child: SvgPicture.asset(imagePage.email)),
                              labelText:"Email",
                                filled: true,
                                fillColor: colorPage.lightgrey,
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
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if(
                                !passwordValidation.hasMatch(value!)
                                ){
                                  return "Enter valid password";
                                }else{
                                  return null;
                                }

                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: colorPage.lightgrey,
                                prefixIcon: InkWell(
                                    onTap: () {
                                      visibility=!visibility;
                                      setState(() {

                                      });
                                    },
                                    child: Icon(visibility?Icons.visibility_off:Icons.visibility)),
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
                          SizedBox(height: w*0.03,),
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
                        ],
                      ),
                      SizedBox(height: w*0.05,),
                      InkWell(
                        onTap: () {
                          if(
                          emailController.text!=""&&
                              passwordController.text!=""&&
                          formKey.currentState!.validate()
                          ){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>profilePage(googleSignIn: false,)));
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Submitted Successfully")));
                          }else{
                            emailController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter Email"))):
                            passwordController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter Password"))):
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter valid Details")));
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
                            child: Center(child: Text("Sign up",
                              style: TextStyle(
                                  color: colorPage.secondaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: w*0.038
                              ),
                            )),
                          ),
                        ),
                      ),
                      Container(
                        height: w*0.28,
                        width: w*1,
                       // color: Colors.red,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Divider(
                                height: w*0.4,
                                indent: w*0.09,
                                endIndent: w*0.03,
                                thickness: w*0.003,
                                color: colorPage.black.withOpacity(0.25),
                              ),
                            ),
                            Text("or continue with"),
                            Expanded(
                              child: Divider(
                                height: w*0.4,
                                indent: w*0.03,
                                endIndent: w*0.09,
                                thickness: w*0.003,
                                color: colorPage.black.withOpacity(0.25),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      SizedBox(height: w*0.05,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don’t have an account?"),
                          Text(" Sign up",
                            style: TextStyle(
                                color: colorPage.primaryColor
                            ),),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
