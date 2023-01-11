import 'package:flutter/material.dart';

class AddFood extends StatelessWidget {
  const AddFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Add new Food',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 180,
                child: Text(
                  'Add Food Image here',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 200,
                height: 200,
                child: ElevatedButton(
                    onPressed: () {},
                    child: Image.asset('images/add_food.png')),
              ),
            ],
          ),
          Column(
            children: [
              TextField(decoration: InputDecoration(hintText: "Enter the foodtitle"),),
              TextField(decoration: InputDecoration(hintText: "Enter the foodprice"),),
              TextField(decoration: InputDecoration(hintText: "Enter the foodrating"),),
              ///create a dropdown for selecting the category of the food
              ElevatedButton(onPressed: (){}, child: Text("Add FOOD TO MENU"))
            ],
          )
        ],
      ),
    );
  }
}
