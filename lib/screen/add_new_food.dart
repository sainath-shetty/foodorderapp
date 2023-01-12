import 'dart:io';

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class AddFood extends StatefulWidget {
  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  File? image;

  Future pickImage(ImageSource Source) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('failed to pic the image:$e');
    }
  }

  create() async {
    DocumentReference documentReference =
        await FirebaseFirestore.instance.collection("food").add({
      'foodtitle': _foodtitle.text.trim(),
      'foodprice': _foodprice.text.trim(),
      'foodrating': _stars.text.trim(),
    });
  }

  final _foodimage = TextEditingController();

  final _foodtitle = TextEditingController();

  final _foodprice = TextEditingController();

  final _stars = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              image != null
                  ? Image.file(image!,width: 200,height: 200,)
                  : Container(
                      width: 200,
                      height: 200,
                      child: ElevatedButton(
                          onPressed: () =>pickImage(ImageSource.gallery),
                          child: Image.asset('images/add_food.png')),
                    ),
            ],
          ),
          Column(
            children: [
              TextFormField(
                controller: _foodtitle,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'This field is required';
                  }
                },
                decoration: InputDecoration(
                  hintText: "Enter the foodtitle",
                ),
              ),
              TextFormField(
                controller: _foodprice,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'This field is required';
                  }
                },
                decoration: InputDecoration(hintText: "Enter the foodprice"),
              ),
              TextFormField(
                controller: _stars,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'This field is required';
                  }
                },
                decoration: InputDecoration(hintText: "Enter the foodrating"),
              ),

              ///create a dropdown for selecting the category of the food
              ElevatedButton(
                  onPressed: () {
                    create();
                  },
                  child: Text("Add FOOD TO MENU")),
            ],
          )
        ],
      ),
    );
  }
}
