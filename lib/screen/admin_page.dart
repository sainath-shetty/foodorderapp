import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_order_app/screen/add_new_food.dart';

class AdminPage extends StatefulWidget {


  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Select Menu',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 110,
              ),
              Container(
                width: 200,
                height: 200,
                child: ElevatedButton(
                  onPressed: () { Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddFood()),
                  );},
                  child: Image.asset('images/add_menu.png'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Column(
            children: [
              Text(
                "Enter the new food info here",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          )
          //here display the list of food shown to the user and give the option to show the food or not
        ],
      ),
    );
  }
}
