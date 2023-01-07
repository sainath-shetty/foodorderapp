import 'package:flutter/material.dart';
import 'package:food_order_app/widgets/text_field.dart';

class LoginPage extends StatelessWidget {


  TextEditingController name=TextEditingController();
  TextEditingController password=TextEditingController();

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
                  color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
            )),
            Column(
              children: [
               MyTextField(hintText: "Name", obscureText:false,controller: name),
                SizedBox(height: 30,),
               MyTextField(hintText: "Password", obscureText: true,controller: password,),
              ],
            ),

            Center(
              child: Container(
                height: 60,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Log In'),
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
