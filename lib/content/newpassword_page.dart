import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking/auth/login_page.dart';
import 'package:hotel_booking/color_page.dart';
import 'package:hotel_booking/image_page.dart';

import '../main.dart';
class newPasswordPage extends StatefulWidget {
  const newPasswordPage({super.key});

  @override
  State<newPasswordPage> createState() => _newPasswordPageState();
}

class _newPasswordPageState extends State<newPasswordPage> {
  bool checkbox1=false;
  bool visibility=true;
  bool visibility2=true;
  TextEditingController password=TextEditingController();
  TextEditingController newpassword=TextEditingController();
  final passwordValidation=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  final formKey=GlobalKey<FormState>();
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
        title: Text("Create New Password",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: w*0.06,
              color: colorPage.black
          ),),
        elevation: 0,
      ),
      body: Padding(
        padding:  EdgeInsets.all(w*0.08),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Container(
              height: height*0.8,
              width: w*1,
              child: Column(

                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: w*0.05,),
                      Text("Create Your New Password"),
                      SizedBox(height: w*0.04,),
                      TextFormField(
                          textInputAction: TextInputAction.done,
                          controller: password,
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                            fontSize: w*0.045,
                            fontWeight: FontWeight.w500,
                          ),
                          obscureText: visibility?true:false,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value){
                            if(
                            !passwordValidation.hasMatch(value!)){
                              return "enter password";
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
                            labelText: "New Password",
                            labelStyle: TextStyle(
                              fontSize: w*0.045,
                              fontWeight: FontWeight.w500,

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
                          )
                      ),
                      SizedBox(height: w*0.04,),
                      TextFormField(
                          textInputAction: TextInputAction.done,
                          controller: newpassword,
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                            fontSize: w*0.045,
                            fontWeight: FontWeight.w500,
                          ),
                          obscureText: visibility2?true:false,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value){
                            if(
                            !passwordValidation.hasMatch(value!)){
                              return "enter new password";
                            }else{
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: colorPage.lightgrey,
                            prefixIcon: InkWell(
                                onTap: () {
                                  visibility2=!visibility2;
                                  setState(() {

                                  });
                                },
                                child: Icon(visibility2?Icons.visibility_off:Icons.visibility)),
                            labelText: "Re-enter new Password",
                            labelStyle: TextStyle(
                              fontSize: w*0.045,
                              fontWeight: FontWeight.w500,

                            ),
                            hintText: "Please enter New password",
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
                          )
                      ),
                      SizedBox(height:w*0.035),
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
                      SizedBox(height:w*0.05),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              if(
                              newpassword.text!=""&&
                                  password.text!=""&&
                                  password.text==newpassword.text&&
                                  formKey.currentState!.validate()
                              ){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => loginPage(),));


                              }else{
                                password.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter New password"))):
                                newpassword.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Re-enter your new password"))):
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter Same password")));
                              }

                            },
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
                              child: Center(child: Text("Continue",
                                style: TextStyle(
                                    color: colorPage.secondaryColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: w*0.038
                                ),
                              )),
                            ),
                          ),
                        ],
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
