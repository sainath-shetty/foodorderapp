import 'package:flutter/material.dart';

import 'login_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.orange,
            child: Center(
              child: Image.asset('images/canteenIcon2-removebg-preview.png'),
            ),
          ),
        ),
        Expanded(
            child: Container(
          child: Column(
              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
              children: [
            Text(
              'Canteen Food Order',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange),
            ),
            Container(height: 10,),
            Column(
              children: [
                Text(
                  'Now Order Canteen food with your mobile ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 100,
                  height: 100,
                ),
                Container(
                    width: 300,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: (){},
                      child: Text(
                        'Log In',
                        style: TextStyle(fontSize: 30),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                    )
                ),
                Container(height: 50,),
                Container(
                    width: 300,
                    height: 60,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 30,color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,

                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.orange,width: 5),
                          borderRadius: BorderRadius.circular(30))),
                )),
              ],
            )
          ]),
        ))
      ],
    ));
  }
}
