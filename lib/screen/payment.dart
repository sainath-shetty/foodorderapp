import 'package:flutter/material.dart';

class Payment extends StatelessWidget {
  TextEditingController quantity = TextEditingController();
  String price = "";
  String title = "";

  Payment(this.quantity, this.price);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.keyboard_backspace_outlined),
        title: Text("Confirm Payment"),
        backgroundColor: Colors.black12,
      ),
      body: Column(
        children: [
          Center(
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                  height: 600,
                ),
                Column(
                  children: [
                    Text("Are you sure to initialize BankTransfer of",
                        style: TextStyle(color: Colors.black, fontSize: 22,fontWeight: FontWeight.bold)),
                    Row(

                        children: [
                          SizedBox(
                            height: 90,
                          ),
                          Icon(Icons.currency_rupee,size: 50,),
                    Text(
                      quantity.text == null
                          ? ""
                          : ((int.parse(quantity.text) * int.parse(price))
                              .toString()),
                      style: TextStyle(color: Colors.black, fontSize: 40,fontWeight: FontWeight.bold),
                    ),],),
                    SizedBox(height: 30,),
                    ElevatedButton(onPressed: (){


                    }, child: Text("Confirm"),style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black26,
                      side: BorderSide(width: 2,),
                      minimumSize: Size(200, 50),
                    ),)
                  ],

                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
