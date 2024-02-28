import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/auth/login_page.dart';
import 'package:hotel_booking/color_page.dart';
import 'package:hotel_booking/image_page.dart';

import '../main.dart';
import 'kezia_profile.dart';

class editProfile extends StatefulWidget {
  final String name;
  final String email;
  const editProfile({super.key, required this.name, required this.email});

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  TextEditingController fullName=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController dob=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController gender=TextEditingController();
  final phoneValidation=RegExp(r"[0-9]{10}");
  final emailValidation=RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  String? chooseitem;
  final formKey=GlobalKey<FormState>();
  var listitem=[
    "male",
    "female",
    "other"
  ];

  getprofileData(){
    Map<String, dynamic> updateinfo = {
      'name':fullName.text,
      'email':email.text,
      "phone":phone.text,
      "image":currentUserImage
    };
    FirebaseFirestore.instance.collection("bolu").doc(currentUserId).update(updateinfo);
    Navigator.pop(context);
  }



@override
  void initState() {

    fullName.text = currentUserName.toString();
    email.text =currentUserEmail.toString();
    phone.text=currentUserPhone.toString();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPage.secondaryColor,
        leading: Container(
          height: w * 0.5,
          width: w * 0.5,
          padding: EdgeInsets.all(w * 0.02),
          child: InkWell(
              onTap: () {
                Navigator.pop(context,MaterialPageRoute(builder: (context) => keziaProfile(),));
              },
              child: SvgPicture.asset(imagePage.leftarrow)),
        ),
        title: Text(
          "Edit Profile",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: w * 0.06,
              color: colorPage.black),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(w*0.04),
          child: Form(
            key: formKey,
            child: Container(
              height: height*0.82,
              width: w*1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      TextFormField(
                          controller: fullName,
                          textInputAction: TextInputAction.done,
                          textCapitalization: TextCapitalization.sentences,
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                              fontSize: w*0.045,
                              fontWeight: FontWeight.w500
                          ),
                          decoration: InputDecoration(
                            labelText: "Full Name",
                            fillColor: colorPage.lightgrey,
                            filled: true,
                            labelStyle: TextStyle(
                              fontSize: w*0.045,
                              fontWeight: FontWeight.w400,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: colorPage.darkGrey,
                                ),
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
                      SizedBox(height: w*0.05,),
                      TextFormField(
                          controller: password,
                          textInputAction: TextInputAction.done,
                          textCapitalization: TextCapitalization.sentences,
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                              fontSize: w*0.045,
                              fontWeight: FontWeight.w500
                          ),
                          decoration: InputDecoration(

                            labelText: "Password",
                            fillColor: colorPage.lightgrey,
                            filled: true,
                            labelStyle: TextStyle(
                              fontSize: w*0.045,
                              fontWeight: FontWeight.w400,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: colorPage.darkGrey,
                                ),
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
                      SizedBox(height: w*0.05,),
                      TextFormField(
                        onTap: () async{
                         var date=await showDatePicker (context: context, initialDate: DateTime.now(), firstDate: DateTime(1000), lastDate: DateTime(4000));
                         dob.text=date.toString().substring(0,10);
                        },
                          controller: dob,
                          textInputAction: TextInputAction.done,
                          textCapitalization: TextCapitalization.sentences,
                          keyboardType: TextInputType.datetime,
                          style: TextStyle(
                              fontSize: w*0.045,
                              fontWeight: FontWeight.w500
                          ),
                          decoration: InputDecoration(
                            suffixIcon:  Container(
                                height: w*0.03,
                                width: w*0.03,
                                padding: EdgeInsets.all(w*0.025),
                                child: SvgPicture.asset(imagePage.dob)),
                            labelText: "Date of Birth",
                            fillColor: colorPage.lightgrey,
                            filled: true,
                            labelStyle: TextStyle(
                              fontSize: w*0.045,
                              fontWeight: FontWeight.w400,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: colorPage.darkGrey,
                                ),
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
                      SizedBox(height: w*0.05,),
                      TextFormField(
                          controller: email,
                          textInputAction: TextInputAction.done,
                          textCapitalization: TextCapitalization.sentences,
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                              fontSize: w*0.045,
                              fontWeight: FontWeight.w500
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
                            suffixIcon: Container(
                                height: w*0.03,
                                width: w*0.03,
                                padding: EdgeInsets.all(w*0.025),
                                child: SvgPicture.asset(imagePage.email)),
                            labelText: "Email",
                            fillColor: colorPage.lightgrey,
                            filled: true,
                            labelStyle: TextStyle(
                              fontSize: w*0.045,
                              fontWeight: FontWeight.w400,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: colorPage.darkGrey,
                                ),
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
                      SizedBox(height: w*0.05,),
                      TextFormField(
                        controller: phone,
                        // textCapitalization: TextCapitalization.sentences,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        // obscureText: true,
                        // obscuringCharacter: "#",
                        // maxLines: 5,
                        // minLines: 3,
                        maxLength: 10,
                        style: TextStyle(
                            fontSize: w*0.045,
                            fontWeight: FontWeight.w500
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if(
                          !phoneValidation.hasMatch(value!)
                          ){
                            return "Enter valid number";
                          }else{
                            return null;
                          }

                        },
                        decoration: InputDecoration(
                          counterText: "",
                          prefixIcon:  CountryCodePicker(
                            onChanged: print,
                            // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                            initialSelection: 'IT',
                            favorite: ['+54','Ar'],
                            // optional. Shows only country name and flag
                            showCountryOnly: false,
                            // optional. Shows only country name and flag when popup is closed.
                            showOnlyCountryWhenClosed: false,
                            // optional. aligns the flag and the Text left
                            alignLeft: false,
                          ),
                          filled: true,
                          fillColor: colorPage.lightgrey,
                          // Container(
                          //   height: width*0.03,
                          //   width: width*0.03,
                          //   margin: EdgeInsets.only(left: width*0.02),
                          //   //padding: EdgeInsets.only(left: width*0.045),
                          //   child: SvgPicture.asset(imagePage.nigeria),
                          // ),
                          labelText: "Phone Number",
                          labelStyle: TextStyle(
                              fontSize: w*0.045,
                              fontWeight: FontWeight.w500
                          ),
                          hintText: "Please enter your number",
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
                          //   focusedBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(
                          //       color: Colors.blue,
                          //     ),
                          //     borderRadius: BorderRadius.circular(width*0.03)
                          //
                          // ),
                        ),


                      ),
                      SizedBox(height: w*0.05,),
                      Container(
                        height: w*0.16,
                        padding: EdgeInsets.only(left: 16, right: 16),
                        decoration: BoxDecoration(
                            color: colorPage.lightgrey,
                            border: Border.all(color: Colors.grey,width: 1),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: DropdownButton(
                          hint: Text("Gender",
                            style: TextStyle(
                                fontSize: w*0.045,
                                fontWeight: FontWeight.w300
                            ),),
                          dropdownColor: colorPage.secondaryColor,
                          icon: SvgPicture.asset(imagePage.downarow,height: w*0.07,width: w*0.07,),
                          isExpanded: true,
                          underline: SizedBox(),
                          style: TextStyle(
                            color: colorPage.black,
                            fontSize: w*0.055,
                          ),
                          value: chooseitem,
                          items: listitem.map((valueItem){
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          },).toList(),
                          onChanged: (newValue){
                            setState(() {
                              chooseitem=newValue;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  //SizedBox(height: w*0.05,),
                  InkWell(
                    onTap: () {
                      if(
                      fullName.text!=""&&
                      password.text!=""&&
                      dob.text!=""&&
                      email.text!=""&&
                      phone.text!=""&&
                       chooseitem!=null&&
                      formKey.currentState!.validate()
                      ){
                        getprofileData();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("submitted successfull")));
                      }else{
                        fullName.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter Name"))):
                        password.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter password"))):
                        dob.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter Dob"))):
                        email.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter Email"))):
                        phone.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter Number"))):
                        chooseitem==null?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please select Gender"))):
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter details")));
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
                      child: Center(child: Text("Update",
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
            ),
          ),

        ),

      ),
    );
  }
}
