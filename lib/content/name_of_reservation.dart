import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/color_page.dart';
import 'package:hotel_booking/content/payment_method.dart';
import 'package:hotel_booking/image_page.dart';

import '../main.dart';

class nameofReservation extends StatefulWidget {
  const nameofReservation({super.key});

  @override
  State<nameofReservation> createState() => _nameofReservationState();
}

class _nameofReservationState extends State<nameofReservation> {
  TextEditingController fullName=TextEditingController();
  TextEditingController nickName=TextEditingController();
  TextEditingController dob=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController phone=TextEditingController();
  int? selectindex;
  List a=["Mr","Mrs.","Ms"];
  final phoneValidation=RegExp(r"[0-9]{10}");
  final emailValidation=RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPage.secondaryColor,
        leading:Container(
          height: w*0.5,
          width: w*0.5,
          padding: EdgeInsets.all(w*0.02),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
              child: SvgPicture.asset(imagePage.leftarrow)),
        ) ,
        title: Text("Name of Reservation",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: w*0.06,
              color: colorPage.black
          ),),
        elevation: 0.2,
      ),
      backgroundColor: colorPage.secondaryColor,
      body: Padding(
        padding: EdgeInsets.all(w*0.03),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Container(
              height: height*0.8665,
              width: w*1,
             // color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 // SizedBox(height: w*0.05,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: w*0.085,
                        width: w*1,
                        //color: Colors.green,
                        child: ListView.separated(
                          itemCount: a.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              selectindex=index;
                              setState(() {

                              });
                            },
                            child: Container(
                              width: w*0.31,
                              height: w*0.1,
                              decoration: BoxDecoration(
                                color: selectindex==index?colorPage.primaryColor:colorPage.secondaryColor,
                                border: Border.all(color: colorPage.primaryColor),
                                borderRadius: BorderRadius.circular(w*0.04),
                              ),
                              child: Center(child: Text(a[index],style: TextStyle(fontWeight: FontWeight.w600,
                                  color: selectindex==index?colorPage.secondaryColor:colorPage.primaryColor ),
                              )),

                            ),
                          );
                        }, separatorBuilder: (BuildContext context, int index) { return SizedBox(width: w*0.03,); },
                        ),
                      ),
                    ],
                  ),
                 // SizedBox(height: w*0.02,),
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
                      SizedBox(height: w*0.03,),
                      TextFormField(
                          controller: nickName,
                          textInputAction: TextInputAction.done,
                          textCapitalization: TextCapitalization.sentences,
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                              fontSize: w*0.045,
                              fontWeight: FontWeight.w500
                          ),
                          decoration: InputDecoration(

                            labelText: "Nick Name",
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
                      SizedBox(height: w*0.03,),
                      TextFormField(
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
                      SizedBox(height: w*0.03,),
                      TextFormField(
                          controller: email,
                          textInputAction: TextInputAction.done,
                          textCapitalization: TextCapitalization.sentences,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                              fontSize: w*0.045,
                              fontWeight: FontWeight.w500
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if(!emailValidation.hasMatch(value!))
                            {
                              return "Enter valid number";
                            }else{
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(w*0.03)
                            ),
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
                      SizedBox(height: w*0.03,),
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
                      SizedBox(height: w*0.05,)
                    ],
                  ),
                  SizedBox(height: w*0.05,),
                  InkWell(
                    onTap: () {
                      if(
                      fullName.text!=""&&
                      nickName.text!=""&&
                      dob.text!=""&&
                          email.text!=""&&
                          phone.text!=""&&
                      formKey.currentState!.validate()
                      ){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => paymentMethod(),));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Submitted successfully")));
                      }else{
                        fullName.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter your Name"))):
                        nickName.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter your Nickname"))):
                        dob.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter your Dob"))):
                        email.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter your Email"))):
                        phone.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter your Phone no"))):
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter valid details")));

                      }
                    },
                    child: Container(
                      height: w*0.17,
                      width: w*0.8,
                      decoration: BoxDecoration(
                          color: Colors.green,
                        borderRadius: BorderRadius.circular(w*0.08),
                        boxShadow: [
                          BoxShadow(
                            color: colorPage.black.withOpacity(0.15),
                            offset: Offset(0, 4),
                            spreadRadius: 2,
                            blurRadius: 2,
                          )
                        ]
                      ),
                      child: Center(child: Text("Continue",
                      style: TextStyle(color: colorPage.secondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: w*0.04),)),

                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
