import 'package:flutter/material.dart';
import 'package:food_order_app/screen/payment.dart';
import 'package:food_order_app/widgets/text_field.dart';

class AddToCart extends StatelessWidget {
  String image;
  TextEditingController user = TextEditingController();
  String title = "";
  String price = "";
  String stars = "";
  String category = "";
  TextEditingController quantity = TextEditingController();




  AddToCart(this.image, this.title, this.price, this.stars, this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: new Icon( Icons.arrow_back),onPressed: (){ Navigator.pop(context);},),
        title: Text("Add to Cart"),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              width: 500,
              height: 250,
              color: Colors.yellow,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.orange,
                //apply the background image here
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
          ),
          Row(
            children: [
              SizedBox(
                height: 100,
                width: 30,
              ),
              Text(
                "Rs $price",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
              SizedBox(
                width: 20,
              ),
              for (int i = 0; i < int.parse(stars); i++)
                Icon(
                  Icons.star,
                  size: 45,
                  color: Colors.yellow,
                ),
            ],
          ),
          TextFormField(

            decoration: InputDecoration(labelText: "Quantity",

            ),

            controller: quantity,
            keyboardType: TextInputType.number,
          ),

          SizedBox(
            height: 20,
          ),


          ElevatedButton(onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Payment(quantity,price,title),
                ));
          }, child: Text("Pay "))

        ],
      ),
    );
  }
}