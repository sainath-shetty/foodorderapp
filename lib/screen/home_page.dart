import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  Widget categoriesContainer({required String images ,required String title}) {
    return Column(children: [
      SizedBox(height: 10,),
      Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(images),fit: BoxFit.fill,),
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      SizedBox(height: 10,),
      Text(title, style: TextStyle(fontSize: 20, color: Colors.black),)
    ],);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0.0,
        leading: Icon(Icons.sort),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage(
                'images/canteenIcon-removebg-preview.png'),

          )
        ],
      ),
      body: Column(
        children: [
          Container(height: 5,),


          TextField(

            decoration: InputDecoration(
                hintText: "Search for Food here",
                hintStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.search, color: Colors.white,),
                filled: true,
                fillColor: Colors.orangeAccent,

                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                )
            ),
          ),
        Row(
          children: [
            SizedBox(width: 30,),
            categoriesContainer(images: "images/fried_rice.png", title: "All"),
            SizedBox(width: 40,),
            categoriesContainer(images: "images/vada.png", title: "Snacks"),
            SizedBox(width: 40,),
            categoriesContainer(images: "images/pulav_rice.png", title: "Lunch")
          ],
        )
        ],
      ),

    );
  }
}
