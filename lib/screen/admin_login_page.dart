import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:food_order_app/screen/add_new_food.dart';
import 'package:food_order_app/screen/welcome_page.dart';
import 'package:food_order_app/widgets/text_field.dart';
import 'package:get/get.dart';


class adminLoginPage extends StatelessWidget {



    final _formkey = GlobalKey<FormState>();
  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPassword = TextEditingController();

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
                  'LOG IN',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                )),
            Column(
              children: [
                MyTextField(
                    hintText: "Email",
                    obscureText: false,
                    controller: loginEmail),
                SizedBox(
                  height: 30,
                ),
                MyTextField(
                  hintText: "Password",
                  obscureText: true,
                  controller: loginPassword,
                ),
              ],
            ),
            Center(
              child: Container(
                height: 60,
                width: 200,
                child: ElevatedButton(
                  onPressed: () async {
                    var logEmail = loginEmail.text.trim();
                    var logPassword = loginPassword.text.trim();
                    signIn(logEmail, logPassword);
                  },
                  child: Text('Log In'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
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

  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('roll') == "admin") {
          Get.to(() => AddFood());
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  void signIn(String email, String password) async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      route();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}