import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking/auth/account_page.dart';
import 'package:hotel_booking/color_page.dart';
import 'package:hotel_booking/image_page.dart';

import '../main.dart';
import 'login_page.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key, required this.googleSignIn});

  // final currentUserid;
  final bool googleSignIn;

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController dobcontroller = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  final phoneValidation = RegExp(r"[0-9]{10}");
  final emailValidation = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final formKey = GlobalKey<FormState>();

  String imgUrl = 'https://cdn.pixabay.com/photo/2017/02/07/02/16/cloud-2044823_960_720.png';

  getcreateaccountdata() {
    FirebaseFirestore.instance.collection("bolu").doc(emailController.text).set({
      "name": namecontroller.text,
      "Password": passwordcontroller.text,
      "email": emailController.text,
      "phone": numberController.text,
      "image": imgUrl
    });
    Navigator.push(context, MaterialPageRoute(builder: (context) => loginPage()));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Submitted Successfully")));
  }

  String? chooseitem;

  var listitem = ["male", "female", "other"];

  @override
  void initState() {
    if (widget.googleSignIn == true) {
      emailController.text = user!.email.toString();
      namecontroller.text = user!.displayName.toString();
      imgUrl = user!.photoURL.toString();
    }

    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPage.secondaryColor,
        leading: InkWell(
          onTap: () {
            Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => accountPage(),
                ));
          },
          child: Container(
            padding: EdgeInsets.all(w * 0.025),
            height: w * 0.01,
            width: w * 0.01,
            child: SvgPicture.asset(
              imagePage.leftarrow,
              color: colorPage.black,
              height: w * 0.01,
              width: w * 0.01,
            ),
          ),
        ),
        title: Text(
          "Fill Your Profile",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: w * 0.06,
              color: colorPage.black),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(w * 0.03),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Container(
              width: w * 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: w * 0.05,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(imgUrl),
                          radius: 60,
                        ),
                      ),
                      Text(widget.googleSignIn.toString()),
                      TextFormField(
                          controller: namecontroller,
                          textCapitalization: TextCapitalization.sentences,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          style: TextStyle(
                              fontSize: w * 0.045, fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: colorPage.lightgrey,
                            labelText: "Name",
                            labelStyle: TextStyle(
                                fontSize: w * 0.045,
                                fontWeight: FontWeight.w500),
                            hintText: "Please enter your name",
                            hintStyle: TextStyle(
                              fontSize: w * 0.045,
                              fontWeight: FontWeight.w500,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(w * 0.03)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ),
                                borderRadius: BorderRadius.circular(w * 0.03)),
                          )),
                      SizedBox(
                        height: w * 0.025,
                      ),
                      TextFormField(
                          onTap: () async {
                            var date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1000),
                                lastDate: DateTime(3000));

                            dobcontroller.text =
                                date.toString().substring(0, 10);
                          },
                          controller: dobcontroller,
                          textCapitalization: TextCapitalization.sentences,
                          keyboardType: TextInputType.datetime,
                          textInputAction: TextInputAction.done,
                          style: TextStyle(
                              fontSize: w * 0.045, fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: colorPage.lightgrey,
                            labelText: "Date of Birth",
                            suffixIcon: Container(
                                height: w * 0.03,
                                width: w * 0.03,
                                padding: EdgeInsets.all(w * 0.025),
                                child: SvgPicture.asset(imagePage.dob)),
                            labelStyle: TextStyle(
                                fontSize: w * 0.045,
                                fontWeight: FontWeight.w500),
                            hintText: "enter your DOB",
                            hintStyle: TextStyle(
                              fontSize: w * 0.045,
                              fontWeight: FontWeight.w500,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(w * 0.03)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ),
                                borderRadius: BorderRadius.circular(w * 0.03)),
                          )),
                      SizedBox(
                        height: w * 0.025,
                      ),
                      TextFormField(
                        readOnly: widget.googleSignIn,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (!emailValidation.hasMatch(value!)) {
                            return "enter valid email";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: colorPage.lightgrey,
                            suffixIcon: Container(
                                height: w * 0.03,
                                width: w * 0.03,
                                padding: EdgeInsets.all(w * 0.025),
                                child: SvgPicture.asset(imagePage.email)),
                            labelText: "Email",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: w * 0.045,
                            ),
                            hintText: "please enter your email",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: w * 0.045,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: colorPage.black,
                              ),
                              borderRadius: BorderRadius.circular(
                                w * 0.03,
                              ),
                            )),
                      ),
                      SizedBox(
                        height: w * 0.025,
                      ),
                      TextFormField(
                          controller: passwordcontroller,
                          textCapitalization: TextCapitalization.sentences,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          style: TextStyle(
                              fontSize: w * 0.045, fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: colorPage.lightgrey,
                            labelText: "Password",
                            labelStyle: TextStyle(
                                fontSize: w * 0.045,
                                fontWeight: FontWeight.w500),
                            hintText: "Please enter your password",
                            hintStyle: TextStyle(
                              fontSize: w * 0.045,
                              fontWeight: FontWeight.w500,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(w * 0.03)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ),
                                borderRadius: BorderRadius.circular(w * 0.03)),
                          )),
                      SizedBox(
                        height: w * 0.025,
                      ),
                      TextFormField(
                        controller: numberController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        // obscureText: true,
                        // obscuringCharacter: "#",
                        // maxLines: 5,
                        // minLines: 3,
                        //maxLength: 10,
                        style: TextStyle(
                            fontSize: w * 0.045, fontWeight: FontWeight.w500),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (!phoneValidation.hasMatch(value!)) {
                            return "Enter valid number";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: CountryCodePicker(
                            onChanged: print,
                            // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                            initialSelection: 'IT',
                            favorite: ['+54', 'Ar'],
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
                              fontSize: w * 0.045, fontWeight: FontWeight.w500),
                          hintText: "Please enter your number",
                          hintStyle: TextStyle(
                            fontSize: w * 0.045,
                            fontWeight: FontWeight.w500,
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(w * 0.03)),
                          //   focusedBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(
                          //       color: Colors.blue,
                          //     ),
                          //     borderRadius: BorderRadius.circular(width*0.03)
                          //
                          // ),
                        ),
                      ),
                      SizedBox(
                        height: w * 0.025,
                      ),
                      Container(
                        height: w * 0.16,
                        padding: EdgeInsets.only(left: 16, right: 16),
                        decoration: BoxDecoration(
                            color: colorPage.lightgrey,
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15)),
                        child: DropdownButton(
                          hint: Text(
                            "Gender",
                            style: TextStyle(
                                fontSize: w * 0.045,
                                fontWeight: FontWeight.w300),
                          ),
                          dropdownColor: colorPage.secondaryColor,
                          icon: SvgPicture.asset(
                            imagePage.downarow,
                            height: w * 0.07,
                            width: w * 0.07,
                          ),
                          isExpanded: true,
                          underline: SizedBox(),
                          style: TextStyle(
                            color: colorPage.black,
                            fontSize: w * 0.055,
                          ),
                          value: chooseitem,
                          items: listitem.map(
                            (valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem),
                              );
                            },
                          ).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              chooseitem = newValue;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: w * 0.05,
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          if (namecontroller.text != "" &&
                              passwordcontroller.text != "" &&
                              dobcontroller.text != "" &&
                              emailController.text != "" &&
                              numberController.text != "" &&
                              chooseitem != null &&
                              formKey.currentState!.validate())
                          {
                            getcreateaccountdata();
                          } else {
                            numberController.text == "" ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter your name"))) :
                            passwordcontroller.text == "" ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter your nickname"))) :
                            dobcontroller.text == "" ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter your dob"))) :
                            emailController.text == "" ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter your Email"))) :
                            numberController.text == "" ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter your Number"))) :
                            chooseitem == null ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter your gender"))) :
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter valid details")));
                          }
                        },
                        child: Center(
                          child: Container(
                            height: w * 0.13,
                            width: w * 0.8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(w * 0.1),
                                color: colorPage.primaryColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: colorPage.black.withOpacity(0.15),
                                      blurRadius: 2,
                                      spreadRadius: 2,
                                      offset: Offset(0, 4))
                                ]),
                            child: Center(
                                child: Text(
                              "Sign up",
                              style: TextStyle(
                                  color: colorPage.secondaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: w * 0.038),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(height: w*0.1,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
