import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_order_app/services/signUpServices.dart';
import 'package:food_order_app/widgets/text_field.dart';

class SignUp extends StatelessWidget {
  TextEditingController Name = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Mobile = TextEditingController();
  User? currentUser = FirebaseAuth.instance.currentUser;
  final globalScaffoldKey = GlobalKey<ScaffoldMessengerState>();

  void validation() {
    if (Password.text.trim().isEmpty || Password.text.trim() == null) {
      globalScaffoldKey.currentState?.showSnackBar(SnackBar(
        content: Text("Password is empty"),
        duration: Duration(seconds: 3),
      ));
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                )),
            Column(
              key: globalScaffoldKey,
              children: [
                MyTextField(
                  controller: Name,
                  hintText: "Name",
                  obscureText: false,
                ),
                SizedBox(
                  height: 30,
                ),
                MyTextField(
                  hintText: "Password",
                  obscureText: true,
                  controller: Password,
                ),
                SizedBox(
                  height: 30,
                ),
                MyTextField(
                    hintText: "Email Id",
                    obscureText: false,
                    controller: Email),
                SizedBox(
                  height: 30,
                ),
                MyTextField(
                    hintText: "Mobile number",
                    obscureText: false,
                    controller: Mobile),
              ],
            ),
            Center(
              child: Container(
                height: 60,
                width: 200,
                child: ElevatedButton(
                  onPressed: () async {
                    var userName = Name.text.trim();
                    var userPhone = Mobile.text.trim();
                    var userEmail = Email.text.trim();
                    var userPassword = Password.text.trim();

                    await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                        email: userEmail, password: userPassword)
                        .then((value) => {
                      log("User created"),
                      signUpUser(
                          userName, userPhone, userEmail, userPassword)
                    });
                  },
                  child: Text('Sign Up'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
