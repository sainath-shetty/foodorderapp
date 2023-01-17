import 'package:flutter/material.dart';

class AddToCart extends StatefulWidget {
  String image;
  String title = "";
  String price = "";
  String stars = "";
  String category = "";

  AddToCart(this.image, this.title, this.price, this.stars, this.category);

  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_rounded),
        title:Text("Add to Cart"),
      ),
    );
  }
}
