import 'dart:convert';

import 'dart:io';

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';



class AddFood extends StatefulWidget {
  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {

  //
  // Future pickImage(ImageSource Source) async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (image == null) return;
  //
  //     final imageTemporary = File(image.path);
  //     setState(() => this.image = imageTemporary);
  //   } on PlatformException catch (e) {
  //     print('failed to pic the image:$e');
  //
  //   }
  // }
  PlatformFile?pickedFile;
  Future selectFile() async {
    final result=await FilePicker.platform.pickFiles();
    if(result==null) return;
  setState(() => pickedFile=result.files.first);
  }
  Future uploadFile() async{

    final path='files/${pickedFile!.name}';
    final file=File(pickedFile!.path!);
    final ref =FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);

  }
  //upload the image to the firebase storage
  //now get a reference to a firebase storage



  create() async {
    DocumentReference documentReference =
        await FirebaseFirestore.instance.collection("food").add({
          'foodimage':pickedFile!.name,
      'foodtitle': _foodtitle.text.trim(),
      'foodprice': _foodprice.text.trim(),
          'foodcategory':_foodcategory.text.trim(),
      'foodrating': _stars.text.trim(),
    });
  }



  final _foodtitle = TextEditingController();

  final _foodprice = TextEditingController();

  final _stars = TextEditingController();
  final _foodcategory = TextEditingController();
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
              pickedFile != null
                  ? Image.file(File(pickedFile!.path!),width: 200,height: 200,)
                  : Container(
                      width: 200,
                      height: 200,
                      child: ElevatedButton(
                          onPressed: () =>selectFile(),
                          child: Image.asset('images/add_food.png')
                      ,),

                    ),
            ],
          ),
          Column(children: [
            ElevatedButton(onPressed: ()=>uploadFile(), child: Text('Upload image'),)
          ],),
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
                controller: _foodcategory,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'This field is required';
                  }
                },
                decoration: InputDecoration(hintText: "Enter the foodcategory"),
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
