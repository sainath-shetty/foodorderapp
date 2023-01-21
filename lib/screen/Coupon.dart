import 'package:flutter/material.dart';
import 'package:food_order_app/screen/login_page.dart';
import 'package:food_order_app/screen/welcome_page.dart';
import 'package:intl/intl.dart';

class Coupon extends StatefulWidget {
  String title = "";
  TextEditingController quantity = TextEditingController();
  String price = "";

  Coupon(this.title, this.price, this.quantity);

  @override
  State<Coupon> createState() => _CouponState();
}

class _CouponState extends State<Coupon> {
  String time = "";

  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    dateTime = DateTime.now();
    setState(() {
      time = DateFormat('hh:MM:ss').format(DateTime.now()).toString();
    });
    return Scaffold(
      body: Center(
        child: Container(
          width: 400,
          height: 700,
          color: Colors.red,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "  ${widget.quantity.text}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 80,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "${widget.title}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Payment : Rs ${widget.price}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Time of Order : $time",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Image.asset('images/Smvitm logo.png'),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => WelcomePage()));
                  },
                  child: Text(
                    "Got the Food",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    side: BorderSide(color: Colors.yellow, width: 5),

                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
