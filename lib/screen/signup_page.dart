import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_order_app/screen/home_page.dart';
import 'package:food_order_app/widgets/text_field.dart';

class SignUp extends StatelessWidget {
  TextEditingController Name = TextEditingController();

  TextEditingController Password = TextEditingController();

  TextEditingController Email = TextEditingController();

  TextEditingController Mobile = TextEditingController();

  final globalScaffoldKey = GlobalKey<ScaffoldMessengerState>();


  Future sendData() async{
    await FirebaseFirestore.instance.collection('userData').doc().set({
      "Name":Name.text,
      "Password":Password.text,
      "Email":Email.text,
      "Mobile":Mobile.text,

    });
  }

  void validation() {

    if (Password.text.trim().isEmpty||Password.text.trim()==null) {
      globalScaffoldKey.currentState?.showSnackBar(SnackBar(content: Text("Password is empty"),duration:Duration(seconds: 3),));
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
                  hintText: "Name",
                  obscureText: false,
                  controller: Name,
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
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
